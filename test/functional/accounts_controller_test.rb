require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @user = Factory(:user)
    @account = Factory(:account, :user => @user)
    sign_in(@user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, :account => @account.attributes
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    Retriever.any_instance.expects(:find).never
    get :show, :id => @account.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @account.to_param
    assert_response :success
  end

  test "should update account" do
    put :update, :id => @account.to_param, :account => @account.attributes
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, :id => @account.to_param
    end

    assert_redirected_to accounts_path
  end

  test "should fetch mail" do
    retriever = Retriever.any_instance
    retriever.expects(:last).with(:count => 10, :order => :desc).returns([])
    xhr :get, :fetch, :id => @account.to_param
    assert_response :success
  end

  test "should fetch mail from a specific mailbox" do
    retriever = Retriever.any_instance
    retriever.expects(:last).with(:count => 10, :order => :desc, :mailbox => "Travel").returns([])
    xhr :get, :fetch, :id => @account.to_param, :mailbox => "Travel"
    assert_response :success
  end

  test "should get mailboxes" do
    retriever = Retriever.any_instance
    retriever.expects(:mailboxes).returns([stub(:name => "INBOX")])
    xhr :get, :mailboxes, :id => @account.to_param
    assert_response :success
  end

  test "should get child mailboxes" do
    retriever = Retriever.any_instance
    retriever.expects(:mailboxes).with("Travel").returns([stub(:name => "Space")])
    xhr :get, :mailboxes, :id => @account.to_param, :mailbox => "Travel"
    assert_response :success
  end
end
