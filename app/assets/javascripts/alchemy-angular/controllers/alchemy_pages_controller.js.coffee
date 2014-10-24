App.controller('AlchemyPagesController',
  ['$rootScope', '$scope', '$http', '$routeParams',
    ($rootScope, $scope, $http, $routeParams) ->
      $scope.loadPage = (url) ->
        $http.get(url).success (response) ->
          $rootScope.title = response.title
          $rootScope.metaKeywords = response.meta_keywords
          $rootScope.metaDescription = response.meta_description
          $scope.elements = response.elements
          $scope.cells = response.cells
          $scope.pageLayout = response.page_layout
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
)
