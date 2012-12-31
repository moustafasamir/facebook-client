class Memories.Views.AddPageToList extends Memories.Views.ModalBase

  template: JST["add_page_to_list"]
  events:
    'click .source': 'addPage'

  initialize:(options)=>
    @post = options.post
    @listId = options.listId
    @render()

  render:=>
    postSources = @post.getSources()
    @$el.html(@template(postSources:postSources))
    @show()

  addPage:(e)=>
    target = e.target
    $(target).removeClass("btn-primary")
    $(target).attr("disabled", true)
    fb_id = $(target).attr("fb_id")
    name = $(target).attr("name")
    page_type = $(target).attr("page_type")
    page = new Memories.Models.Page({name: name, fb_id: fb_id, page_type:page_type})
    page.listId = @listId
    page.save
      success:=>
        Memories.Dispatchers.listPagesDispatcher.trigger "page:added", {page: page, listId: @listId}

