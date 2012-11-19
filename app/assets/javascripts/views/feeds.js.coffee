class Memories.Views.Feeds extends Backbone.View

  el: "#feeds"

  initialize: ->
    @render()

  render:->
  	list = new Memories.Views.List()
  	@$el.append(list.el)