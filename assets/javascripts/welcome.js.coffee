if navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)
  metaViewPort = $("meta[name=viewport]:first")
  if metaViewPort
    metaViewPort.attr("content", "width=device-width, minimum-scale=1.0, maximum-scale=1.0")

    $("body").on "gesturestart", ->
      metaViewPort.attr("content", "width=device-width, minimum-scale=0.25, maximum-scale=1.6")
      false

$(window).on "load", ->
  unless Modernizr.touch
    $window = $(window)

    w = 0
    h = 0

    getWidth = ->
      w = $window.width()
      h = $window.height()

    $window.resize(getWidth).on "mousemove", (e) ->
      rgb = [
        Math.round((w-e.pageX)/w * 255),
        Math.round((h-e.pageY)/h * 255),
        150
      ]

      $("body > .container").css("background", "rgb(#{rgb.join(',')})")

    .resize()
