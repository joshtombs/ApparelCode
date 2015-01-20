@Apparel.module 'Models', (Models, App, Backbone, Marionette, $, _) ->
  class Models.User extends Backbone.Model
    defaults:
      username: null
      email: null
      age: null
      title: null
      city: null
      country: null
