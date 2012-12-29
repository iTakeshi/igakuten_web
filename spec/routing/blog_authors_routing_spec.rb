require "spec_helper"

describe BlogAuthorsController do
  describe "routing" do

    it "routes to #index" do
      get("/blog_authors").should route_to("blog_authors#index")
    end

    it "routes to #new" do
      get("/blog_authors/new").should route_to("blog_authors#new")
    end

    it "routes to #edit" do
      get("/blog_authors/1/edit").should route_to("blog_authors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blog_authors").should route_to("blog_authors#create")
    end

    it "routes to #update" do
      put("/blog_authors/1").should route_to("blog_authors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blog_authors/1").should route_to("blog_authors#destroy", :id => "1")
    end

  end
end
