class SponsoredPost < ActiveRecord::Base
  has_many :topics
  belongs_to :topics
end
