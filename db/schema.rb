# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161122231754) do

  create_table "account_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "account_user_id", limit: 32,                 null: false
    t.string   "account_id",      limit: 32,                 null: false
    t.string   "user_id",         limit: 32,                 null: false
    t.boolean  "is_owner",                   default: false, null: false
    t.string   "state",           limit: 20,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "account_id",             limit: 32,    null: false
    t.string   "subdomain",              limit: 50,    null: false
    t.string   "account_name",           limit: 100,   null: false
    t.string   "custom_domain",          limit: 100
    t.string   "state",                  limit: 20,    null: false
    t.string   "favicon"
    t.string   "theme_color"
    t.text     "login_desktop_image",    limit: 65535
    t.text     "login_desktop_title",    limit: 65535
    t.text     "login_desktop_subtitle", limit: 65535
    t.text     "login_logo",             limit: 65535
    t.text     "login_icon",             limit: 65535
    t.string   "login_footer"
    t.string   "support_number"
    t.string   "support_link"
    t.string   "support_email"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "admins", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "admin_id",               limit: 32,               null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                    default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name",             limit: 50
    t.string   "last_name",              limit: 50
    t.string   "nickname",               limit: 50
    t.string   "mobile_number",          limit: 20
    t.string   "home_number",            limit: 20
    t.string   "time_zone",              limit: 100
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree
  end

  create_table "logins", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "loginable_type", limit: 50,                 null: false
    t.string   "loginable_id",   limit: 32,                 null: false
    t.datetime "attempted_at",                              null: false
    t.boolean  "was_successful",            default: false, null: false
  end

  create_table "users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_id",                limit: 32,                  null: false
    t.string   "email",                                              null: false
    t.string   "encrypted_password",                                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                    default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "state",                  limit: 20,                  null: false
    t.string   "first_name",             limit: 50
    t.string   "last_name",              limit: 50
    t.string   "nickname",               limit: 50
    t.string   "facebook_id",            limit: 100
    t.string   "linkedin_id",            limit: 100
    t.string   "mobile_number",          limit: 20
    t.string   "home_number",            limit: 20
    t.string   "time_zone",              limit: 100
    t.boolean  "ack_get_started_user",               default: false
    t.boolean  "ack_get_started_owner",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
