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
end