json.extract! list, :id, :name, :description, :user_id
json.pages do |pages|
	pages.(list.pages) do |json, page|
    json.partial! page
	end
end