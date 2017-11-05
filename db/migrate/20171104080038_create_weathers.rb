class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.string :city_name, null: false
      t.string :city_id, null: false
      t.string :temperature, null: false
      t.string :condiiton, null: false
      t.string :image_id, null: false
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
