if navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)
  metaViewPort = $("meta[name=viewport]:first")
  if metaViewPort
    metaViewPort.attr("content", "width=device-width, minimum-scale=1.0, maximum-scale=1.0")

    $("body").on "gesturestart", ->
      metaViewPort.attr("content", "width=device-width, minimum-scale=0.25, maximum-scale=1.6")
      false

$(document).on "mousemove", (event) ->
  $width = $(document).width() / 255
  $pageX = parseInt(event.pageX / $width, 0.5)

  $("body").css("background-color", "hsl(#{$pageX}, 80%, 65%)")
