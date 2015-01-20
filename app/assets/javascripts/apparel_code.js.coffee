@Apparel = do (Backbone, Marionette) ->
  window.App = new Marionette.Application

  App.addRegions
    pageRegion: ".page-container"
    loginRegion: ".login-overlay"

  App.on "start", (options={}) ->
    App.appRouter = new App.Routers.AppRouter({
      controller: new App.Controllers.AppController
    })
    App.usePushState = !!(window.history && window.history.pushState)
    if Backbone.history
      Backbone.history.start(pushState: App.usePushState)
      unless App.usePushState
        App.appRouter.navigate window.location.pathname, trigger: true

  App.vent.on "loginShow", ->
    console.log 'trigger'
    menu = new App.Views.LoginMenu
    menu.on "loginClose", ->
      console.log 'closee'
      # App.loginRegion.$el.hide()
      menu.destroy()

    App.loginRegion.show menu
    App.loginRegion.$el.show()

  _.extend Backbone.Marionette.View.prototype,
    behaviors:
      ViewLinks: {}

  Marionette.Behaviors.behaviorsLookup = -> App.Behaviors

  App
