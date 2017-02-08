# encoding: utf-8
# !/usr/bin/env ruby

Quando(/^eu estiver na pagina$/) do
  visit '/examples'
end

Quando(/^clicar em "([^"]*)"$/) do |link|
  click_link(link)
end

Quando(/^preencher o formulario$/) do
  fill_in 'Email', :with => "lily@hotmail.com"
  fill_in 'user_password', :with => "123456"
  fill_in 'user_password_confirmation', :with => "123456"
  click_button 'Cadastrar'
end

Então(/^eu devo estar cadastrado na pagina$/) do
  have_content('lily@hotmail.com')
end