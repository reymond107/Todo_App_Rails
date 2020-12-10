require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test 'should not validate category without title' do
    category = Category.new(description: 'sample text')
    assert_not category.save
  end

  test 'should not validate category without description' do
    category = Category.new(title: 'sample title')
    assert_not category.save
  end

  test 'should not validate category without title and description' do
    category = Category.new
    assert_not category.save
  end
end
