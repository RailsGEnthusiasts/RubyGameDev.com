require 'rails_helper'

RSpec.describe Showcase, type: :model do
  it "only accepts images for its screenshot" do
    showcase = FactoryGirl.build :showcase, screenshot: test_file('example.png')
    expect(showcase).to be_valid

    showcase = FactoryGirl.build :showcase, screenshot: test_file('example.doc')
    expect(showcase).not_to be_valid
  end
end
