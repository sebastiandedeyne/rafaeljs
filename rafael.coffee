Rafael = ->
  enabled = true

  events =
    raf:      []
    resize:   []
    resizeX:  []
    resizeY:  []
    scroll:   []
    scrollX:  []
    scrollY:  []

  dimensions      = { x: 0, y: 0 }
  oldDimensions   = { x: 0, y: 0 }
  positions       = { x: 0, y: 0 }
  oldPositions    = { x: 0, y: 0 }

  rAF = ->
    window.requestAnimationFrame rAF
    if enabled
      do registerValues
      do fire

  bind = (eventsToBind, callable) ->
    for eventToBind, i in eventsToBind.split ' '
      if events.hasOwnProperty eventToBind
        events[eventToBind].push callable

  registerValues = ->
    oldDimensions.x   = dimensions.x
    oldDimensions.y   = dimensions.y
    oldPositions.x    = positions.x
    oldPositions.y    = positions.y

    dimensions.x    = window.innerWidth
    dimensions.y    = window.innerHeight
    positions.x     = document.body.scrollLeft
    positions.y     = document.body.scrollTop

  fire = ->
    runFunctionsForEvent 'raf'
    if dimensions.x isnt oldDimensions.x or dimensions.y isnt oldDimensions.y
      runFunctionsForEvent 'resize'
    if dimensions.x isnt oldDimensions.x
      runFunctionsForEvent 'resizeX'
    if dimensions.y isnt oldDimensions.y
      runFunctionsForEvent 'resizeY'
    if positions.x isnt oldPositions.x or positions.y isnt oldPositions.y
      runFunctionsForEvent 'scroll'
    if positions.x isnt oldPositions.x
      runFunctionsForEvent 'scrollX'
    if positions.y isnt oldPositions.y
      runFunctionsForEvent 'scrollY'

  runFunctionsForEvent = (firedEvents) ->
    for firedEvent, i in firedEvents.split ' '
      for callable, i in events[firedEvent]
        do callable

  stop = ->
    enabled = false

  start = ->
    enabled = true

  isEnabled = ->
    enabled

  do rAF

  return {
    bind: bind
    dimensions: dimensions
    oldDimensions: oldDimensions
    positions: positions
    oldPositions: oldPositions
    stop: stop
    start: start
    enabled: isEnabled
  }
