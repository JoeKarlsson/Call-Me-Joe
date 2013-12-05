require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Call Me Joe'" do
      visit '/static_pages/home'
      expect(page).to have_content('Call Me Joe')
    end 
    it "should have the right title" do
  	   visit '/static_pages/home'
       expect(page).to have_title("Call Me Joe | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the right title" do
  	   visit '/static_pages/home'
       expect(page).to have_title("Call Me Joe | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Me'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Me')
    end
    it "should have the right title" do
  	   visit '/static_pages/home'
       expect(page).to have_title("Call Me Joe | About Me")
    end
  end

end