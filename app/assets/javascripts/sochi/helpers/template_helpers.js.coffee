Handlebars.registerHelper 'prettySport', (sportSlug) ->
  words = sportSlug.trim().split('-')
  output = []
  for word in words
    output.push word.charAt(0).toUpperCase() + word.slice(1)
  output.join(' ')

Handlebars.registerHelper 'fullCountryName', (countryCode) ->
  # default to countryCode if code not located in helper json
  Sochi.Helpers.preloadedJSON.countries[countryCode] ? countryCode