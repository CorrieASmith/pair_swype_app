require "spec_helper"

describe('the admin path', {:type=> :feature}) do
  it('brings user to the admin login page') do
    visit("/")
    click_link("Admin")
    expect(page).to have_content("Submit")
  end

  it('brings user to the admin page') do
    visit('/admin_login')
    click_on('Submit')
    expect(page).to have_content("Welcome")
  end

  it('allows the admin to add a new question') do
    visit('/admin')
    fill_in("description", :with => "I am most successful when:")
    click_button("Add")
    expect(page).to have_content("I am most successful when:")
  end
end
