require "test_helper"

class RfqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rfq = rfqs(:one)
  end

  test "should get index" do
    get rfqs_url
    assert_response :success
  end

  test "should get new" do
    get new_rfq_url
    assert_response :success
  end

  test "should create rfq" do
    assert_difference("Rfq.count") do
      post rfqs_url, params: { rfq: {} }
    end

    assert_redirected_to rfq_url(Rfq.last)
  end

  test "should show rfq" do
    get rfq_url(@rfq)
    assert_response :success
  end

  test "should get edit" do
    get edit_rfq_url(@rfq)
    assert_response :success
  end

  test "should update rfq" do
    patch rfq_url(@rfq), params: { rfq: {} }
    assert_redirected_to rfq_url(@rfq)
  end

  test "should destroy rfq" do
    assert_difference("Rfq.count", -1) do
      delete rfq_url(@rfq)
    end

    assert_redirected_to rfqs_url
  end
end
