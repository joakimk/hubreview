setup = ->
  $(".revisions").on "click", ".revision a", markRevisionAsLastClicked

$(setup)
# document.ready does not trigger for some reason on heroku, probably websocket related
window.setTimeout(setup, 1000)

markRevisionAsLastClicked = ->
  $revision = $(this).parents(".revision-wrapper")
  $(".revision-wrapper").removeClass("last-clicked")
  $revision.addClass("last-clicked")

  # Tell the server that it was clicked
  id = $(".revision-wrapper").attr("id").split("_")[1]
  $.ajax(type: "PUT", url: "/revisions/#{id}?in_review=true")
