app.factory 'StarFactory', () ->

  class Star

    constructor: (options) ->

      this.galaxy = options.galaxy

      this.startPos = 
        x: options.startPos.x
        y: options.startPos.y

      this.currentPos =
        x: options.startPos.x
        y: options.startPos.y

      this.direction =
        x: Math.randomBetween(-100, 100) / 2000
        y: Math.randomBetween(-100, 100) / 2000

      this.range = Math.randomBetween(30, 20)

      this.size = Math.randomBetween(1,3)
      this.sizeDirection = (Math.randomBetween(10, 20) - 10) / 200

      this.opacity = Math.random()
      this.opacityDirection = (Math.random() - 0.5) / 50


    draw: () ->
      ctx = this.galaxy.space.context
      galPos = this.galaxy.currentPos

      ctx.beginPath()
      ctx.arc(this.currentPos.x + galPos.x, this.currentPos.y + galPos.y, this.size, 0, Math.PI * 2, true)
      ctx.fillStyle = "rgba(190, 190, 190, #{this.opacity})"
      ctx.fill()

    move: () ->
      this.changeOpacity()
      this.changeSize()
      this.changePosition()


    changeOpacity: () ->
      this.opacity += this.opacityDirection
      if this.opacity <= 0.10
        this.opacityDirection *= (-1)
        this.opacity = 0.101
      else if this.opacity > 1
        this.opacityDirection *= (-1)
        this.opacity = 1

    changeSize: () ->
      this.size += this.sizeDirection
      if this.size <= 0.5
        this.sizeDirection *= (-1)
        this.size = 0.51
      else if this.size > 3
        this.sizeDirection *= (-1)
        this.size = 3

    changePosition: () ->
      this.currentPos.x += this.direction.x
      if Math.abs(this.currentPos.x - this.startPos.x) > this.range 
        this.direction.x *= -1 

      this.currentPos.y += this.direction.y
      if Math.abs(this.currentPos.y - this.startPos.y) > this.range 
        this.direction.y *= -1 



  return Star