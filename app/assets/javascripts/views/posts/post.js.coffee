class Memories.Views.Post extends Backbone.View

  template: JST['posts/post']
  className: "span post"
  tagName:"li"
  events:
    'click .picture': 'imageClicked'
    'click .like': 'likePressed'
    'click .share': 'sharePressed'
    'click .later': 'laterPressed'
    'click .favorite': 'favoritePressed'

  initialize: =>
    @model.on "change:liked", @renderLike
    @model.on "change:later", @renderLater
    @model.on "change:favorite", @renderFavorite
    @model.on "destroy", @remove
    @render()

  remove:=>
    super

  render: =>
    @$el.html(@template(post: @model))
    @_initDrggable()
    @$el.data(@model)    
    @renderLike()
    @renderLater()
    @renderFavorite()
    @comments = new Memories.Collections.Comments(@model.get("comments")?.data)
    @$el.append(new Memories.Views.Comments(collection: @comments).el)
    @$el.append(new Memories.Views.CommentFormView(post :@model, comments :@comments).el)      

  _initDrggable:()=>
    @$el.draggable
      revert: "valid"
      start:->
        $(this).addClass "drag-hover"
      stop:->
        $(this).removeClass "drag-hover"

  imageClicked:=>
    if @model.get("type") is "photo"
      new Memories.Views.PostModal(model: @model)
    else
      window.open(@$('.post-link').attr("href"), '_blank');
      window.focus();

  likePressed:=>
    if @model.get("liked")
      $.ajax 
        url: "/facebookModels/like/#{@model.id}"
        type : "DELETE"
        success:() =>
          @model.set("liked", false)
    else
      $.post "/facebookModels/like/#{@model.id}", (data)=>
        if data.success is true
          @model.set("liked", true)

  sharePressed:=>
    new Memories.Views.SharePopover({model: @model, parentElement: @$(".share")})

  laterPressed:=>
    if @model.get("later")
      Memories.Dispatchers.postsDispatcher.trigger "later:remove" , @model
    else
      Memories.Dispatchers.postsDispatcher.trigger "later:add" , @model

  favoritePressed:=>
    if @model.get("favorite")
      Memories.Dispatchers.postsDispatcher.trigger "favorite:remove" , @model
    else
      Memories.Dispatchers.postsDispatcher.trigger "favorite:added" , @model
    
  renderLike:=>
    if @model.get("liked")
      @$(".like").text("Unlike")
    else
      @$(".like").text("Like")

  renderLater:=>
    if @model.get("later")
      @$(".later").text("remove").addClass("muted").attr('disabled', 'disabled').removeClass("btn-link");
    else
      @$(".later").text("Later").removeClass("muted").removeAttr('disabled').addClass("btn-link");

      
  renderFavorite:=>
    if @model.get("favorite")
      @_enableButton(@$(".favorite"), false)
    else
      @_enableButton(@$(".favorite"), true)

  _enableButton:(jqueryObject, enable)=>
    if enable 
      jqueryObject.removeClass("muted").removeAttr('disabled').addClass("btn-link");
    else
      jqueryObject.addClass("muted").attr('disabled', 'disabled').removeClass("btn-link");

