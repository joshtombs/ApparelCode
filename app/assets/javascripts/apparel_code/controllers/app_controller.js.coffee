@Apparel.module 'Controllers', (Controllers, App, Backbone, Marionette, $, _) ->
  class Controllers.AppController extends Marionette.Controller
    root: ->
      App.pageRegion.show(new App.Views.HomeLayout({
        toShow: 'posts'
      }))

    people: ->
      App.pageRegion.show(new App.Views.HomeLayout({
        toShow: 'people'
      }))

    sign_in: ->
      App.vent.trigger "loginShow"
