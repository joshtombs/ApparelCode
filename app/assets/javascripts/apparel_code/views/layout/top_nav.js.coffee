@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.TopNav extends Marionette.ItemView
    template: HandlebarsTemplates['top-nav']
