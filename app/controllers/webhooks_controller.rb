class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :appveyor

  ##
  # POST /webhook/appveyor
  def appveyor
    if request.headers['HTTP_X_WEBHOOK_SECRET'] != ENV.fetch('APPVEYOR_WEBHOOK_SECRET')
      head :no_content
      return
    end

    event_data              = params.require(:eventData)
    passed                  = event_data.require(:passed)
    commit_id               = event_data.require(:commitId)
    commit_author           = event_data.require(:commitAuthor)
    commit_author_email     = event_data.require(:commitAuthorEmail)
    commit_message          = event_data.require(:commitMessage)
    commit_message_extended = event_data.require(:commitMessageExtended)

    jobs = event_data.require(:jobs)
    if jobs.empty?
      head :no_content
      return
    end

    artifacts = jobs.first.require(:artifacts)
    if artifacts.empty?
      head :no_content
      return
    end

    permalink = artifacts.first.require(:permalink)

    c = Commit.find_or_create_by!(uid: commit_id) do |commit|
      commit.author = commit_author
      commit.author_email = commit_author_email
      commit.summary = commit_message
      commit.description = commit_message_extended
    end

    Artifact.win32.create!(
      commit: c,
      status: (passed ? :success : :failed),
      permalink: permalink
    )
  end
end
