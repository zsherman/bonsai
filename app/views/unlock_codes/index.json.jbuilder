json.array!(@unlock_codes) do |unlock_code|
  json.extract! unlock_code, :id
  json.url unlock_code_url(unlock_code, format: :json)
end
