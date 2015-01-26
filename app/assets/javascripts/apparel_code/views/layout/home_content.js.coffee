@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeContent extends Marionette.LayoutView
    template: HandlebarsTemplates['home-content'],

    regions:
      bannerRegion: '.banner'
      postsRegion: '.posts'

    onShow: ->
      @bannerRegion.show new App.Views.Banner
      collection = new App.Collections.Posts
      view = new App.Views.Posts(collection: collection)
      collection.fetch()
      @postsRegion.show view

