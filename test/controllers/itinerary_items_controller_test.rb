require "test_helper"

class ItineraryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary_item = itinerary_items(:one)
  end

  test "should get index" do
    get itinerary_items_url
    assert_response :success
  end

  test "should get new" do
    get new_itinerary_item_url
    assert_response :success
  end

  test "should create itinerary_item" do
    assert_difference("ItineraryItem.count") do
      post itinerary_items_url, params: { itinerary_item: { date: @itinerary_item.date, description: @itinerary_item.description, title: @itinerary_item.title, trip_id: @itinerary_item.trip_id } }
    end

    assert_redirected_to itinerary_item_url(ItineraryItem.last)
  end

  test "should show itinerary_item" do
    get itinerary_item_url(@itinerary_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_itinerary_item_url(@itinerary_item)
    assert_response :success
  end

  test "should update itinerary_item" do
    patch itinerary_item_url(@itinerary_item), params: { itinerary_item: { date: @itinerary_item.date, description: @itinerary_item.description, title: @itinerary_item.title, trip_id: @itinerary_item.trip_id } }
    assert_redirected_to itinerary_item_url(@itinerary_item)
  end

  test "should destroy itinerary_item" do
    assert_difference("ItineraryItem.count", -1) do
      delete itinerary_item_url(@itinerary_item)
    end

    assert_redirected_to itinerary_items_url
  end
end
