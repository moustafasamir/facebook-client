class Memories.Views.List extends Backbone.View
  
  className: 'span3 well list'

  template: JST['lists/list']
  
  initialize:(options={})=>
    Memories.Dispatchers.postsDispatcher.on "posts:loaded", @_addPosts
    @pages = new Memories.Collections.ListPages([@model.get("pages")], {listId: @model.id})
    Memories.Dispatchers.listPagesDispatcher.on "page:added", @addPageToList

    @render()

  _initDroppable:=>
    @$el.droppable
      hoverClass: "drop-hover"
      greedy: true
      drop: (e, ui) =>
        post = $(ui.draggable).data()
        new Memories.Views.AddPageToList({post: post, listId: @model.id})

  render: =>
    @$el.html(@template(list: @model))
    @_initDroppable();

  _addPosts:(posts)=>
    posts.each (post)=>
      if @model.isPostIncluded(post)
        @$(".thumbnails").append(new Memories.Views.Post(model:post).el)
  
  addPageToList:(page, listId)=>
    @model.addPageToList(page, listId)

