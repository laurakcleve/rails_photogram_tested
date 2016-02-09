require 'rails_helper'

feature 'Editing posts' do

  background do
    user = create(:user)
    user_two = create (:user, email: 'hi@hi.com',
                              user_name: 'BennyBoy',
                              id: user.id + 1)
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: user.id + 1)

    sign_in_with user
    visit '/'
  end

  scenario 'Can edit a post as the owner' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit post')
    click_link 'Edit Post'
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'
    expect(page).to have_content("Post updated hombre.")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content("Something is wrong with your form!")
  end

end