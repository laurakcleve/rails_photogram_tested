require 'rails_helper'

feature 'Index displays a list of posts' do

  background do
    user = create(:user)
    sign_in_with user
    job_one = create(:post, user: user, caption: "This is post one")
    job_two = create(:post, user: user, caption: "This is the second post")
  end

  scenario 'the index displays correct created job information' do
    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='snowy']")
  end

end