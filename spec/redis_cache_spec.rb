require 'spec_helper'
 
describe "Testando Cache Ability redis" do

	Rails.cache.write("ability/1","12345")
	
 
end