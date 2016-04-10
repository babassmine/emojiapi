class CreateEmojis < ActiveRecord::Migration
  def change
    create_table :emojis do |t|
      t.string :char_dec
      t.integer :decimal
      t.string :char_hex
      t.string :hex
      t.string :name
    end
  end
end
