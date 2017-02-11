module FlashHelper

    # Returns an error message for a form field.
    def resolve_flash_type(type)
      case type
      when "notice"
        "info"
      when "error"
        "error"
      when "success"
        "success"
      else
        "info"
      end
    end
end
