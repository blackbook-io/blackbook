ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['SEND_GRID_USERNAME'],
    password:       ENV['SEND_GRID_PASSWORD'],
    domain:         'notifications.hanumi.io',
    enable_starttls_auto: true
}
