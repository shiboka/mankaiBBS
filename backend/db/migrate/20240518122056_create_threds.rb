class CreateThreds < ActiveRecord::Migration[7.1]
  def change
    create_table :threds do |t|
      t.string :subject
      t.integer :post_num
      t.references :board

      t.timestamps
    end
  end
end
