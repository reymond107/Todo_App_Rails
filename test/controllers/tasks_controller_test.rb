require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:one)
    @task = tasks(:one)
    @ids = {category_id: @task.category_id, id:  @task.id}
    @params = {params: {task: {id: '1', name: 'Personal', detail: 'MyText', date: 'MyDate', category_id: '1'}}}
  end

  test "should get index" do
    get category_tasks_path(@category)
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test 'should create' do
    post category_tasks_path(@category), @params
    assert_response :success
  end

  test 'should update' do
    patch category_task_path(:id => @task.id, :category_id => @task.category_id), @params
    assert_equal 'Personal', assigns(:task).name
  end

  test 'should get delete' do 
    get category_task_path(@ids)

    assert_response :success
  end

  test 'should show' do
    get category_task_path(@ids)
    assert_response :success
  end

end
