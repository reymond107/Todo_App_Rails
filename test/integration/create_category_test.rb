require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
    
    test 'should go to new category form and create category' do
        get new_category_path
        assert_response :success

        assert_difference 'Category.count',1 do 
            post categories_path, params: { category: {title: 'sample title', description: 'sample text'} }
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test 'should be able to update category' do
        @category = categories(:two)
        get edit_category_path(@category)
        assert_response :success

        assert_changes '@category.title' do 
            put category_path(@category),  params: { category: {title: 'new title', description: 'new sample text'} }
            @category.reload 
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end
 
    test '03: delete category' do
        @category = categories(:two)

        get edit_category_path(@category)
        assert_response :success

        assert_difference 'Category.count', -1 do
            delete category_path(@category)
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

end