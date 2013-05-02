require 'spec_helper'

describe "Static pages" do

  # !!The code below is not needed because full_title function has been defined
  # in spec/support/utilities.rb that has the same definition, this is left here
  # for reference:
  # This runs the same code before each example in the file:
  # before(:each) do
  #  @base_title = "Ruby on Rails Tutorial Sample App"
  # end
  
  # Instead of using page.should have_selector, subject {page} will
  # eliminate the need to have 'page.'
  subject { page }
  
  # Old fragment inside 'describe "home page" do'
  # more verbose but still useful to know:
  
  #    Old code fragment:
  #  it "should have the content 'Sample App'" do
  #    #page.should have_content('Sample App')
  #    page.should have_selector('h1', :text => 'Sample App')
  #  end
  
  
  
  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end
end