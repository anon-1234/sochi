@namespace 'Sochi.Helpers', (exports) ->
  countriesJson=
    'AUS': 'Australia'
    'USA': 'United States'
  exports.preloadedJSON =
    fullCountryName: (countryCode) ->
      countriesJson[countryCode] ? countryCode