app.directive 'spaceSystem', (SpaceFactory, PageFactory) ->

  template: '<canvas class="space-system-canvas"></canvas>',
  scope:
    galaxiesAmount: '@',
    starsAmount: '@'

  link: ($scope, $element, $attrs) ->

    _element = $element[0]
    _canvas = _element.getElementsByTagName('canvas')[0]

    options =
      size: 
        height: _element.offsetHeight
        width: _element.offsetWidth
      galaxiesAmount: $scope.galaxiesAmount,
      starsAmount: $scope.starsAmount,
      canvas: _canvas,
      context: _canvas.getContext("2d"),
      element: _element

    _space = new SpaceFactory(options)
    console.log "Space -> ", _space
    _space.createGalaxies()
    _space.draw()
    _space.move()

    

    return 