LIMIT_TIME = 100 * 1000

$ ->
  $(".fit-text").fitText()
  $(document).on "click touchstart", ->
    toggle()

toggle = ->
  if @timer
    stop()
  else
    start()

start = ->
  @startTime = new Date()
  @timer = setInterval ( -> step() ), 50
  setColor("yellow")

stop = ->
  clearTimeout @timer
  @timer = null
  $("#second").text("00")
  $("#ms").text("000")
  setColor("lime")
  $(document.body).removeClass("blinking")

step = ->
  time = LIMIT_TIME - (new Date() - @startTime)
  if time < 0
    stop()
    return

  if time < 20 * 1000
    setColor("red")

  if time < 10 * 1000
    $(document.body).addClass("blinking")

  second = Math.floor(time / 1000)
  ms = zeroPadding(time % 1000)
  $("#second").text(second)
  $("#ms").text(ms)

zeroPadding = (num) ->
    ("00" + num).slice(-3)

setColor = (color) ->
  $(document.body).css("color", color)
  $(".color-border").css("border-color", color)