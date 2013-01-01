class Memories.Views.Comments extends Backbone.View

  tagName: "div"  
  className: "comments"

  initialize: ->    
    @render()

  render: =>                
    $(@el).html("<hr>")
    @collection.each (comment)=>
      $(@el).append(new Memories.Views.Comment(model: comment).el)            
    return @