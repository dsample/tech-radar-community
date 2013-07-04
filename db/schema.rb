# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130704221237) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "body"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"

  create_table "product_technologies", :force => true do |t|
    t.integer  "product_id"
    t.integer  "technology_id"
    t.integer  "state_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "product_technologies", ["product_id"], :name => "index_product_technologies_on_product_id"
  add_index "product_technologies", ["state_id"], :name => "index_product_technologies_on_state_id"
  add_index "product_technologies", ["technology_id"], :name => "index_product_technologies_on_technology_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recommendations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "recommends", :force => true do |t|
    t.integer  "recommendable_id"
    t.string   "recommendable_type"
    t.integer  "recommendation_id"
    t.text     "context"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "recommends", ["recommendable_id"], :name => "index_recommends_on_recommendable_id"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "technologies", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "deleted_at"
  end

  add_index "technologies", ["category_id"], :name => "index_technologies_on_category_id"

end
