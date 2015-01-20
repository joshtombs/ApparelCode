@Apparel.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.ViewLinks extends Marionette.Behavior
    events:
      "click a.virtual": 'routeTrigger'

    routeTrigger: (e) ->
      e.preventDefault()
      App.appRouter.navigate $(e.currentTarget).attr('href'), trigger: 1
