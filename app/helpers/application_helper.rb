module ApplicationHelper

  def header_nav(toc, current_page)
    html_str = "<li><a href=\"/#{toc[1]}\""
    if current_page == toc[1]
      html_str << " class=\"current\""
    end
    html_str << "><span>#{toc[0]}</span></a>"
    if toc[2]
      html_str << "<div class=\"dropdown\"><ul>"
      toc[2].each do |k, v|
        html_str << "<li><a href=\"/#{toc[1]}##{v}\">#{k}</a></li>"
      end
      html_str << "</ul></div>"
    end
    html_str << "</li>"
    return html_str.html_safe
  end

  def footer_nav(toc)
    html_str = "<div><h2><a href=\"/#{toc[1]}\">#{toc[0]}</a></h2><ul>"
    if toc[2]
      toc[2].each do |k, v|
        html_str << "<li><a href=\"/#{toc[1]}##{v}\">#{k}</a></li>"
      end
    end
    html_str << "</ul></div>"
    return html_str.html_safe
  end
end
