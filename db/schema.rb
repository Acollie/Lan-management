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

ActiveRecord::Schema.define(version: 2019_11_17_131924) do

  create_table "admin_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "location", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.integer "lan_id"
    t.boolean "lan_ticket", default: false
    t.integer "lan_ticket_type", default: 0
  end

  create_table "attendees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lan_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ticket_activation", default: false
    t.integer "ticket_type"
    t.boolean "paid"
    t.integer "item_order_id"
    t.index ["lan_id"], name: "index_attendees_on_lan_id"
    t.index ["member_id"], name: "index_attendees_on_member_id"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lan_id"
    t.string "name"
    t.datetime "start_time"
    t.integer "member_id"
    t.boolean "is_competition", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lan_id"], name: "index_events_on_lan_id"
  end

  create_table "item_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_id"
    t.integer "admin_item_id"
    t.integer "quantity"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ticket_activated"
    t.integer "attendee_id"
  end

  create_table "lans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "untitled lan", null: false
    t.text "about"
    t.string "location", default: "Earth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date", default: "2019-10-31 12:15:59"
    t.datetime "end_date", default: "2019-11-02 12:15:59"
    t.integer "tickets_available", default: 100
    t.boolean "tickets_available_member", default: false
    t.boolean "tickets_sold_out_member", default: false
    t.float "tickets_price_member", default: 10.0
    t.float "ticket_price_non_member", default: 16.0
    t.boolean "ticket_sold_out_non_member", default: false
    t.float "ticket_price_visitor", default: 5.0
    t.datetime "ticket_available_date", default: "2019-10-31 12:16:00"
    t.boolean "charity_lan", default: false
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "display_name"
    t.string "first_name"
    t.string "surname"
    t.boolean "committee", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "balance", default: 0.0
    t.integer "discord_id", default: 0
    t.string "emergency_contact_name", default: ""
    t.string "emergency_phone_number", default: ""
    t.boolean "paid_membership", default: false
    t.string "lan_van_phone_number"
    t.text "lan_van_address"
    t.string "lan_van_post_code"
    t.boolean "lan_van_collection_required", default: false
    t.boolean "lan_van_dropoff_required", default: false
    t.text "lan_van_availability"
    t.integer "seat_group_id"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paid", default: 0
    t.float "total_price", default: 0.0
    t.index ["member_id"], name: "index_orders_on_member_id"
  end

  create_table "scores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "amount"
    t.bigint "event_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_scores_on_event_id"
    t.index ["member_id"], name: "index_scores_on_member_id"
  end

  create_table "seat_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "member_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.index ["member_id"], name: "index_seat_groups_on_member_id"
  end

  add_foreign_key "attendees", "lans"
  add_foreign_key "attendees", "members"
  add_foreign_key "events", "lans"
  add_foreign_key "orders", "members"
  add_foreign_key "scores", "events"
  add_foreign_key "scores", "members"
  add_foreign_key "seat_groups", "members"
end
