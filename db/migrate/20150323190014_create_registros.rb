class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
