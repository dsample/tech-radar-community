require 'spec_helper'

describe "recommends/edit" do
  before(:each) do
    @recommend = assign(:recommend, stub_model(Recommend,
      :recommendable => nil,
      :recommendation => "",
      :context => "MyText"
    ))
  end

  it "renders the edit recommend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recommends_path(@recommend), :method => "post" do
      assert_select "input#recommend_recommendable", :name => "recommend[recommendable]"
      assert_select "input#recommend_recommendation", :name => "recommend[recommendation]"
      assert_select "textarea#recommend_context", :name => "recommend[context]"
    end
  end
end
