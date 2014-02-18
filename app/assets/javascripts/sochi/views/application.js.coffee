@namespace 'Sochi.Views', (exports) ->
  class exports.Application extends Sochi.View
    events:
      "click a.athlete" : "moreInfo"
    
    moreInfo: (e) ->
      e.preventDefault()
  
      model = if id = $(e.currentTarget).data("model-id")
        new Sochi.Models.Athlete(id: id)
        
      model.fetch
        success: =>
          @showAthleteModal model

    showAthleteModal: (model) ->
      athleteModal = new Sochi.Views.AthleteModal(model: model)
      athleteModal.appendTo('body')
