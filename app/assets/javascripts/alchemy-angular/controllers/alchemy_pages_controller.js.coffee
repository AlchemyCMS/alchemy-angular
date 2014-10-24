App.controller('AlchemyPagesController',
  ['$rootScope', '$scope', '$http', '$routeParams',
    ($rootScope, $scope, $http, $routeParams) ->

      # Loads the page from Alchemy's JSON API via given url
      #
      # Sets these values on success:
      #
      #   $rootScope.title
      #   $rootScope.metaKeywords
      #   $rootScope.metaDescription
      #   $scope.elements
      #   $scope.cells
      #   $scope.pageLayout
      #
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

      if $routeParams.id
        # To make this work in Alchemy preview frame we need to load the page from id
        url = "/api/admin/pages/#{$routeParams.id}.json"
      else if $routeParams.page
        # The url from page param
        url = "/api/pages/#{$routeParams.page}.json"
      else
        return

      # Load the page via url
      $scope.loadPage(url)

      return
  ]
)
