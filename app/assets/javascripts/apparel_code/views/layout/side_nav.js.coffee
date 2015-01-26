@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.SideNav extends Marionette.ItemView
    template: HandlebarsTemplates['side-nav']
