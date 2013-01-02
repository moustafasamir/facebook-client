class Memories.Models.Comment extends Backbone.Model

# To create a comment need 
# post id -to which comment will be created  
# comment text
  save:(att, options = {})=>
    FB.api('/'+@post_id+'/comments', 'post', {message: @text}, 
      (response)=>
        if (!response || response.error)
          console.log ("Error Create Comment Loc: Memories.Models.Comment")
        else          
          FB.api('/'+response.id, 'get', 
            (response)=>
              @attributes = response               
              options.success?()
          ) 
    )    


class Memories.Collections.Comments extends Backbone.Collection
  model: Memories.Models.Comment