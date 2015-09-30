class Showcase < ActiveRecord::Base
  # extend Refile::Attachment
  #   attr_accessor :screenshot

    attachment :screenshot
    attachment :resume, extension: ["jpg", "jpeg", "png"]

  belongs_to :user
  validates :user, :title, :description, :project_website_url, presence: true

  has_many :comments, as: :parent

  def username
    self.user.username
  end
end
