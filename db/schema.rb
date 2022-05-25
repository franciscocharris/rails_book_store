# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_524_152_924) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'authors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_authors_on_user_id'
  end

  create_table 'books', primary_key: 'code', id: :uuid, default: nil, force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.decimal 'price', precision: 8, scale: 2
    t.integer 'n_pages'
    t.date 'd_published'
    t.boolean 'active', default: false
    t.bigint 'author_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['author_id'], name: 'index_books_on_author_id'
  end

  create_table 'books_tags', id: false, force: :cascade do |t|
    t.uuid 'book_code'
    t.bigint 'tag_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['book_code'], name: 'index_books_tags_on_book_code'
    t.index ['tag_id'], name: 'index_books_tags_on_tag_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.bigint 'author_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['author_id'], name: 'index_tags_on_author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'first_name'
    t.string 'last_name'
    t.date 'Date_birth'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'authors', 'users'
  add_foreign_key 'books', 'authors'
  add_foreign_key 'tags', 'authors'
end
