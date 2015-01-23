@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.UserNav extends Marionette.LayoutView
    template: HandlebarsTemplates['user']
