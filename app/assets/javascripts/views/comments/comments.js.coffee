class Memories.Views.Comments extends Backbone.View

  tagName: "div"  
  className: "comments"

  initialize: ->    
    @collection.on("add", @renderLast)
    @render()

  render: =>    
    @collection.each (comment)=>
      $(@el).append(new Memories.Views.Comment(model: comment).el)            
    return @

  renderLast: =>
    console.log @collection.last()
    $(@el).append(new Memories.Views.Comment(model: @collection.last()).el)