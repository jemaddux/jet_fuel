class AddVisitsToUserLinks < ActiveRecord::Migration
   def change
    add_column :user_links, :visits_count, :integer
  end
end
