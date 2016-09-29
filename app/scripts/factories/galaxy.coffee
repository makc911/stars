app.factory 'GalaxyFactory', (StarFactory) ->

  class Galaxy

    constructor: (options) ->

      this.space = options.space
      this.stars = []
      this.startPos = 
        x: options.startPos.x
        y: options.startPos.y

      this.currentPos =
        x: options.startPos.x
        y: options.startPos.y

      this.size =
        width: Math.randomBetween(this.space.size.width * 0.05, this.space.size.width * 0.15),
        height: Math.randomBetween(this.space.size.height * 0.05, this.space.size.height * 0.15),


    createStars: () ->

      starsAmount = Math.randomBetween(this.space.starsAmount * 0.5, this.space.starsAmount * 1.5)

      for i in [0 ... starsAmount]
        newStarParams =
          startPos:
            x: Math.randomBetween(0, this.size.width),
            y: Math.randomBetween(0, this.size.height)
          galaxy: this

        star = new  StarFactory(newStarParams)
        this.stars.push star

    draw: () ->
      _.each this.stars, (item) ->
        item.move()
        item.draw()
        return

  return Galaxy