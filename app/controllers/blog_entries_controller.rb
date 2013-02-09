# coding: utf-8

class BlogEntriesController < ApplicationController
  skip_before_filter :authenticate, only: [ :index, :show ]

  # GET /blog_entries
  # GET /blog_entries.json
  def index
    @blog_entries = BlogEntry.page params[:page]
    @page_title = "スタッフブログ"
    @blog_page = true

    if request.path.include? "blog_entries"
      @admin = true
    else
      @admin = false
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_entries }
      format.rss  { render layout: false }
    end
  end

  # GET /blog_entries/1
  # GET /blog_entries/1.json
  def show
    @blog_entry = BlogEntry.find(params[:id])
    @page_title = @blog_entry.title
    @blog_page = true

    if request.path.include? "blog_entries"
      @admin = true
    else
      @admin = false
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_entry }
    end
  end

  # GET /blog_entries/new
  # GET /blog_entries/new.json
  def new
    @blog_entry = BlogEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_entry }
    end
  end

  # GET /blog_entries/1/edit
  def edit
    @blog_entry = BlogEntry.find(params[:id])
  end

  # POST /blog_entries
  # POST /blog_entries.json
  def create
    @blog_entry = BlogEntry.new(params[:blog_entry])

    respond_to do |format|
      if @blog_entry.save
        format.html { redirect_to @blog_entry, notice: 'ブログの投稿が完了しました。' }
        format.json { render json: @blog_entry, status: :created, location: @blog_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog_entries/1
  # PUT /blog_entries/1.json
  def update
    @blog_entry = BlogEntry.find(params[:id])

    respond_to do |format|
      if @blog_entry.update_attributes(params[:blog_entry])
        format.html { redirect_to @blog_entry, notice: '投稿内容を更新しました。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_entries/1
  # DELETE /blog_entries/1.json
  def destroy
    @blog_entry = BlogEntry.find(params[:id])
    @blog_entry.destroy

    respond_to do |format|
      format.html { redirect_to blog_entries_url }
      format.json { head :no_content }
    end
  end
end
