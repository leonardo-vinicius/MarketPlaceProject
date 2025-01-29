require "test_helper"

class SoftwaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @software = softwares(:one)
  end

  test "should get index" do
    get softwares_url
    assert_response :success
  end

  test "should get new" do
    get new_software_url
    assert_response :success
  end

  test "should create software" do
    assert_difference("Software.count") do
      post softwares_url, params: { software: { category: @software.category, description: @software.description, name: @software.name, price: @software.price, seller_id: @software.seller_id, status: @software.status } }
    end

    assert_redirected_to software_url(Software.last)
  end

  test "should show software" do
    get software_url(@software)
    assert_response :success
  end

  test "should get edit" do
    get edit_software_url(@software)
    assert_response :success
  end

  test "should update software" do
    patch software_url(@software), params: { software: { category: @software.category, description: @software.description, name: @software.name, price: @software.price, seller_id: @software.seller_id, status: @software.status } }
    assert_redirected_to software_url(@software)
  end

  test "should destroy software" do
    assert_difference("Software.count", -1) do
      delete software_url(@software)
    end

    assert_redirected_to softwares_url
  end
end
