class Memories.Views.Comment extends Backbone.View

  template: JST['comments/comment']
  className: "comment"
  tagName: "div"  
  initialize: ->        
    @render()

  render: =>                    
    @$el.html(@template(comment: @model))
    @$el.html()
    return @  
