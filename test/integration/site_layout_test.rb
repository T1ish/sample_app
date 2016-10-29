require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select "a[href=?]", root_path, count: 2
  	assert_select "a[href=?]", help_path
  	assert_select "a[href=?]", about_path
  	assert_select "a[href=?]", contact_path

  	# Exercise 2 from 5.3.4 
  	get contact_path
  	assert_select "title", full_title("Contact")

  	#Exercise 3 from 5.4.2
  	get signup_path
  	assert_select "title", full_title("Sign up")
  end
end
