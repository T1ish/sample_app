require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
  	get static_pages_about_url
  	assert_response :success
  	assert_select "title", "About | Ruby on Rails Tutorial Sample App"
  end

  test "should get contact" do
  	get static_pages_contact_url
  	assert_response :success
  	assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
  	get root_url
  	assert_response :success
  end

=begin  
#Another way to do it instead of having redundant text is 
#by using variales for the text and use it in the tests.

  def setup
  	@base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
  	get static_pages_about_url
  	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end
=end
end
