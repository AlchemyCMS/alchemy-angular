App.directive 'alchemyElement', ['$sce', ($sce) ->
  {
    restrict: 'E'
    $scope: {
      element: "="
    }
    replace: true
    link: (scope, element, attrs) ->
      scope.elementTemplate = "alchemy/elements/#{scope.element.name}.html"

      scope.ingredients = scope.element.ingredients

      scope.ingredients_with_name = (name) ->
        _.where(scope.ingredients, {name: name})

      scope.ingredient = (name) ->
        ingredient = _.findWhere(scope.ingredients, {name: name})
        ingredient.value if ingredient

      return
    template: '<div ng-include="elementTemplate"></div>'
  }
]
