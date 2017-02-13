Given(/^I am on the home page$/) do
  visit 'examples/novo/1'
end

Given(/^I am authenticated$/) do
  fill_in 'user_email', :with => "miriam@hotmail.com"
  fill_in 'user_password', :with => "1234567"
  click_button 'Entrar'
end

When(/^I follw "([^"]*)"$/) do |link|
  click_button "Criar"
end

When(/^I fill in the fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the article in the list$/) do
  pending # Write code here that turns the phrase above into concrete actions
end