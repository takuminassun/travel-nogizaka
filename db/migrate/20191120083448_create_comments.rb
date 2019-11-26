class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :place     ,null: false
      t.integer :user_id
      t.text :text        ,null: false
      t.string :image , null: true
      t.timestamps
    end
  end
end
