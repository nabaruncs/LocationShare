module ApplicationHelper
  def unobtrusive_js(code)
    if request.xhr?
      javascript_tag(code)
    else
      @unobtrusive_js ||= []
      @unobtrusive_js << code
      nil
    end
  end

  def include_unobtrusive_js
    @unobtrusive_js ||= []
    javascript_tag(@unobtrusive_js.join(";\n"))
  end
end
