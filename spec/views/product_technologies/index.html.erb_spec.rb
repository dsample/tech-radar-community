require 'spec_helper'

describe "product_technologies/index" do
  before(:each) do
    assign(:product_technologies, [
      stub_model(ProductTechnology),
      stub_model(ProductTechnology)
    ])
  end

  it "renders a list of product_technologies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
