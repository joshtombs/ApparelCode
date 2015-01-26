@Apparel = do (Backbone, Marionette) ->
  window.App = new Marionette.Application

  App.addRegions
    pageRegion: ".page-container"
    loginRegion: "#loginModal .modal-content"

  App.on "start", (options={}) ->
    App.appRouter = new App.Routers.AppRouter({
      controller: new App.Controllers.AppController
    })
    
    App.CurrentUser = JSON.parse($.ajax({
        type: "GET",
        url: 'current_user',
        async: false
    }).responseText)

    App.HomeLayout = new App.Views.HomeLayout
    App.pageRegion.show App.HomeLayout

    App.usePushState = !!(window.history && window.history.pushState)
    if Backbone.history
      Backbone.history.start(pushState: App.usePushState)
      unless App.usePushState
        App.appRouter.navigate window.location.pathname, trigger: true

  _.extend Backbone.Marionette.View.prototype,
    behaviors:
      ViewLinks: {}

  Marionette.Behaviors.behaviorsLookup = -> App.Behaviors

  App
