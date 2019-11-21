class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :place     ,null: false
      t.text :text        ,null: false
      t.string :inage_url ,null: false
      t.timestamps
    end
  end
end
