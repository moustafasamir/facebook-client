class Memories.Models.Post extends Backbone.Model
  paramRoot: 'post'
  url: "/posts"

  getSources:=>
    tagged = @get("story_tags")
    sources = []
    for id, source of tagged
      sources.push({fb_id:source[0].id, name:source[0].name, page_type:source[0].type})
    from = @get("from")
    sources.push({fb_id:from.id, name:from.name, page_type:from.type})
    return sources


class Memories.Collections.Posts extends Backbone.Collection
  model: Memories.Models.Post
  url: "/posts"