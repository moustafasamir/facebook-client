class Memories.Views.PostModal extends Memories.Views.ModalBase


  template = JST["posts/post_modal"]
  initialize:->
    @show()
    @model.fetch
      success:=>
        @render()

  render:=>
    @el = template(fbPost: @model)
    @show()