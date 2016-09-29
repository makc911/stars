console.log "Math", Math

Math.randomNum = (val = 1) ->
    return Math.floor(Math.random() * (val + 1))

Math.randomBetween = (min, max) ->
    return Math.floor(min + Math.randomNum(max - min))

Math.randomSign = () ->
    return Math.random() * 2 > 1 ? 1 : -1

Math.getRange = (p1, p2) ->
    return Math.sqrt(Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2));
    