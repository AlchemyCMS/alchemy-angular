App.controller('AlchemyPagesController',
  ['$rootScope', '$scope', '$routeParams', 'AlchemyPage',
    ($rootScope, $scope, $routeParams, AlchemyPage) ->

      # Track a google analytics page hit
      trackGAPageHit = (url, title) ->
        window.ga 'send',
          'hitType': 'pageview',
          'page': url,
          'title': title

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
        # if google analytics object is present we track the page hit
        if window.ga?
          trackGAPageHit("/#{$routeParams.page}", response.title)
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
