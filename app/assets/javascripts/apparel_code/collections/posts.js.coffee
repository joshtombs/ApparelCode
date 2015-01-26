@Apparel.module 'Collections', (Collections, App, Backbone, Marionette, $, _) ->
  class Collections.Posts extends Backbone.Collection
    url: '/posts'
    model: App.Models.Post
