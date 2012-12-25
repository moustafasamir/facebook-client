class Memories.Views.Post extends Backbone.View

  template: JST['posts/post']

  initialize: =>
    @render()

  render: =>
    @$el.html(@template(post: @model))
    @$el.draggable
      revert: "valid"
      start:->
        $(this).addClass "drag-hover"
      stop:->
        $(this).removeClass "drag-hover"
    @$el.data(@model)
    @model.getSources()    