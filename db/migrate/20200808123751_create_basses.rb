class CreateBasses < ActiveRecord::Migration[6.0]
  def change
    create_table :basses do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.string :name
      t.integer :year
      t.integer :string_num
      t.boolean :fretless, default: false
      t.boolean :active, default: false
      t.text :description

      t.timestamps
    end
  end
end
