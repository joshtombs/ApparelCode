@Apparel.module 'Routers', (Routers, App, Backbone, Marionette, $, _) ->
  class Routers.AppRouter extends Marionette.AppRouter
    appRoutes:
      "people":       "people"
      "sign_in":      "sign_in"
      "sign_up":      "sign_up"
      "signed_out":   "signed_out"
      "post/:id":     "show_post"
      "":             "root"
