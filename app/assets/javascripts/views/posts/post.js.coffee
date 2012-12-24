class Memories.Views.Post extends Backbone.View

  template: JST['posts/post']

  initialize: ->
    @render()

  render: =>
    console.log @model
    @$el.html(@template(post: @model))
    