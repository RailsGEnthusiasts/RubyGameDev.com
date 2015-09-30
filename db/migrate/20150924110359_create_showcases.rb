class CreateShowcases < ActiveRecord::Migration
  def change
    create_table :showcases do |t|
      t.string :title
      t.text :description
      t.string :screenshot_id
      t.string :project_website_url
      t.string :gh_repo_url
      t.string :app_store_url
      t.string :google_play_url
      t.integer :user_id

      t.timestamps
    end
  end
end
