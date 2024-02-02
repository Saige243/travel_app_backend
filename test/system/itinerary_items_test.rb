require "application_system_test_case"

class ItineraryItemsTest < ApplicationSystemTestCase
  setup do
    @itinerary_item = itinerary_items(:one)
  end

  test "visiting the index" do
    visit itinerary_items_url
    assert_selector "h1", text: "Itinerary items"
  end

  test "should create itinerary item" do
    visit itinerary_items_url
    click_on "New itinerary item"

    fill_in "Date", with: @itinerary_item.date
    fill_in "Description", with: @itinerary_item.description
    fill_in "Title", with: @itinerary_item.title
    fill_in "Trip", with: @itinerary_item.trip_id
    click_on "Create Itinerary item"

    assert_text "Itinerary item was successfully created"
    click_on "Back"
  end

  test "should update Itinerary item" do
    visit itinerary_item_url(@itinerary_item)
    click_on "Edit this itinerary item", match: :first

    fill_in "Date", with: @itinerary_item.date
    fill_in "Description", with: @itinerary_item.description
    fill_in "Title", with: @itinerary_item.title
    fill_in "Trip", with: @itinerary_item.trip_id
    click_on "Update Itinerary item"

    assert_text "Itinerary item was successfully updated"
    click_on "Back"
  end

  test "should destroy Itinerary item" do
    visit itinerary_item_url(@itinerary_item)
    click_on "Destroy this itinerary item", match: :first

    assert_text "Itinerary item was successfully destroyed"
  end
end
