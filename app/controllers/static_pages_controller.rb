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
  skip_before_filter :authenticate

  def index
  end
end
