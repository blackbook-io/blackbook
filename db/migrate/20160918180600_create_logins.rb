class CreateLogins < ActiveRecord::Migration
  def change
   create_table :logins, id: false do |t|
     t.string :loginable_type, limit: 50, null: false
     t.string :loginable_id, limit: 32, null: false
     t.datetime :attempted_at, null: false
     t.boolean :was_successful, null: false, default: false
    end
  end
end
