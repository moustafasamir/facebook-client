class Memories.Models.List extends Backbone.Model
  paramRoot: 'list'

  initialize:(options)=>
    @pages = new Memories.Collections.ListPages(@get("pages"), {listId: @.id})
    Memories.Dispatchers.listPagesDispatcher.on "page:added", @addPageToList

  url:->
    "users/#{@userId}/lists"
  
  get:=>
    super

  addPageToList:(page, listId)=>
    if listId == @.id
      @pages.add page

  isPostIncluded:(post)=>
    if @get("name") is "Home"
      return true
    postSources = post.getSources()
    for page in @pages.models
      for source in postSources
        if page.get("fb_id") == source.fb_id #and source.get("page_type") == page.get("page_type")
          return true
    return false
  
class Memories.Collections.UserLists extends Backbone.Collection
  model: Memories.Models.List
  
  initialize:(options)=>
    @userId = options.userId

  url:->
    "users/#{@userId}/lists"
  