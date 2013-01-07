class Memories.Views.CustomList extends Memories.Views.List

  initialize:=>
    Memories.Dispatchers.postsDispatcher.on "later:add", @createLaterPost
    Memories.Dispatchers.postsDispatcher.on "later:remove", @removeLaterPost
    @model = new Memories.Models.List({name:"Later"})

    @fbPosts = new Memories.Collections.FbPosts()
    @fbPosts.on "add", @renderPost

    @render()
    @_fetchPosts()

  _fetchPosts:=>
    @posts = new Memories.Collections.UserLaterPosts(user_id: Memories.current_user.id)
    @posts.fetch
      success:(collection)=>
        collection.each (post)=>
          post.fb_post = new Memories.Models.FbPost({object_id:post.get("fb_id"), later:true}, {})
          post.fb_post.post = post
          post.fb_post.fetch
            success:(fb_post)=>
              @fbPosts.add fb_post

  render:=>
    @$el.html(@template(list: @model))

  createLaterPost:(original_fb_post)=>
    fb_post = original_fb_post.clone()
    original_fb_post.set("later", true)

    post = new Memories.Models.Post()
    post.fb_post = fb_post
    post.save {fb_id: fb_post.id, post_type : "later"}
      success:(model)=>
        model.fb_post.post = model
        @fbPosts.add model.fb_post
        model.fb_post.set("later", true)

  removeLaterPost:(fb_post)=>
    fbPostsArr = @fbPosts.where({id: fb_post.id})
    fb_post.set("later", false)
    @fbPosts.remove(fb_post)
    tagret_fb_post = fbPostsArr[0]
    tagret_fb_post.post.destroy
      success:(post)=>
        post.fb_post.trigger("destroy")

  renderPost:(fb_post)=>
    @$(".thumbnails").prepend(new Memories.Views.Post(model:fb_post).el)
