@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.NewUser extends Marionette.ItemView
    template: HandlebarsTemplates['new-user'],
