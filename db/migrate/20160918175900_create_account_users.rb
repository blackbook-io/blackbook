class CreateAccountUsers < ActiveRecord::Migration

  def change
    create_table :account_users, id: false do |t|

      ## Identifier
      t.string :account_user_id,    null: false, limit: 32

      ## Foreign Keys
      t.string :account_id,         null: false, limit: 32
      t.string :user_id,            null: false, limit: 32

      ## Custom Attributes
      t.boolean  :is_owner,         null: false, default: false
      t.string   :state,            null: false, limit: 20
      t.timestamps
    end
  end

end # CreateAccountUsers
