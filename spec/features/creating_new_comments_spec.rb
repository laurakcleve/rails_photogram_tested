require 'rails_helper.rb'

feature 'Creating comments' do

  scenario 'can comment on an existing post' do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user
    visit '/'
    fill_in "comment_content_#{post.id}", with: ';P'
    click_button 'submit'
    expect(page).to have_css("div#comments_#{post.id}", text: ';P')
  end

end