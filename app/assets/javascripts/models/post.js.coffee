class Memories.Models.Post extends Backbone.Model
  paramRoot: 'post'
  urlRoot  : "/posts"

class Memories.Collections.Posts extends Backbone.Collection
  model: Memories.Models.Post
  url: "/posts"

class Memories.Collections.UserLaterPosts extends Backbone.Collection
  model: Memories.Models.Post
  initialize:(options)=>
    @url = "users/#{options.user_id}/posts/later"


class Memories.Collections.UserFavoritePosts extends Backbone.Collection
  model: Memories.Models.Post
  initialize:(options)=>
    @url = "users/#{options.user_id}/posts/favorite"
