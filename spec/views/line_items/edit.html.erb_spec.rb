require 'spec_helper'

describe "line_items/edit" do
  before(:each) do
    @line_item = assign(:line_item, stub_model(LineItem,
      :table => nil,
      :working_change => "MyString",
      :belongs_to => "MyString"
    ))
  end

  it "renders the edit line_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", line_item_path(@line_item), "post" do
      assert_select "input#line_item_table[name=?]", "line_item[table]"
      assert_select "input#line_item_working_change[name=?]", "line_item[working_change]"
      assert_select "input#line_item_belongs_to[name=?]", "line_item[belongs_to]"
    end
  end
end
