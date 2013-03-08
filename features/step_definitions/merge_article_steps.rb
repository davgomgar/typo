
Given /^the logged user is an admin$/ do
  steps %{
  	Given the blog is set up
  	And I am logged into the admin panel
  }
end

Given /^the logged user is not an admin$/ do
  step %{the blog is set up}
  User.create!({:login => 'publisher',
                :password => 'fakepass',
                :email => 'joe@snsadow.com',
                :profile_id => 2,
                :name => 'publisher',
                :state => 'active'})
  #Login
  visit '/accounts/login'

  fill_in 'user_login', :with => 'publisher'
  fill_in 'user_password', :with => 'fakepass'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

