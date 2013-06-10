require 'spec_helper'

describe "recommends/new" do
  before(:each) do
    assign(:recommend, stub_model(Recommend,
      :recommendable => nil,
      :recommendation => "",
      :context => "MyText"
    ).as_new_record)
  end

  it "renders new recommend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recommends_path, :method => "post" do
      assert_select "input#recommend_recommendable", :name => "recommend[recommendable]"
      assert_select "input#recommend_recommendation", :name => "recommend[recommendation]"
      assert_select "textarea#recommend_context", :name => "recommend[context]"
    end
  end
end
