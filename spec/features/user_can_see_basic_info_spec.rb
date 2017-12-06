require 'rails_helper'

describe "As a logged-in user I can" do
  it "see basic information about my account"
  # login
  visit github_user_index_path
  expect(page).to have_content
end

View basic information about my account (profile pic, number of starred repos, followers, following)
