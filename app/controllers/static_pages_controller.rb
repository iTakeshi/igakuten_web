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
    @blog_updates = BlogEntry.includes(:blog_author).order('created_at DESC').limit(5)
    @current_page = ''
  end

  def greetings
    @page_title = "ごあいさつ"
    @current_page = 'greetings'
  end

  def about
    @page_title = "医学展について"
    @current_page = 'about'
  end

  def contents
    @page_title = "企画紹介"
    @current_page = 'contents'
  end

  def recture
    @page_title = "講演会"
    @current_page = 'recture'
  end

  def events
    @page_title = "イベント"
    @current_page = 'events'
  end

  def cooperators
    @page_title = "提携団体"
    @current_page = 'cooperators'
  end

  def access
    @page_title = "アクセス"
    @current_page = 'access'
  end
end
