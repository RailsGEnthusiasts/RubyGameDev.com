require "rails_helper"

describe "Guide pages" do
  before do
    @user = create_and_sign_in_user
    FactoryGirl.create(:guide_category)
    @category_game = FactoryGirl.create(:guide_category, name: "3D Games")
    @post = FactoryGirl.create(:internal_post, title: "Post Title")
  end

  describe "creation" do
    before do
      # Go to page
      visit "/guides/new"
      select "Some Category Name" , from: "guide[guide_category_id]"
      fill_in("Title", with: "Some title")
      fill_in("Body markdown", with: "Example body")
      click_button "Create Guide"
    end

    it "creates a new guide" do
      category = GuideCategory.find_by(name: "Some Category Name")

      expect(Guide.exists?(
        title: "Some title",
        body_markdown: "Example body",
        guide_category_id: category.id )).to be_truthy
    end

    it "shows a success message" do
      expect(page).to have_content "Guide was successfully created."
    end
  end

  describe "Update Guide" do
    before do
      @guide = FactoryGirl.create :guide, user: @user

      visit "/guides/#{@guide.id}/edit"
      select "3D Games" , from: "guide[guide_category_id]"
      fill_in("Title", with: "Some Changed title")
      fill_in("Body markdown", with: "Example for changed body")
      click_button "Update Guide"
    end

    it "confirms that guide is updated" do
      @guide.reload
      expect(@guide.title).to eq "Some Changed title"
      expect(@guide.body_markdown).to eq "Example for changed body"
      expect(@guide.category).to eq @category_game
    end
  end

  describe "'Edit' and 'Add Revision' links in view option" do
    before do
      sign_out
      @user = create_and_sign_in_user
    end

    it "shows 'Add Revision' link to the user, who is not the author of the guide" do
      @guide = FactoryGirl.create(:guide, title: "Some Guide title")
      visit "/posts/#{@guide.id}"

      within(".post") do
        expect(page).to have_text('Add Revision')
        expect(page).to_not have_text('Edit')
        expect(page).to_not have_text('Destroy')
      end
    end

    it "shows 'Edit' link to the author of the guide" do
      @guide = FactoryGirl.create(:guide, user: @user, title: "Some Guide title")
      visit "/posts/#{@guide.id}"

      within(".post") do
        expect(find_link('Edit').visible?).to be_truthy
      end
    end
  end

  describe "admin's view page" do
    it "shows 'Destroy' if user is admin" do
      sign_out
      sign_in($admin)

      @guide = FactoryGirl.create(:guide, title: "Some Guide title")
      visit "/posts/#{@guide.id}"

      within(".post") do
        expect(find_link('Destroy').visible?).to be_truthy
        expect(find_link('Edit').visible?).to be_truthy
      end
    end
  end
end
