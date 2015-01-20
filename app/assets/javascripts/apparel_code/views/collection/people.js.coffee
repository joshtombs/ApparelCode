@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.People extends Marionette.CollectionView
    childView: App.Views.Person

    className: "col-md-12"
