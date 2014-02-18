@namespace 'Sochi.Views', (exports) ->
  class exports.AthleteModal extends Sochi.View
    name: 'athletes/athlete_modal'
    template: Handlebars.compile '<div class="modal athlete_modal">{{name}}, {{prettySport sport}}, {{fullCountryName country}}</div>'
