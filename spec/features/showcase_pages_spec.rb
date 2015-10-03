require "rails_helper"

describe "Showcase pages" do
  before do 
    @user = create_and_sign_in_user
    @showcase = FactoryGirl.create(:showcase)
  end

  describe "creation" do
    before do
      # Go to page
      visit "/"      
      click_link "Share Your Game"
    end

    it "creates a new showcase" do
      fill_in "Title*", with: "Showcase title"
      fill_in "Description*", with: "Showcase body"
      fill_in "Project Website*", with: "www.example.com"

      # attach_file Rails.root.join('spec', 'fixtures', 'example.png')
    end

    it "shows a success mesage" do
      expect(page).to have_content "Showcase was successfully created."
    end
  end

  # describe "updating" do
  #   before do
  #     @guide = FactoryGirl.create :guide

  #     visit "/guides/#{@guide.id}/edit"
  #     select "3D Games" , from: "guide[guide_category_id]"
  #     fill_in("Title", with: "Some Changed title")
  #     fill_in("Body markdown", with: "Example for changed body")
  #     click_button "Update Guide"
  #   end

  #   it "updates guide" do
  #     @guide.reload
  #     expect(@guide.title).to eq "Some Changed title"
  #     expect(@guide.body_markdown).to eq "Example for changed body"
  #     expect(@guide.category).to eq @category_game
  #   end
  # end
end
