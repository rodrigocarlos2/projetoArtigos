Given(/^I am on the home page$/) do
  visit new_example_path
end

Given(/^I am authenticated$/) do
  fill_in 'user_email', :with => "miriam@hotmail.com"
  fill_in 'user_password', :with => "1234567"
  click_button 'Entrar'
end

Given /^I visit the new example page$/ do
	visit new_example_path
end
 
When /^I fill the new example form$/ do
	click_button 'New'
end
 
When /^click on the 'Create' button$/ do
end

When(/^I fill in the fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the article in the list$/) do
  pending # Write code here that turns the phrase above into concrete actions
end