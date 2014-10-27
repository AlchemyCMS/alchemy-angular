App.service 'AlchemyPage', ['$http', ($http) ->

  url_for = (params) ->
    if params.id
      # To make this work in Alchemy preview frame we need to load the page from id
      "/api/admin/pages/#{params.id}.json"
    else if params.page
      # The url from page param
      "/api/pages/#{params.page}.json"
    else
      throw new Error("No params to load page from found! You need to provide an object with either `id` or `page` attribute.")

  # Loads the page from Alchemy's JSON API via given params and returns a promise
  #
  @load = (params) ->
    $http.get url_for(params)

  return
]
