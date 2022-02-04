json.array!(@posts) do |post|
  json.id post.id
  json.username post.user.name
  json.title post.title
  json.description post.text
  json.commments post.comments_counter
  json.likes post.likes_counters
end
