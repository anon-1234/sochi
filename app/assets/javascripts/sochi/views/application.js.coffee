@namespace 'Sochi.Views', (exports) ->
  class exports.Application extends Sochi.View
    events:
      'click a.athlete' : 'moreInfo'
    
    moreInfo: (e) ->
      e.preventDefault()
  
      model = if id = $(e.currentTarget).data("model-id")
        new Sochi.Models.Athlete(id: id)
        
      model.fetch
        success: =>
          @showAthleteModal model

    initialize: ->
      # Using Thorax.LayoutView as a modal shell in order to take advantage of the built in
      # ability to enforce a single view instance and handle dom/event teardown
      @modalContainer = new Sochi.LayoutView()

      @modalContainer.on 'close', ->
        # tear down any active view from LayoutView
        @setView()

      @modalContainer.appendTo('body')

    showAthleteModal: (model) ->
      @modalContainer.setView new Sochi.Views.AthleteModal(model: model)
