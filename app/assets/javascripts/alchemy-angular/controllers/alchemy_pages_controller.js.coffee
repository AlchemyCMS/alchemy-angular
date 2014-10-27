App.controller('AlchemyPagesController',
  ['$rootScope', '$scope', '$routeParams', 'AlchemyPage',
    ($rootScope, $scope, $routeParams, AlchemyPage) ->

      # Load the page via service
      #
      request = AlchemyPage.load($routeParams)

      # Sets these values on success:
      #
      #   $rootScope.title
      #   $rootScope.metaKeywords
      #   $rootScope.metaDescription
      #   $scope.elements
      #   $scope.cells
      #   $scope.pageLayout
      #
      request.success (response) ->
        $rootScope.title = response.title
        $rootScope.metaKeywords = response.meta_keywords
        $rootScope.metaDescription = response.meta_description
        $scope.elements = response.elements
        $scope.cells = response.cells
        $scope.pageLayout = response.page_layout
        return

      return
  ]
)
