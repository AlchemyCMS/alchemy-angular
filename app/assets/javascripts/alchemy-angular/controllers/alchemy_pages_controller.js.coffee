App.controller 'AlchemyPagesController', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->

  $scope.loadPage = (url) ->
    $http.get(url).success (response) ->
      $scope.elements = response.elements
      $scope.cells = response.cells
      $scope.page_layout = response.page_layout
      return
    return

  # To make this work in Alchemy preview frame
  if $routeParams.id
    url = "/api/admin/pages/#{$routeParams.id}.json"
  else if $routeParams.page
    url = "/api/pages/#{$routeParams.page}.json"
  else
    return

  $scope.loadPage(url)
  return
]
