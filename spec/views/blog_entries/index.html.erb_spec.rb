require 'spec_helper'

describe "blog_entries/index" do
  before(:each) do
    assign(:blog_entries, [
      stub_model(BlogEntry,
        :title => "Title",
        :unsafe_html => "MyText",
        :blog_author_id => 1
      ),
      stub_model(BlogEntry,
        :title => "Title",
        :unsafe_html => "MyText",
        :blog_author_id => 1
      )
    ])
  end

  it "renders a list of blog_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
