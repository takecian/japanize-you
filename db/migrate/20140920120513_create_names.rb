class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :name
      t.string :hiragana
      t.string :katakana

      t.timestamps
    end
    add_index :names, :name
  end
end
