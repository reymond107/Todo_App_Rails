require "minitest/autorun"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
	
	
    test "should get index" do
        get categories_url
        assert_response :success
    end

    test 'should get new' do 
        get new_category_url
        assert_response :success
    end

    test 'should create' do
        post categories_path, params: { category: {title: 'Personal', description: 'This is personal, none of your business'} }
        assert_response :success
    end

    test 'should update' do
        patch category_path(:id => categories(:one)), params: { category: {title: 'Personal', description:'This is personal, none of your business'} }
        assert_equal 'Personal', assigns(:category).title
    end

    test 'should show' do
        get category_path(:id => 1)
        assert_response :success
    end

    test 'should edit' do
        get category_path(:id => 1)
        assert_response :success
    end

    test 'should get delete' do 
        delete category_path(:id => 1)
        assert_response :redirect
    end

end

