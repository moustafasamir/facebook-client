class Memories.Views.List extends Backbone.View
  
  className: 'span3 well list'

  template: JST['lists/list']
  events:
    'keydown .list-name': 'listNameEdit'
  
  initialize:(options={})=>
    Memories.Dispatchers.postsDispatcher.on "posts:loaded", @_addPosts
    @pages = new Memories.Collections.ListPages([@model.get("pages")], {listId: @model.id})
    Memories.Dispatchers.listPagesDispatcher.on "page:added", @addPageToList
    @model.on "change:name", (model, name)=> 
      @$(".list-name").text(name)
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
    @_initEditable()

  listNameEdit:(e)->
    #opts is a variable in editable plugin
    if e.keyCode is 13
      opts.toNonEditable($(e.currentTarget),true)
    else if e.keyCode is 27
      opts.toNonEditable($(e.currentTarget),false)

  _initEditable:=>
    @$('.list-name').editable
      onSubmit:(content)=>
        if content.current is ""
          @$('.list-name').text(content.previous)
        else
          @model.save {name:content.current},
            error:(model)=>
              console.log "error"
              debugger
              @$('.list-name').length
              @model.set("name", @model.previousAttr.name)
            patch: true

  _addPosts:(posts)=>
    posts.each (post)=>
      if @model.isPostIncluded(post) && post.get("status_type")?
        @$(".thumbnails").append(new Memories.Views.Post(model:post).el)
  
  addPageToList:(page, listId)=>
    @model.addPageToList(page, listId)

