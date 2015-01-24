@Apparel.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.ViewLinks extends Marionette.Behavior
    events:
      "click a.virtual": 'routeTrigger'

    routeTrigger: (e) ->
      e.preventDefault()
      previousRoute = "/" + Backbone.history.fragment
      if (previousRoute == $(e.currentTarget).attr('href'))
        Backbone.history.loadUrl(Backbone.history.fragment)
      else
        App.appRouter.navigate $(e.currentTarget).attr('href'), trigger: 1
