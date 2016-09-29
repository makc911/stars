app.factory 'SpaceFactory', (GalaxyFactory) ->

  class Space

    constructor: (options) ->

      this.context = options.context
      this.element = options.element
      this.canvas = options.canvas
      this.galaxiesAmount = options.galaxiesAmount
      this.starsAmount = options.starsAmount
      this.galaxies = []

      this.setSize(options.size)

      this.minRangeBetween = Math.sqrt(Math.pow(this.size.width, 2) + Math.pow(this.size.height, 2)) / 12;


    setSize: (size) ->
      console.log "size", size
      this.size =
        width: size.width
        height: size.height

      this.canvas.width = size.width;
      this.canvas.height = size.height;

    createGalaxies: () ->
      for i in [0 ... this.galaxiesAmount]
        rangeChance = 0
        newGalaxyParams = {}

        while rangeChance < 30
          checkRange = true
          newGalaxyParams =
            startPos:
              x: Math.randomBetween(0, this.size.width) - this.size.width * 0.1,
              y: Math.randomBetween(0, this.size.height) - this.size.height * 0.1
            space: this

          _.each this.galaxies, (item, index) ->
            r = Math.getRange(item.startPos, newGalaxyParams.startPos)
            if this.minRangeBetween > r 
              checkRange = false

          if checkRange then rangeChance = 30 else rangeChance++

        galaxy = new GalaxyFactory newGalaxyParams
        galaxy.createStars()

        this.galaxies.push galaxy

    move: () ->
      requestAnimationFrame(this.move.bind(this))
      this.draw()

    draw: () ->
      this.context.clearRect(0, 0, this.size.width, this.size.height);
      _.each this.galaxies, (item) ->
        item.draw()

  return Space