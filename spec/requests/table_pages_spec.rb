require 'spec_helper'


describe "Table Pages" do

  subject { page }

  describe "index page" do
    before { visit tables_path }

    it { should have_selector('h1', text: "Listing tables") }
    it { should have_title(full_title('Listing tables')) }
    it "should return same table once only"
    it "should disable the button after added to working_change"
  end
end
