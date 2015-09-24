class Showcase < ActiveRecord::Base
  belongs_to :user
  validates :user, :title, :description, :project_website_url, :GH_repo_url,
  :app_store_url, :google_play_url, presence: true

  has_many :comments, as: :parent
end
