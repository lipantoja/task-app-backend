require "test_helper"

class CategoryControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/categories.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Category.count, data.length
  end

  test "create" do
    assert_difference "Category.count", 1 do
      post "/category.json", params: { name: "lake", width: 800, height: 600 }
      assert_response 200
    end
  end

  test "show" do
    get "/category/#{Category.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "created_at", "updated_at"], data.keys
  end
end
