require 'spec_helper'

describe "recommendations/index" do
  before(:each) do
    assign(:recommendations, [
      stub_model(Recommendation),
      stub_model(Recommendation)
    ])
  end

  it "renders a list of recommendations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
