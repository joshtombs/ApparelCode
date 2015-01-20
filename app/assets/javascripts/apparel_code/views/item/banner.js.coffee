@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.Banner extends Marionette.ItemView
    template: HandlebarsTemplates['banner'],
