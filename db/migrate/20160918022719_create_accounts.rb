class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts, id: false do |t|

      ## Identifier
      t.string   :account_id,             null: false,           limit: 32
      t.string   :subdomain,              null: false,           limit: 50

      ## Name
      t.string   :account_name,           null: false,           limit: 100
      t.string   :custom_domain,          null: true,            limit: 100

      t.string   :state,                  null: false,           limit: 20

      # Appearance
      t.string   :favicon,                null: true
      t.string   :theme_color,            null: true
      t.text     :login_desktop_image,    null: true
      t.text     :login_desktop_title,    null: true
      t.text     :login_desktop_subtitle, null: true
      t.text     :login_logo,             null: true
      t.text     :login_icon,             null: true
      t.string   :login_footer,           null: true

      # Support Information
      t.string   :support_number,   null: true
      t.string   :support_link,     null: true
      t.string   :support_email,    null: true

      t.timestamps null: false
    end
  end
end
