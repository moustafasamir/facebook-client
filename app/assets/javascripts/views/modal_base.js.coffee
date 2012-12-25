class Memories.Views.ModalBase extends Backbone.View

  events:
    'click .close': 'close'

  close: (e) =>
    $.fancybox.close()

  show:->
    $.fancybox(@el)