# coding: utf-8

# Blog周りに関係のない、静的なページはこのcontrollerに空メソッドとして定義してください。
# メソッド名がそのままURLに反映されます。
#
# 例：
# class StatickPagesController ...
#   def schedule
#   end
# end
# => http://hokudai-igakuten.org/schedule
#
# HTMLファイルは app/views/static_pages/(action).html.erb に定義してください。

class StaticPagesController < ApplicationController
#  skip_before_filter :authenticate

  def index
    @top_page = true
    @blog_updates = BlogEntry.includes(:blog_author).order('created_at DESC').limit(5)
  end

  def greetings
    @page_title = "ごあいさつ"
    @greetings_page = true
  end

  def about
    @page_title = "医学展について"
    @about_page = true
  end

  def contents
    @page_title = "企画紹介"
    @contents_page = true
  end

  def recture
    @page_title = "講演会"
    @recture_page = true
  end

  def events
    @page_title = "イベント"
    @events_page = true
  end

  def cooperators
    @page_title = "提携団体"
    @cooperators_page = true
  end

  def access
    @page_title = "アクセス"
    @access_page = true
  end
end
