require "rails_helper"

RSpec.describe ChecklistItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/checklist_items").to route_to("checklist_items#index")
    end

    it "routes to #new" do
      expect(:get => "/checklist_items/new").to route_to("checklist_items#new")
    end

    it "routes to #show" do
      expect(:get => "/checklist_items/1").to route_to("checklist_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/checklist_items/1/edit").to route_to("checklist_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/checklist_items").to route_to("checklist_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/checklist_items/1").to route_to("checklist_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/checklist_items/1").to route_to("checklist_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/checklist_items/1").to route_to("checklist_items#destroy", :id => "1")
    end

  end
end
