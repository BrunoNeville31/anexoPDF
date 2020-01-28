class CreateCobrancas < ActiveRecord::Migration[5.2]
  def change
    create_table :cobrancas, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :user_id
      t.string :path
      t.datetime :data
      t.float :value
      t.string :code_id

      t.timestamps
    end
    add_foreign_key :cobrancas, :users
  end
end
