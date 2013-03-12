require "active_record"

class CreateLink < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :full_url
      t.string :short_url
      t.string :relative_short_url
      t.string :user_id
      t.timestamps
    end
  end
end
