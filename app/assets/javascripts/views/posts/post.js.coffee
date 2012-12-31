class Memories.Views.Post extends Backbone.View

  template: JST['posts/post']
  className: "span post"
  tagName:"li"
  events:
    'click .picture': 'imageClicked'
    'click .like': 'likePressed'
    'click .share': 'sharePressed'

  initialize: =>
    @model.on "change:liked", @_renderLike
    @render()

  render: =>
    @$el.html(@template(post: @model))
    @_initDrggable()
    @_initHover()
    @$el.data(@model)
    @_renderLike()


  _initHover:()=>
    # @$el.hover( 
    #   (=> 
    #     @$(".actions").show()),
    #   (=> 
    #     @$(".actions").hide())
    # )

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

  _renderLike:=>
    if @model.get("liked")
      @$(".like").text("Unlike")
    else
      @$(".like").text("Like")