require 'spec_helper'

describe "working_changes/edit" do
  before(:each) do
    @working_change = assign(:working_change, stub_model(WorkingChange))
  end

  it "renders the edit working_change form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", working_change_path(@working_change), "post" do
    end
  end
end
