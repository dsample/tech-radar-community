require "spec_helper"

describe ProductTechnologiesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_technologies").should route_to("product_technologies#index")
    end

    it "routes to #new" do
      get("/product_technologies/new").should route_to("product_technologies#new")
    end

    it "routes to #show" do
      get("/product_technologies/1").should route_to("product_technologies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_technologies/1/edit").should route_to("product_technologies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_technologies").should route_to("product_technologies#create")
    end

    it "routes to #update" do
      put("/product_technologies/1").should route_to("product_technologies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_technologies/1").should route_to("product_technologies#destroy", :id => "1")
    end

  end
end
