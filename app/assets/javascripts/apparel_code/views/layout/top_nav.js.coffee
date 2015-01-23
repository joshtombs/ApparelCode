@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.TopNav extends Marionette.LayoutView
    template: HandlebarsTemplates['top-nav'],

    regions:
      userRegion: ".top-nav-profile"

    initialize: (options) ->
      @user = options

    onShow: ->
      if @user.username
        @userRegion.show new App.Views.UserLoggedInNav(@user)
      else
        @userRegion.show new App.Views.UserNav
