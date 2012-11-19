class Memories.Views.List extends Backbone.View

  template: JST['lists/list']
  className: "span2"

  initialize: ->
    # super
    @render()
    # @collection.on("add", @add_post)
    

  render: ->
    @$el.html(@template())

  add_post:(post)->
    post_view = new Memories.Views.Post(model: post)
    post_view.$el.appendTo(@$el)