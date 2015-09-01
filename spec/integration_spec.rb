require "spec_helper"

describe("the admin path") do
  it('brings the user to an admin login page') do
    visit('/')
    click_button("Admin")
    expect(page).to have_content("Password")
  end
end
