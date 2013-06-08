require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { area: @user.area, birth_year: @user.birth_year, city: @user.city, country: @user.country, district: @user.district, email: @user.email, f_name: @user.f_name, gender: @user.gender, image: @user.image, l_name: @user.l_name, phone: @user.phone, postal: @user.postal, profession: @user.profession }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { area: @user.area, birth_year: @user.birth_year, city: @user.city, country: @user.country, district: @user.district, email: @user.email, f_name: @user.f_name, gender: @user.gender, image: @user.image, l_name: @user.l_name, phone: @user.phone, postal: @user.postal, profession: @user.profession }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
