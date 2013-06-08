require 'spec_helper'

describe "technologies/edit" do
  before(:each) do
    @technology = assign(:technology, stub_model(Technology,
      :category => nil,
      :name => "MyString",
      :summary => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit technology form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => technologies_path(@technology), :method => "post" do
      assert_select "input#technology_category", :name => "technology[category]"
      assert_select "input#technology_name", :name => "technology[name]"
      assert_select "textarea#technology_summary", :name => "technology[summary]"
      assert_select "textarea#technology_description", :name => "technology[description]"
    end
  end
end
