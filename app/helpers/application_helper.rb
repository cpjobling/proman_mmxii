# Copyright 2009-2010 Swansea University
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_with_highlight(name, options = {}, html_options = {}) # same sig as #link_to
    html_options.merge!({ :class => 'active' }) if current_page?(options)
    link_to(name, options, html_options)
  end
  
  # Generate a quotation suitable for a page slogan.
  def quotation_generator(quotation, citation = {})
    born = citation[:born] || '?'
    died = citation[:died] || '?'
    author = citation[:author] || 'Anonymous'
    dates = "#{born}&mdash;#{died}"
    cited_quotation = "&ldquo;#{h(quotation)}&rdquo; &ndash; #{h(author)}"
    if (dates == "?&mdash;?")
      return cited_quotation.html_safe
    else
      return (cited_quotation += " (#{dates})").html_safe
    end
  end
  
  # The Proman logo
  def proman
    return "<em>Proman</em><sup>&beta;</sup><sub style=\"xx-small;\">(MMXII)</sub>".html_safe
  end
  
  # Title helper as described in RailsCast 30 (http://asciicasts.com/episodes/30-pretty-page-title)
  # Use as <%= title("Page title") %> in your templates.
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  # Slogan helper: similar to the title helper. Puts a witty slogan on the current page.
  # Use as <%= :slogan "Plagiarism is bad for your grade" %> in your templates.
  def slogan(page_slogan)
    content_for(:slogan) { page_slogan }
  end
  
  def user_name
    if user_signed_in?
      return current_user.known_as || current_user.user_name
    else
      return "Guest"
    end
  end
  
end