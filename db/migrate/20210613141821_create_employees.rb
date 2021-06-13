class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string     :name,       null: false, default: ""
      t.integer    :experience, null: false, default: 0
      t.integer    :salary,     null: false, default: 0
      t.references :manager,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
