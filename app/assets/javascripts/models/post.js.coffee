class Memories.Models.Post extends Backbone.Model
  paramRoot: 'post'
  url: "/posts"

  getSources:=>
    tagged = @get("story_tags")
    sources = []
    for id, source of tagged
      sources.push({fb_id:source[0].id, name:source[0].name, page_type:source[0].type})
    if sources.length < 2
      from = @get("from")
      sources.push({fb_id:from.id, name:from.name, page_type:from.type})
    return sources
  
  from:(attribute)=>
    return @get("from")[attribute]

  originalPage:(attribute=null)=>
    if _.size(@get("story_tags")) > 1
        originalPageExist =  true
      else
        originalPageExist = false

    unless originalPageExist
      return null
    else if !attribute?
      return true
    #else return the field itself

    tags = []
    for id, tag of @get("story_tags")
      unless tag[0].id+"" is @from("id")+""
        tags.push tag[0] 
    return tags[0]?[attribute]



class Memories.Collections.Posts extends Backbone.Collection
  model: Memories.Models.Post
  url: "/posts"