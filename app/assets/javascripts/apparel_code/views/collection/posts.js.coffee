@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.Posts extends Marionette.CollectionView
    childView: App.Views.Post,

    className: "col-md-12"
