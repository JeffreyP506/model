require "spec_helper"

describe WorkingChangesController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/working_changes")).to route_to("working_changes#index")
    end

    it "routes to #new" do
      expect(get("/working_changes/new")).to route_to("working_changes#new")
    end

    it "routes to #show" do
      expect(get("/working_changes/1")).to route_to("working_changes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/working_changes/1/edit")).to route_to("working_changes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/working_changes")).to route_to("working_changes#create")
    end

    it "routes to #update" do
      expect(put("/working_changes/1")).to route_to("working_changes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/working_changes/1")).to route_to("working_changes#destroy", :id => "1")
    end

  end
end
