class AddVanityToUserLinks < ActiveRecord::Migration
  def change
    add_column :user_links, :vanity, :string
  end
end
