@namespace 'Sochi.Views', (exports) ->
  class exports.AthleteModal extends Sochi.View
    name: 'athletes/athlete_modal'
    template: Handlebars.compile '
      <div class="modal">
        <div class="modal_bg"></div>
        <a class="close_modal">X</a>
        <div class="athlete_modal">
          <ul>
            <li>Name: {{name}}</li>
            <li>Sport: {{prettySport sport}}</li>
            <li>Country: {{fullCountryName country}}</li>
          </ul>
        </div>
    </div>
    '
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


