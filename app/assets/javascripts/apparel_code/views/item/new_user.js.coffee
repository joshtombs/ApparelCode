@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.NewUser extends Marionette.ItemView
    template: false,

    id: "sign-up"
