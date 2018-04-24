class Publication < ApplicationRecord
  belongs_to :search

  def title
    primary_title   = JSON.parse(self.ris_hash)["primary_title"]
    secondary_title = JSON.parse(self.ris_hash)["secondary_title"]

    primary_title || secondary_title
  end

  def kind
    JSON.parse(self.ris_hash)["type"]
  end
end
