@Apparel.module 'Collections', (Collections, App, Backbone, Marionette, $, _) ->
  class Collections.Users extends Backbone.Collection
    url: '/users'
    model: App.Models.User
