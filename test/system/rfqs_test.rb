require "application_system_test_case"

class RfqsTest < ApplicationSystemTestCase
  setup do
    @rfq = rfqs(:one)
  end

  test "visiting the index" do
    visit rfqs_url
    assert_selector "h1", text: "Rfqs"
  end

  test "should create rfq" do
    visit rfqs_url
    click_on "New rfq"

    click_on "Create Rfq"

    assert_text "Rfq was successfully created"
    click_on "Back"
  end

  test "should update Rfq" do
    visit rfq_url(@rfq)
    click_on "Edit this rfq", match: :first

    click_on "Update Rfq"

    assert_text "Rfq was successfully updated"
    click_on "Back"
  end

  test "should destroy Rfq" do
    visit rfq_url(@rfq)
    click_on "Destroy this rfq", match: :first

    assert_text "Rfq was successfully destroyed"
  end
end
