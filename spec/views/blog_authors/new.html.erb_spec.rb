require 'spec_helper'

describe "blog_authors/new" do
  before(:each) do
    assign(:blog_author, stub_model(BlogAuthor,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new blog_author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blog_authors_path, :method => "post" do
      assert_select "input#blog_author_name", :name => "blog_author[name]"
    end
  end
end
