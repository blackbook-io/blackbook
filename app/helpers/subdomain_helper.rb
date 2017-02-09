module SubdomainHelper
  def with_subdomain(subdomains, port)
    subdomain = Array(subdomains)
    subdomain += "." unless subdomain.empty?
    host = Rails.application.config.action_mailer.default_url_options[:host] << port.to_s
    [subdomain, host].join
  end

  def url_for(options = nil)

    if options.kind_of?(Hash) && options.has_key?(:subdomain)
      options[:host] = with_subdomain(options.delete(:subdomain), (options.has_key?(:port) ? options.delete(:port) : 80))

    end
    super
  end
end
