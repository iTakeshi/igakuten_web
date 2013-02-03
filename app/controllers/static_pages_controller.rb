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
  end

  def about
    @page_title = "医学展について"
  end

  def contents
    @page_title = "企画紹介"
  end

  def recture
    @page_title = "講演会"
  end

  def events
    @page_title = "イベント"
  end

  def cooperators
    @page_title = "提携団体"
  end
end
