require 'spec_helper'

describe "recommends/index" do
  before(:each) do
    assign(:recommends, [
      stub_model(Recommend,
        :recommendable => nil,
        :recommendation => "",
        :context => "MyText"
      ),
      stub_model(Recommend,
        :recommendable => nil,
        :recommendation => "",
        :context => "MyText"
      )
    ])
  end

  it "renders a list of recommends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
