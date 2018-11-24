class Artifact < ApplicationRecord
  belongs_to :commit, required: true

  enum build_type: %i[win32]
  enum status: %i[success failed]
end
