require 'spec_helper'

describe "recommendations/edit" do
  before(:each) do
    @recommendation = assign(:recommendation, stub_model(Recommendation))
  end

  it "renders the edit recommendation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recommendations_path(@recommendation), :method => "post" do
    end
  end
end
