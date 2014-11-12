# Routes
App.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)

  $routeProvider
    # Route for displaying this page in Alchemy page preview
    .when '/admin/pages/:id',
      controller: 'AlchemyPagesController'
      templateUrl: 'alchemy/page.html'
    # Route for displaying page
    .when '/:page*',
      controller: 'AlchemyPagesController'
      templateUrl: 'alchemy/page.html'
    # Route not found -> 404
    .otherwise
      templateUrl: '/404.html'

  return
]
