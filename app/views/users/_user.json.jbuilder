json.extract! user, :id, :first_name, :cpf_cnpj, :created_at, :updated_at
json.url user_url(user, format: :json)
