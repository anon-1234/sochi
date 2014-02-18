@namespace 'Sochi.Views', (exports) ->
  class exports.AthleteModal extends Sochi.View

    # according to http://thoraxjs.org/api.html#templates Handlebars.templates should be auto populated
    # and the template mapped using the View name, however that did not happen for me - therefore am
    # expressly mapping the template to the associated HandlebarsTemplates key, and removing the unused name key
    # name: 'athletes/athlete_modal'
    template: HandlebarsTemplates['athletes/athlete_modal']
    events:
      'click .close_modal': 'close'
      'click .modal_bg': 'close'
      rendered: ->

        # simply using $.addClass does not trigger a css transition between states, needs to be on a zeroed timeout
        setTimeout =>
          @$el.find('.modal').addClass 'active'
        , 0

    close: () ->
      @$el.find('.modal').removeClass 'active'

      # delay view release to allow for css modal opacity transition completion (currently set to 250ms)
      # to take this approach further, hook onto the transition end event and resolve browser inconsistencies
      setTimeout =>

        # Since this view may have been set to a LayoutView
        # if there is a parent, assume a LayoutView container and trigger its close event
        # taking this further may require type checking on the parent
        if @parent then @parent.trigger 'close'
        # otherwise we know this view is standalone, so release it
        else @release()
      , 250


