require 'spec_helper'

describe "product_technologies/new" do
  before(:each) do
    assign(:product_technology, stub_model(ProductTechnology).as_new_record)
  end

  it "renders new product_technology form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_technologies_path, :method => "post" do
    end
  end
end
