require 'spec_helper'

describe "recommends/show" do
  before(:each) do
    @recommend = assign(:recommend, stub_model(Recommend,
      :recommendable => nil,
      :recommendation => "",
      :context => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
