Handlebars.registerHelper 'prettySport', (sportSlug) ->
  sportSlug = sportSlug.split('-').join(' ').trim()
  sportSlug.charAt(0).toUpperCase() + sportSlug.slice(1)

Handlebars.registerHelper 'fullCountryName', Sochi.Helpers.preloadedJSON.fullCountryName