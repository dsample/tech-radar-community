require 'spec_helper'

describe "recommendations/show" do
  before(:each) do
    @recommendation = assign(:recommendation, stub_model(Recommendation))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
