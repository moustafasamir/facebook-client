window.Memories =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
  	new Memories.Views.Feeds()
  	

$(document).ready ->
  Memories.init()
