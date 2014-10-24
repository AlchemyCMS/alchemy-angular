App.directive 'alchemyCell', ->
  {
    restrict: 'E'
    scope: {
      cell: "="
    }
    replace: true
    link: (scope, element, attrs) ->

      # Every cell has its very own template.
      # The cells are placed at your angular template path
      # with 'alchemy/cells' prefix
      scope.cellTemplate = "alchemy/cells/#{scope.cell.name}.html"

      # Elements of current cell
      scope.elements = scope.cell.elements

      return
    template: '<div ng-include="cellTemplate"></div>'
  }
