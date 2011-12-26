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

ActiveRecord::Schema.define(:version => 20111226164944) do

  create_table "libri", :force => true do |t|
    t.string   "autore"
    t.string   "titolo"
    t.string   "sigla"
    t.decimal  "prezzo_copertina",   :precision => 8, :scale => 2
    t.decimal  "prezzo_consigliato", :precision => 8, :scale => 2
    t.decimal  "coefficente",        :precision => 2, :scale => 1
    t.string   "cm"
    t.string   "ean"
    t.integer  "editore_id"
    t.integer  "settore_id"
    t.integer  "collana_id"
    t.integer  "materia_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "libri", ["settore_id"], :name => "index_libri_on_settore_id"
  add_index "libri", ["titolo"], :name => "index_libri_on_titolo"

  create_table "settori", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
