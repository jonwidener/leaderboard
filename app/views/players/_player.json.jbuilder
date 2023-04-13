json.extract! player, :id, :name, :win_count, :created_at, :updated_at
json.url player_url(player, format: :json)
