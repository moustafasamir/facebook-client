class Memories.Views.CommentFormView extends Backbone.View

  template: JST['comments/comment_form']
  className: "comment-form"
  tagName: "div"  

  events:
    "keypress .comment_body": "handleKeypress"

  initialize: ->        
    @post = @options.post
    @comments = @options.comments
    @comment = new Memories.Models.Comment()
    @comment.post_id = @post.get("id")
    @render()

  render: =>
    @$el.html(@template())
    return @  

  handleKeypress: (e) =>
    if e.keyCode is 13
      @saveComment()

  saveComment :=>
    val = @$(".comment_body").val()        
    @comment.text = val
    @comment.save {},
      success: =>        
        @comments.add(@comment)
    @$(".comment_body").val("")      