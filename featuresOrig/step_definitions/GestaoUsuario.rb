# language: pt
require File.expand_path("../../../spec/rails_helper.rb",__FILE__)
require File.expand_path("../../../spec/spec_helper.rb",__FILE__)

require 'selenium-webdriver'

# require 'capybara/cucumber'
# DOC: https://github.com/rspec/rspec-expectations
# DOC: http://www.rubydoc.info/gems/selenium-webdriver/0.0.28/Selenium/WebDriver/Driver


RSpec::Expectations.configuration.on_potential_false_positives = :nothing

Dado(/^que eu abri um browser$/) do
  # visit '/auth/google_oauth2'
  @browser = Selenium::WebDriver.for :firefox
end

def fill_in (field, params) 
  # puts "#{field} #{params[:with]}"
  @browser.find_element(:id, field).send_keys params[:with]
end

def click_button (button)
  @browser.find_element(:name, button).click
  sleep(2)
end

def click_button2 (button)
  # ERRO - se nao mudar da pagina, o codigo abaixo da erro..
  # old = @browser.window_handles
  @browser.find_element(:link_text, button).click
  sleep(1)
  # @currentPage=(@browser.window_handles-old)[0]
  # @browser.switch_to.window(@currentPage)
end


def visit (uri)
  @browser.navigate.to "#{@url}#{uri}"
end

Dado(/^que o usuario é "([^"]*)" e a senha é "([^"]*)"$/) do |usuario, senha|
  @usuario = usuario
  @senha = "Mmp1bk!!1"
end

Dado(/^que o perfil do usuario é "([^"]*)"$/) do |perfil|
  u = User.where(:email => @usuario).first
  u.roles = perfil
  u.save!
  # pending # Write code here that turns the phrase above into concrete actions
end

Dado(/^que me loguei no sistema na URL "([^"]*)"$/) do |url|

  @url = url 
  @browser.navigate.to "#{@url}/users/auth/google_oauth2"
  @browser.find_element(:id, "Email").send_keys @usuario
  @browser.find_element(:id, "next").click
  sleep(1)
  @browser.find_element(:id, "Passwd").send_keys @senha
  @browser.find_element(:id, "signIn").click
  sleep(5)
  @browser.find_element(:id, "submit_approve_access").click
  sleep(5)
  
end

Dado(/^que estou na pagina de gestao de usuarios$/) do
  visit '/GestaoUsuarios'
end

E(/^preencho "([^"]*)" com "([^"]*)"$/) do |campo, valor|
  fill_in campo, :with => valor
end


E(/^pressiono "([^"]*)"$/) do |botao|
  click_button botao
end

E(/^clico em "([^"]*)"$/) do |botao|
  click_button2 botao
end

Entao(/^eu deveria ver o texto "([^"]*)"$/) do |texto|
  expect(@browser.page_source).to include(texto)
end

Entao(/^eu NAO deveria ver o texto "([^"]*)"$/) do |texto|
  expect(@browser.page_source).not_to include(texto)
end

Entao(/^eu volto para a pagina atual$/) do 
   @browser.switch_to.window(@browser.window_handles.first)
end

Entao(/^eu deveria ver o link "([^"]*)"$/) do |link|
  expect { @browser.find_element(:link_text, link) }.not_to raise_error
end

Entao(/^eu NAO deveria ver o link "([^"]*)"$/) do |link|
  expect { @browser.find_element(:link_text, link) }.to raise_error
end


Entao(/^finalizo fechando o browser$/) do
  @browser.close
end

Dado(/^que o perfil do usuario "([^"]*)" é "([^"]*)"$/) do |usuario, perfil|

end


