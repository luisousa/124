class AddPriorityToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :priority, :integer
  end
end
