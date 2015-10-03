require 'support/uploads'

FactoryGirl.define do
  factory :showcase do
    user
    title "Showcase Example Title"
    description "Some showcase explanations"

    screenshot do
      Support::Uploads.test_file('example.png')
    end

    project_website_url "www.someweb.com"
  end
end
