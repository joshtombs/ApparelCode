@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.Person extends Marionette.ItemView
    template: HandlebarsTemplates['person'],

    render: ->
      @$el.html(@template(@model.attributes))
      # Get rid of that pesky wrapping-div.
      @$el = @$el.children()
      @$el.unwrap()
      @setElement(@$el)
