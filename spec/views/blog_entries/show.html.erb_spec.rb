require 'spec_helper'

describe "blog_entries/show" do
  before(:each) do
    blog_author = BlogAuthor.create!(name: 'John')
    @blog_entry = assign(:blog_entry, stub_model(BlogEntry,
      :title => "Title",
      :unsafe_html => "MyText",
      :blog_author_id => blog_author.id,
      :created_at => Time.now,
      :updated_at => Time.now
    ))
  end

  it "renders attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/John/)
  end
end
