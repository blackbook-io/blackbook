module SecurityHelper

    # Returns an error message for a form field.
    def flash_form_error_for(flash_type, key)
      if flash[flash_type].present? && flash[flash_type][key.to_s].present?
        "<label id=\"#{key}-error\" class=\"error p-b-15\" for=\"#{key}\">#{flash[flash_type][key.to_s].join}</label>".html_safe
      end
    end
end
