
Given /^the logged user is an admin$/ do
  steps %{
  	Given the blog is set up
  	And I am logged into the admin panel
  }
end

Given /^a publisher user exists$/ do

  User.create!({:login => 'publisher',
                :password => 'fakepass',
                :email => 'joe@snsadow.com',
                :profile_id => 2,
                :name => 'publisher',
                :state => 'active'})
end

When /^I log as a publisher$/ do
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

Given /^the logged user is not an admin$/ do
  steps %{Given the blog is set up
          And a publisher user exists
          When I log as a publisher
        }  
end

Given /^two articles exist$/ do
  Article.create!(type: :article, :title => "Feature Article #1", :author => "admin", 
    :body => " This is article 1 created from a feature", :published => true)
  Article.create!(type: :article, :title => "Feature Article #2", :author => "admin", 
    :body => " This is article 2 being created from a feature", :published => true)
end

When /^I merge the article with the article (\d+)$/ do |article_id|
  steps %{
          When I fill in "merge_with" with "#{article_id}"
          And I fill in the hidden "current_id" with "1"
          And I press "Merge"
         }
end

Then /^I should see the articles merged$/ do
  step %{I should see "The articles were merged"}
end



