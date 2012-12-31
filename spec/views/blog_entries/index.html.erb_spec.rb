require 'spec_helper'

describe "blog_entries/index" do
  before(:each) do
    blog_author = BlogAuthor.create!(name: 'John')
    time = Time.now
    assign(:blog_entries, [
      stub_model(BlogEntry,
        :title => "Title",
        :unsafe_html => "MyText",
        :blog_author_id => blog_author.id,
        :created_at => time,
        :updated_at => time + 1
      ),
      stub_model(BlogEntry,
        :title => "Title",
        :unsafe_html => "MyText",
        :blog_author_id => blog_author.id,
        :created_at => time,
        :updated_at => time
      )
    ])
  end

  it "renders a list of blog_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "section h1", :text => "Title".to_s, :count => 2
    assert_select "section article", :text => "MyText".to_s, :count => 2
    assert_select "section span.blog-author", :text => "John".to_s, :count => 2
    assert_select "section span.blog-date", :text => /^\d{4}\.\d{2}\.\d{2}$/, :count => 1
    assert_select "section span.blog-date", :text => /^\d{4}\.\d{2}\.\d{2} \/ \d{4}\.\d{2}\.\d{2}$/, :count => 1
  end
end
