@Apparel.module 'Routers', (Routers, App, Backbone, Marionette, $, _) ->
  class Routers.AppRouter extends Marionette.AppRouter
    appRoutes:
      "people": "people"
      "sign_in":"sign_in"
      "":       "root"
