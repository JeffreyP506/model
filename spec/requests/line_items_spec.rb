require 'spec_helper'

describe "LineItems" do
  describe "GET /line_items" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get line_items_path
      expect(response.status).to be(200)
    end
  end
end
