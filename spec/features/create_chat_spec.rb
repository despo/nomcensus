require 'spec_helper'

feature 'create chat' do
  it "can create a new chat" do
    visit root_path
    click_on "Create chat"

    fill_in :chat_name, with: "Ten Forward"
    click_on "Create"

    expect(page).to have_content "Ten Forward"
  end

end
