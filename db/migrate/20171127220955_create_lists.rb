class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table @list do |t|
      t.string :item, null: false
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
