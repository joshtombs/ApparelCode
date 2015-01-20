@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeLayout extends Marionette.LayoutView
    template: HandlebarsTemplates['home-layout'],

    regions:
      topNavRegion: '.top-nav'
      sideNavRegion: '.side-nav'
      contentRegion: '.content'

    events:
      'click .button.join':  'joinClicked'
      # 'click .button.login': 'loginClicked'

    initialize: (options) ->
      @toShow = options.toShow

    onShow: ->
      @topNavRegion.show new App.Views.TopNav
      @sideNavRegion.show new App.Views.SideNav
      if @toShow == 'people'
        @showPeople()
      else
        @contentRegion.show new App.Views.HomeContent 

    # loginClicked: -> App.vent.trigger "login:show"

    showPeople: ->
      collection = new App.Collections.Users
      view = new App.Views.People(collection: collection)
      collection.fetch()
      @contentRegion.show view

    joinClicked: ->
      alert 'join button clicked'
