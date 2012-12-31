class Memories.Models.Post extends Backbone.Model
  paramRoot: 'post'
  url:->
    "/posts"


class Memories.Collections.Posts extends Backbone.Collection
  model: Memories.Models.Post
  url: "/posts"