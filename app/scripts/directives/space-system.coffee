app.directive 'spaceSystem', () ->

  template: '<canvas class="space-system-canvas"></canvas>',
  scope:
    galaxiesAmount: '@',
    starsAmount: '@'

  link: ($scope, $element, $attrs) ->

    _element = $element[0]
    _canvas = _element.getElementsByTagName('canvas')[0]
    _window = {height: _element.offsetHeight, width: _element.offsetWidth}

    options =
      width: _window.width, 
      height: _window.height, 
      galaxiesAmount: $scope.galaxiesAmount,
      starsAmount: $scope.starsAmount,
      canvas: _canvas,
      context: _canvas.getContext("2d"),
      element: $element[0]

    return 