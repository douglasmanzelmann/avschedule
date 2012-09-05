require 'spec_helper'

describe "Static Pages" do
	subject { page } 

	describe "Home Page" do 
		before { visit root_path }

		it { should have_selector('title', text: "A/V Workspace") }
		it { should have_selector('h1', text: "A/V Workspace")}
		it { should have_selector('h3', text: "Today: #{Date.current}") } 
		it { should have_selector('h3', text: "New Task") }
	end
end
