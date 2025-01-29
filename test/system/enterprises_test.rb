require "application_system_test_case"

class EnterprisesTest < ApplicationSystemTestCase
  setup do
    @enterprise = enterprises(:one)
  end

  test "visiting the index" do
    visit enterprises_url
    assert_selector "h1", text: "Enterprises"
  end

  test "should create enterprise" do
    visit enterprises_url
    click_on "New enterprise"

    fill_in "Cnpj", with: @enterprise.cnpj
    fill_in "Email", with: @enterprise.email
    fill_in "Name", with: @enterprise.name
    fill_in "Phone", with: @enterprise.phone
    fill_in "Seller", with: @enterprise.seller_id
    click_on "Create Enterprise"

    assert_text "Enterprise was successfully created"
    click_on "Back"
  end

  test "should update Enterprise" do
    visit enterprise_url(@enterprise)
    click_on "Edit this enterprise", match: :first

    fill_in "Cnpj", with: @enterprise.cnpj
    fill_in "Email", with: @enterprise.email
    fill_in "Name", with: @enterprise.name
    fill_in "Phone", with: @enterprise.phone
    fill_in "Seller", with: @enterprise.seller_id
    click_on "Update Enterprise"

    assert_text "Enterprise was successfully updated"
    click_on "Back"
  end

  test "should destroy Enterprise" do
    visit enterprise_url(@enterprise)
    click_on "Destroy this enterprise", match: :first

    assert_text "Enterprise was successfully destroyed"
  end
end
