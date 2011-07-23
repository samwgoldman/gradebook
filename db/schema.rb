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

ActiveRecord::Schema.define(:version => 20110722031935) do

  create_table "alternatives", :force => true do |t|
    t.integer  "criterion_id", :null => false
    t.string   "label",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alternatives", ["criterion_id"], :name => "index_alternatives_on_criterion_id"

  create_table "criteria", :force => true do |t|
    t.integer  "evaluation_id", :null => false
    t.string   "prompt",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "criteria", ["evaluation_id"], :name => "index_criteria_on_evaluation_id"

  create_table "evaluations", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
