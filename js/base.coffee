main =
  load_typekit: ->
    try
      Typekit.load()

  speed_slieds: ->
    $("section").each ->
      $bgobj = $(this)
      $(window).scroll ->
        yPos = -($(window).scrollTop() / $bgobj.data("speed")) * 10
        coords = yPos + "px"
        $bgobj.css top: coords

  set_heigh: ->
    $("section").each ->
      $(this).css height: $(window).innerHeight()
      if $(this).attr('id') == "about"
        $(this).css height: $(window).innerHeight() + 200

  slideDown: ->
    $("nav ul li a").click (e) ->
      goTo = $(this).attr("href")
      $("html, body").animate
        scrollTop: $(goTo).offset().top * 7/10
      , 3000

$(document).ready ->
  main.load_typekit()
  main.speed_slieds()
  main.set_heigh()
  main.slideDown()
