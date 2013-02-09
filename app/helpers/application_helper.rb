module ApplicationHelper

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
