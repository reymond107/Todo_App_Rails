require "minitest/autorun"

class TaskTest < ActiveSupport::TestCase

  
  test "should not save without name" do
    @category = Category.find(1)
    @task = @category.tasks.build(detail: 'sample detail', date: '11/12/2020')
    assert_not @task.save, notice: 'Opps! You did not put name!'
  end

  test "should not save without details" do
    @category = Category.find(1)
    @task = @category.tasks.build(name: 'sample detail', date: '11/12/2020')
    assert_not @task.save, notice: 'Opps! You did not put detail!'
  end

  test "should not save without date" do
    @category = Category.find(1)
    @task = @category.tasks.build(name: 'sample name', detail: 'sample detail')
    assert_not @task.save, notice: 'Opps! You did not put date!'
  end

  test "should not save without info" do
    @category = Category.find(1)
    @task = @category.tasks.build()
    assert_not @task.save, notice: 'Opps! You did not put any info!'
  end


end
