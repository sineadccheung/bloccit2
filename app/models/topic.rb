class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  has_many :labelings, as: :labelable
 # #13
   has_many :labels, through: :labelings
scope :visible_to, -> (user) { user ? all : publically_viewable }
scope :publically_viewable, -> { where(public: true)}
scope :privately_viewable, -> { where(public: false)}
  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true

end
