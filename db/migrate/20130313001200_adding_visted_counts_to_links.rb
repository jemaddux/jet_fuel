class AddingVistedCountsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visits_count, :integer
  end
end
