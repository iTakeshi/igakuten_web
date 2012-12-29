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

    render
  end

  it "renders a list of blog_authors" do
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end

  it "renders a link to new_blog_author_path" do
    assert_select "a[href=#{new_blog_author_path}]"
  end
end
