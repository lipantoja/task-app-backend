require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/todos.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Todo.count, data.length
  end
  # tested index

  # test "create" do
  #   assert_difference "Todo.count", 1 do
  #     post "/todos.json", params: { name: "lake", width: 800, height: 600 }
  #     assert_response 200
  #   end
  # end
  test "show" do
    get "/todos/#{Todo.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "category_id", "title", "description", "deadline", "completed", "created_at", "updated_at"], data.keys
  end

  # test "update" do
  #   todo = Todo.first
  #   patch "/todos/#{todo.id}.json", params: { name: "Updated name" }
  #   assert_response 200

  #   data = JSON.parse(response.body)
  #   assert_equal "Updated name", data["name"]
  # end
  test "destroy" do
    assert_difference "Todo.count", -1 do
      delete "/todos/#{Todo.first.id}.json"
      assert_response 200
    end
  end
end