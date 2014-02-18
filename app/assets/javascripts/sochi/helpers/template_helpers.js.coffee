Handlebars.registerHelper 'prettySport', (sportSlug) ->
  sportSlug = sportSlug.split('-').join(' ').trim()
  sportSlug.charAt(0).toUpperCase() + sportSlug.slice(1)

Handlebars.registerHelper 'fullCountryName', (countryCode) ->
  # default to countryCode if code not located in helper json
  Sochi.Helpers.preloadedJSON.countries[countryCode] ? countryCode