require 'spec_helper'

describe "working_changes/index" do
  before(:each) do
    assign(:working_changes, [
      stub_model(WorkingChange),
      stub_model(WorkingChange)
    ])
  end

  it "renders a list of working_changes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
