module ApplicationHelper

  def body_class(class_name = '')
    "#{controller.action_name} #{controller.controller_name} #{class_name} body"
  end

  def inner_class(class_name = '')
    class_name << ' inner-modal' if is_modal?
    "inner-content #{class_name}"
  end

  def is_modal?
    request.xhr?
  end

  def link_to_fancybox(label, path, class_name = 'btn btn-link')
    title = label

    label = "<span class='lnr lnr-pencil'></span>" if label == 'Editar'
    "<a data-fancybox data-type='ajax' data-src='#{path}' title='#{title}' href='javascript:;' class='#{class_name}'>#{label}</a>".html_safe
  end

end
