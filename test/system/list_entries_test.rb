require "application_system_test_case"

class ListEntriesTest < ApplicationSystemTestCase
  setup do
    @list_entry = list_entries(:one)
  end

  test "visiting the index" do
    visit list_entries_url
    assert_selector "h1", text: "List entries"
  end

  test "should create list entry" do
    visit list_entries_url
    click_on "New list entry"

    fill_in "List", with: @list_entry.list_id
    fill_in "Name", with: @list_entry.name
    fill_in "Order number", with: @list_entry.order_number
    fill_in "Value", with: @list_entry.value
    click_on "Create List entry"

    assert_text "List entry was successfully created"
    click_on "Back"
  end

  test "should update List entry" do
    visit list_entry_url(@list_entry)
    click_on "Edit this list entry", match: :first

    fill_in "List", with: @list_entry.list_id
    fill_in "Name", with: @list_entry.name
    fill_in "Order number", with: @list_entry.order_number
    fill_in "Value", with: @list_entry.value
    click_on "Update List entry"

    assert_text "List entry was successfully updated"
    click_on "Back"
  end

  test "should destroy List entry" do
    visit list_entry_url(@list_entry)
    click_on "Destroy this list entry", match: :first

    assert_text "List entry was successfully destroyed"
  end
end
