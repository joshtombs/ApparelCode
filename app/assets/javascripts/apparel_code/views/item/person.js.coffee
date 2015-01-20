@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.Person extends Marionette.ItemView
    template: HandlebarsTemplates['person'],

    render: ->
      @$el.html(@template(@model.attributes))
      # Get rid of that pesky wrapping-div.
      # Assumes 1 child element present in template.
      @$el = @$el.children()
      # Unwrap the element to prevent infinitely 
      # nesting elements during re-render.
      @$el.unwrap()
      @setElement(@$el)
