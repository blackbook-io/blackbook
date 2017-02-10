class AccountSeed < ActiveRecord::Base
  self.table_name = "accounts"
end

acme = Account.create(
    account_name: 'ACME Widgets',
    subdomain: 'acme'
)
u = User.create(email: 'beth@acme.com', first_name: 'Beth', last_name: 'Bourke', confirmed_at: Time.now, password: 'Qwerty!12345', password_confirmation: 'Qwerty!12345')
acme.users << u
