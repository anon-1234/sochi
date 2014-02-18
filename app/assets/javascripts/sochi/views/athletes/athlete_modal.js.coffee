@namespace 'Sochi.Views', (exports) ->
  class exports.AthleteModal extends Sochi.View
    name: 'athletes/athlete_modal'
    template: Handlebars.compile '<div class="modal athlete_modal">{{name}}, {{prettySport sport}}, {{fullCountryName country}}<a class="close_modal">Close</a></div>'
    events:
      'click .close_modal': 'close'
    close: () ->
      # Since this view may have been set to a LayoutView
      # if there is a parent, assume a LayoutView container and trigger its close event
      # taking this further may require type checking on the parent
      if @parent then @parent.trigger 'close'
      # otherwise we know this view is standalone, so release it
      else @release()
