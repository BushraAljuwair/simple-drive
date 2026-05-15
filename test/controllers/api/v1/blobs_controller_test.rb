require "test_helper"

class Api::V1::BlobsControllerTest < ActionDispatch::IntegrationTest
  TOKEN = "Bearer my-secret-token"


  test "should store blob" do
    post "/api/v1/blobs",
      params: {
        id: "test-unit",
        data: "SGVsbG8="
      }.to_json,
      headers: {
        "Authorization" => TOKEN,
        "Content-Type" => "application/json"
      }

    assert_response :created
  end



  test "should get blob" do
    post "/api/v1/blobs",
      params: {
        id: "test-get",
        data: "SGVsbG8="
      }.to_json,
      headers: {
        "Authorization" => TOKEN,
        "Content-Type" => "application/json"
      }


    get "/api/v1/blobs/test-get",
      headers: {
        "Authorization" => TOKEN
      }

    assert_response :success
  end



  test "should reject unauthorized request" do
    get "/api/v1/blobs/test-unit"

    assert_response :unauthorized
  end
end
