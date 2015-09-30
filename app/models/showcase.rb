class Showcase < ActiveRecord::Base
  belongs_to :user
  validates :user, :title, :description, :project_website_url, presence: true

  has_many :comments, as: :parent

  def username
    self.user.username
  end
end
