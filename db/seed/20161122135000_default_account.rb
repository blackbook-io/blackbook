class AccountSeed < ActiveRecord::Base
  self.table_name = "accounts"
end

Account.create(
    account_name: 'D&B HQ',
    subdomain: 'hq'
)
