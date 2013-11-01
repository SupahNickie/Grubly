require "test_helper"

feature "A consumer tries to place order and then edit it before payment" do
  scenario "The consumer can edit order" do
    # Given a consumer is signed in and visits the restaurant show page
    sign_in_consumer
    visit new_restaurant_order_path(restaurants(:restaurant1).id)
    click_on "Create Order"
    click_on "Show"
    click_on "Add to Order"
    select(items(:dish1).dish_name)
    fill_in "Quantity", with: "2"
    click_on "Create Ordered item"

    # When they click edit order
    click_on "Edit Item"
    # And they select a dish from the order form
    select(items(:dish2).dish_name)
    # And enter quantity
    fill_in "Quantity", with: "5"
    # And then submit the form
    click_on "Update Ordered item"
    # Then consumer should see a confirmation message
    page.must_have_content "Order was successfully updated"
  end
end
