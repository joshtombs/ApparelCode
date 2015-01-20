@Apparel.module 'Models', (Models, App, Backbone, Marionette, $, _) ->
  class Models.Post extends Backbone.Model
    defaults:
      id: null
      name: null
      user_id: null
      user_name: null
      description: null
      tags: null
      items: null
