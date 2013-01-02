class Memories.Views.SharePopover extends Backbone.View
  
  template: JST['share_popover']

  events:
    'click .share-btn': "sharePost"


  initialize:(options)=>
    @parentElement = options.parentElement
    @render()

  render:=>
    @$el.html(@template())
    @parentElement.popover
      content: @el
      html: true
      animation: true
    @delegateEvents(@events)
    @parentElement.popover("show")

  sharePost:=>
    post = 
      post:
        message: @$(".message").val()
        link   : @model.shareLink()
    $.ajax
      url: "/facebookModels/share"
      type: "POST"
      data: post
      success:(data)=>
          if data.success is true
            @model.set("liked", true)
            @_alertSuccess()
      error:=>
        @_alertError()
  _alertError:=>
    @$(".content").hide()
    @$(".alert-error").show()
    setTimeout(
        => @parentElement.popover("destroy")
      , 1600);
    

  _alertSuccess:=>
    @$(".content").hide()
    @$(".alert-success").show()
    setTimeout(
        => @parentElement.popover("destroy")
      , 1600);
    