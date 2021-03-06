Application.factory "ThemeLoader", ['$http', '$q', ($http, $q) ->

  themes = ->
    defer = $q.defer()
    themes = $http.get("/gallery.json")
    themes.success (data) ->
      for theme in data
        theme.type = if theme.light then 'light' else 'dark'
      defer.resolve(data)
    defer.promise

  load = (theme) -> $http.get("/get_uri?uri=#{encodeURIComponent(theme.url)}")

  return {
    themes: themes
    load: load
  }

]
