class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :site
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
