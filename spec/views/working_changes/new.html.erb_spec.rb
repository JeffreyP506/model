require 'spec_helper'

describe "working_changes/new" do
  before(:each) do
    assign(:working_change, stub_model(WorkingChange).as_new_record)
  end

  it "renders new working_change form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", working_changes_path, "post" do
    end
  end
end
