require 'spec_helper'

describe "WorkingChanges" do
  describe "WorkingChange" do
  	pending "not necessary" do
	    subject { page }

	    before {  }

	    working_change = stub('working_change')
	    visit working_change_path(working_change)

	    it { should have_title('Working change') }
	    it { should have_content('Working change') }
	    it { should have_content('Download CSV') }
	    it { should have_content('Clear') }
	  end

	  describe "@tables#index" do
		  describe "Remove table from working_change" do
		  	it "should have button 'Remove'"
		  end

		  describe "Add new table" do
		  	it "should have button 'Add new table'"

		  	describe "as signed in user" do
		  		it "should be redirect to new_table_path"	
		  	end

		  	describe "as non-signed in user" do
		  		it "should be redirect to signin page"
		  	end
		  end
	  end

	  describe "@working_changes#show" do
	  	
	  end
  end
end
