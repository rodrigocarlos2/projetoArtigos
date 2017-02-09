require 'test_helper'

class FolderUsersControllerTest < ActionController::TestCase
  setup do
    @folder_user = folder_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:folder_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create folder_user" do
    assert_difference('FolderUser.count') do
      post :create, folder_user: { folder_id: @folder_user.folder_id, user_id: @folder_user.user_id }
    end

    assert_redirected_to folder_user_path(assigns(:folder_user))
  end

  test "should show folder_user" do
    get :show, id: @folder_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @folder_user
    assert_response :success
  end

  test "should update folder_user" do
    patch :update, id: @folder_user, folder_user: { folder_id: @folder_user.folder_id, user_id: @folder_user.user_id }
    assert_redirected_to folder_user_path(assigns(:folder_user))
  end

  test "should destroy folder_user" do
    assert_difference('FolderUser.count', -1) do
      delete :destroy, id: @folder_user
    end

    assert_redirected_to folder_users_path
  end
end
