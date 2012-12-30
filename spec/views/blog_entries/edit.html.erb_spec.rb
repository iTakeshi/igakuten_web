require 'spec_helper'

describe "blog_entries/edit" do
  before(:each) do
    @blog_entry = assign(:blog_entry, stub_model(BlogEntry,
      :title => "MyString",
      :unsafe_html => "MyText",
      :blog_author_id => 1
    ))
  end

  it "renders the edit blog_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blog_entries_path(@blog_entry), :method => "post" do
      assert_select "input#blog_entry_title", :name => "blog_entry[title]"
      assert_select "textarea#blog_entry_unsafe_html", :name => "blog_entry[unsafe_html]"
      assert_select "input#blog_entry_blog_author_id", :name => "blog_entry[blog_author_id]"
    end
  end
end
