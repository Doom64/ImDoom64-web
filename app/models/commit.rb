class Commit < ApplicationRecord
  has_many :artifacts

  def permalink
    "https://github.com/Doom64/ImDoom64/commits/#{uid}"
  end
end
