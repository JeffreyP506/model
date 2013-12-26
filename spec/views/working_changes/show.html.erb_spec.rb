require 'spec_helper'

describe "working_changes/show" do
  before(:each) do
    @working_change = assign(:working_change, stub_model(WorkingChange))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
