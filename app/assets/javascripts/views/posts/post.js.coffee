class Memories.Views.Post extends Backbone.View

  template: JST['posts/post']
  className: "span post"
  tagName:"li"

  initialize: =>
    @render()

  render: =>
    @$el.html(@template(post: @model))
    @_initDrggable()
    @_initHover()
    @$el.data(@model)

  _initHover:()=>
    @$el.hover( 
      (=> 
        @$(".actions").show()),
      (=> 
        @$(".actions").hide())
    )


  _initDrggable:()=>
    @$el.draggable
      revert: "valid"
      start:->
        $(this).addClass "drag-hover"
      stop:->
        $(this).removeClass "drag-hover"
