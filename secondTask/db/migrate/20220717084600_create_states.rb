class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.text :body
      t.text :author, index: true

      t.timestamps
    end
  end
end
