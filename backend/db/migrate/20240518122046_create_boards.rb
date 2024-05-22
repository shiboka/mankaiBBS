class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :path
      t.integer :post_count

      t.timestamps
    end
  end
end
