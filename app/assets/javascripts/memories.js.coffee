window.Memories =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Dispatchers:
    listPagesDispatcher: _.clone(Backbone.Events)
    postsDispatcher    : _.clone(Backbone.Events)
  init: =>
    Memories.current_user = new Memories.Models.CurrentUser()
    Memories.current_user.fetch
      success: =>
        new Memories.Views.Feeds({user: Memories.current_user})

$(document).ready ->
  Memories.init()
