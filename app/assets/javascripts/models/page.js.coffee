class Memories.Models.Page extends Backbone.Model
  paramRoot: 'page'

  initialize:(options)=>
    @listId = options?.listId

  url:=>
    "/lists/#{@listId}/pages"

class Memories.Collections.ListPages extends Backbone.Collection
  model: Memories.Models.Page
  
  initialize:(options)=>
    @listId = options?.listId

  url:=>
    "/lists/#{@listId}/pages"