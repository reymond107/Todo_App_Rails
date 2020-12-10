class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :detail
      t.date :date
      t.belongs_to :category, index: true
      
      t.timestamps
    end
  end
end
