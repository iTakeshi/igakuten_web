require 'spec_helper'

describe "blog_authors/show" do
  before(:each) do
    @blog_author = assign(:blog_author, stub_model(BlogAuthor,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
