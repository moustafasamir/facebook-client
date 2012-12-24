class Memories.Views.PostList extends Backbone.View

  template: JST['posts/post_list']

  className: 'span3 well'

  initialize: ->
    @render()

  render: =>
    @$el.html(@template())
    @collection.each (post)=>
  	  @$el.append(new Memories.Views.Post(model:post).el)