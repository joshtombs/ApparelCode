@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeLayout extends Marionette.LayoutView
    template: HandlebarsTemplates['home-layout'],

    regions:
      topNavRegion: '.top-nav'
      sideNavRegion: '.side-nav'
      contentRegion: '.content'

    onShow: ->
      @refreshTopNav()
      @sideNavRegion.show new App.Views.SideNav

    refreshTopNav: ->
      @topNavRegion.show  new App.Views.TopNav
