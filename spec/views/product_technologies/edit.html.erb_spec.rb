require 'spec_helper'

describe "product_technologies/edit" do
  before(:each) do
    @product_technology = assign(:product_technology, stub_model(ProductTechnology))
  end

  it "renders the edit product_technology form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_technologies_path(@product_technology), :method => "post" do
    end
  end
end
