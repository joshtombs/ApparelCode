@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.LoginMenu extends Marionette.LayoutView
    template: false,

    onShow: ->
      $("#loginModal").modal("show")
