class Memories.Views.List extends Backbone.View
  
  className: 'span3 well list'
  template: JST['lists/list']
  
  initialize:=>
    $(window).bind("resize", @_resizeLists)
    
  render: =>
    @_resizeLists()    

  _resizeLists: =>  
    h = if typeof window.innerHeight != 'undefined' then window.innerHeight else document.body.offsetHeight
    @$el.height(h-$(".navbar-inverse").height()-120)