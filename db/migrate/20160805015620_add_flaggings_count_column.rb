class AddFlaggingsCountColumn < ActiveRecord::Migration
  def change
	add_column :microposts, :flaggings_count, :integer
  end
end
