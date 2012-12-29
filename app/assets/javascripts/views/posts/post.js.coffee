class Memories.Views.Post extends Backbone.View

  template: JST['posts/post']
  className: "span post"
  tagName:"li"
  events:
    'click .picture': 'imageClicked'

  initialize: =>
    @render()

  render: =>
    @$el.html(@template(post: @model))
    @_initDrggable()
    @_initHover()
    @$el.data(@model)

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
