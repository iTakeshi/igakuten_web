class BlogAuthorsController < ApplicationController
  # GET /blog_authors
  # GET /blog_authors.json
  def index
    @blog_authors = BlogAuthor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_authors }
    end
  end

  # GET /blog_authors/new
  # GET /blog_authors/new.json
  def new
    @blog_author = BlogAuthor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_author }
    end
  end

  # GET /blog_authors/1/edit
  def edit
    @blog_author = BlogAuthor.find(params[:id])
  end

  # POST /blog_authors
  # POST /blog_authors.json
  def create
    @blog_author = BlogAuthor.new(params[:blog_author])

    respond_to do |format|
      if @blog_author.save
        format.html { redirect_to blog_authors_path, notice: 'Blog author was successfully created.' }
        format.json { render json: @blog_author, status: :created, location: @blog_author }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog_authors/1
  # PUT /blog_authors/1.json
  def update
    @blog_author = BlogAuthor.find(params[:id])

    respond_to do |format|
      if @blog_author.update_attributes(params[:blog_author])
        format.html { redirect_to blog_authors_path, notice: 'Blog author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_authors/1
  # DELETE /blog_authors/1.json
  def destroy
    @blog_author = BlogAuthor.find(params[:id])
    @blog_author.destroy

    respond_to do |format|
      format.html { redirect_to blog_authors_url }
      format.json { head :no_content }
    end
  end
end
