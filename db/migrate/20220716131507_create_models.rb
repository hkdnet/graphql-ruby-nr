class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false

      t.timestamps

      t.index %i[name], unique: true
    end

    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end

    create_table :comments do |t|
      t.integer :post_id, null: false
      t.integer :created_by_id, null: false

      t.string :body, null: false

      t.timestamps
    end
  end
end
