class Memories.Views.Feeds extends Backbone.View

  el: "#feeds"
  events:
    'keypress .btn' : 'reload'

  initialize: ->
  	@collection = new Memories.Collections.Posts()
  	@collection.fetch
  	  success: => 
        @render()

  render: =>
  	list = new Memories.Views.PostList(collection: @collection)
  	$("#lists").append(list.el)

  reload:=>
  	@collection.fetch
  	  success: => 
        @render()

