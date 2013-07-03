require 'spec_helper'

describe "product_technologies/show" do
  before(:each) do
    @product_technology = assign(:product_technology, stub_model(ProductTechnology))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
