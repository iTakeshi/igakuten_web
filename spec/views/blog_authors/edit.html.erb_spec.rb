require 'spec_helper'

describe "blog_authors/edit" do
  before(:each) do
    @blog_author = assign(:blog_author, stub_model(BlogAuthor,
      :name => "MyString"
    ))
  end

  it "renders the edit blog_author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blog_authors_path(@blog_author), :method => "post" do
      assert_select "input#blog_author_name", :name => "blog_author[name]"
    end
  end
end
