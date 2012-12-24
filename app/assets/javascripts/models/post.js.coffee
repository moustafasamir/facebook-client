class Memories.Models.Post extends Backbone.Model
  paramRoot: 'post'


class Memories.Collections.Posts extends Backbone.Collection
  model: Memories.Models.Post
  url: "/posts"

