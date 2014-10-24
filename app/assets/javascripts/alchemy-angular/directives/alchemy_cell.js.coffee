App.directive 'alchemyCell', ->
  {
    restrict: 'E'
    scope: {
      cell: "="
    }
    replace: true
    link: (scope, element, attrs) ->
      scope.cellTemplate = "alchemy/cells/#{scope.cell.name}.html"
      scope.elements = scope.cell.elements
      return
    template: '<div ng-include="cellTemplate"></div>'
  }
