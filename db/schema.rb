# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 11) do

  create_table "availables", :force => true do |t|
    t.integer  "movie_code"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "casts", :force => true do |t|
    t.integer  "movie_code"
    t.string   "actor_actress_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer  "category_code"
    t.integer  "rent_price"
    t.integer  "rent_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category_name"
  end

  create_table "clients", :force => true do |t|
    t.integer  "client_code"
    t.integer  "client_id"
    t.string   "client_name"
    t.string   "client_surname"
    t.date     "sing_up_date"
    t.date     "birth_date"
    t.string   "client_state"
    t.string   "home_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.integer  "emp_code"
    t.integer  "emp_id"
    t.string   "emp_name"
    t.string   "emp_surname"
    t.string   "emp_state"
    t.date     "start_date"
    t.string   "home_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.integer  "movie_code"
    t.string   "movie_title"
    t.string   "movie_original_title"
    t.integer  "movie_year"
    t.string   "movie_director"
    t.string   "genre"
    t.string   "country"
    t.string   "place_in_store"
    t.integer  "category_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.integer  "code_person"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rents", :force => true do |t|
    t.integer  "rent_code"
    t.integer  "movie_code"
    t.integer  "client_code"
    t.integer  "emp_code"
    t.date     "rent_date"
    t.date     "exp_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "returns", :force => true do |t|
    t.integer  "rent_code"
    t.date     "return_date"
    t.integer  "charges"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
