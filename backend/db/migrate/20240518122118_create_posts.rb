class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :message
      t.integer :post_num
      t.references :thred

      t.timestamps
    end
  end
end
