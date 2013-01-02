class Memories.Models.FbPost extends Backbone.Model
  paramRoot: 'post'
  
  urlRoot: '/facebookModels'
  url:=>
    if @get("object_id")?
      objectId = @get("object_id")
    else
      arr = @get("link").split("/")
      objectId = arr[arr.length-1]
    return "#{@urlRoot}/#{objectId}"

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

    tags = []
    for id, tag of @get("story_tags")
      unless tag[0].id+"" is @from("id")+""
        tags.push tag[0] 
    return tags[0]?[attribute]

  postUrl:()=>
    url = @get("id").replace("_", "/posts/")
    return "http://www.facebook.com/#{url}"
  
  displayDate:()=>
    monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
    createdDate = new Date(@get("created_time"))
    monthName = monthNames[createdDate.getMonth()]
    date = createdDate.getDate()
    return "#{monthName} #{date}"

  shareLink:=>
    return @get("link") || @postUrl()

class Memories.Collections.FbPosts extends Backbone.Collection
  model: Memories.Models.FbPost
  url: "/facebookModels/home"