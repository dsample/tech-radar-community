require 'spec_helper'

describe "recommendations/new" do
  before(:each) do
    assign(:recommendation, stub_model(Recommendation).as_new_record)
  end

  it "renders new recommendation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recommendations_path, :method => "post" do
    end
  end
end
