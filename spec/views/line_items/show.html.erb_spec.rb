require 'spec_helper'

describe "line_items/show" do
  before(:each) do
    @line_item = assign(:line_item, stub_model(LineItem,
      :table => nil,
      :working_change => "Working Change",
      :belongs_to => "Belongs To"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Working Change/)
    rendered.should match(/Belongs To/)
  end
end
