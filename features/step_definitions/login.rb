# encoding: utf-8
# !/usr/bin/env ruby

Dado(/^que estou na pagina$/) do
  visit '/examples'
end

Quando(/^eu clicar em "([^"]*)"$/) do |link|
  click_link(link)
end

Quando(/^completar os campos$/) do
  fill_in 'Email', :with => "maria@hotmail.com"
  fill_in 'user_password', :with => "123456"
  click_button 'Entrar'
end

Então(/^eu devo estar logado na pagina$/) do
  have_content('maria@hotmail.com')
end