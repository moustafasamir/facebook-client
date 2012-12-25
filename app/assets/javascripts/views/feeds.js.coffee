class Memories.Views.Feeds extends Backbone.View

  el: "#feeds"
  events:
    'click .btn' : 'reload'

  initialize: (options)->
    @posts = new Memories.Collections.Posts()
    @user = options.user

    @userLists = new Memories.Collections.UserLists(userId: @user.id)
    @userLists.fetch
      success: =>
        @render()
        @reload()
    
  render: =>
    @userLists.each (list)=>
      @$("#lists").append(new Memories.Views.List
        model: list
      .el)
    @_initDroppable()
    
  reload: =>
    @posts.fetch
      success: =>
        Memories.Dispatchers.postsDispatcher.trigger "posts:loaded", @posts

  _initDroppable:=>
    @$el.droppable
      hoverClass: "drop-hover"
      drop: (event, ui) =>
        post = $(ui.draggable).data()
        @_createNewList(post)

  
  _createNewList:(post)=>
    listName = prompt("What is the list name");
    @newList = new Memories.Models.List({name:listName})
    @newList.userId = @user.id
    @newList.save {}
      success:=>
        @$("#lists").append(new Memories.Views.List
          model: @newList
        .el)
        new Memories.Views.AddPageToList({post: post, listId: @newList.id})


