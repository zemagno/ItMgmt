# language: pt
require File.expand_path("../../../spec/rails_helper.rb",__FILE__)
require File.expand_path("../../../spec/spec_helper.rb",__FILE__)

require 'selenium-webdriver'


puts "Vou iniciar testes..."

Dado(/^que eu abri um browser$/) do
  # visit '/auth/google_oauth2'
  @browser = Selenium::WebDriver.for :firefox
end

Dado(/^que me loguei no sistema$/) do
  # visit '/auth/google_oauth2'

  @browser.navigate.to 'http://127.0.0.1:3000/auth/google_oauth2'
  @browser.find_element(:id, "Email").send_keys "zemagno@gmail.com"
  sleep(1)
  @browser.find_element(:id, "next").click
  sleep(1)
  @browser.find_element(:id, "Passwd").send_keys "Mmp1bk!!1"
  sleep(1)
  @browser.find_element(:id, "signIn").click
  sleep(5)
  @browser.find_element(:id, "submit_approve_access").click
  sleep(5)
  

end

Dado(/^que estou na pagina de gestao de usuarios$/) do
  # visit '/GestaoUsuarios'
  @browser.navigate.to 'http://127.0.0.1:3000/GestaoUsuarios'
end

E(/^preencho "([^"]*)" com "([^"]*)"$/) do |campo, valor|
  @browser.find_element(:id, campo).send_keys valor
  # fill_in campo, :with => valor
end

E(/^pressiono "([^"]*)"$/) do |botao|
  # click_button botao
  @browser.find_element(:name, botao).click

end

Entao(/^eu deveria ver "([^"]*)"$/) do |resultado|
  # puts "vou testar #{resultado}"
  page.should have_content(resultado)
end





# Given /^que estou logado no google$/ do
#   visit "/auth/google_oauth2"
# end

# Dado /^que estou na pagina de gestao de usuarios$/ do
#   visit 'GestaoUsuarddios'
# end

# E /^preencho "([^"]*)" com "([^"]*)"$/ do |campo,valor|
# 	fill_in campo, :with => valor
# end

# E /^pressiono "([a-zA-Z]*)"$/ do |botao|
# 	click_button botao
# end

# Entao(/^eu deveria ver "([^"]*)"$/) do |resultado|
# 	puts "vou testar #{resultado}"
# 	page.should have_content(resultado)
# end
