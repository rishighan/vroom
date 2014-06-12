require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module ApplicationHelper

class HTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet # yep, that's it.
end

 def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true
     }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      footnotes:          true,
      fenced_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

end
