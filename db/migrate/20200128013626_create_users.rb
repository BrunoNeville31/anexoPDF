class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :first_name
      t.string :cpf_cnpj

      t.timestamps
    end
  end
end
