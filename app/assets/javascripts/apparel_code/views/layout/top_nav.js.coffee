@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.TopNav extends Marionette.LayoutView
    template: HandlebarsTemplates['top-nav'],

    regions:
      userRegion: ".top-nav-profile"

    onShow: ->
      if !!App.CurrentUser
        @userRegion.show new App.Views.UserLoggedInNav
      else
        @userRegion.show new App.Views.UserNav
