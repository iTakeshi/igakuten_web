require 'spec_helper'

describe "blog_authors/index" do
  before(:each) do
    assign(:blog_authors, [
      stub_model(BlogAuthor,
        :name => "Name"
      ),
      stub_model(BlogAuthor,
        :name => "Name"
      )
    ])
  end

  it "renders a list of blog_authors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
