require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do
    before { visit '/static_pages/home' }
    it "should have the content 'Model Manager'" do
      expect(page).to have_content('Model Manager')
    end

    it "should have the base title" do
      expect(page).to have_title("Model Manager")
    end

    it "should not have a custom page title" do
      expect(page).not_to have_title("| Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Model Manager | Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Model Manager | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("Model Manager | About Us")
    end
  end
end
