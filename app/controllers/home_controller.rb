class HomeController < ApplicationController
  ##
  # GET /
  def index
    @win32 = Artifact.win32.last

    @commits = Commit.joins(:artifacts).includes(:artifacts).last(5)
  end
end
