require "spec_helper"

describe('the admin path', {:type=> :feature}) do
  it('brings user to the admin login page') do
    visit("/")
    click_link("Admin")
    expect(page).to have_content("Password")
  end

  it('brings user to the admin page') do
    visit('/admin_login')
    click_on('Submit')
    expect(page).to have_content("Welcome")
  end
end
