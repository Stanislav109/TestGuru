class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.boolean :status, default: false, null: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
