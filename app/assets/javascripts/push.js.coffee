lastPingTime = new Date()

$ ->
  $(".revisions").on "click", ".rev a", ->
    $revision = $(this).parents(".revision-wrapper")
    $(".revision-wrapper").removeClass("last-clicked")
    $revision.addClass("last-clicked")

  scheme   = $("body").data("push-scheme")
  uri      = scheme + window.document.location.host + "/"
  ws       = new WebSocket(uri)

  console.log("Setting up")

  ws.onmessage = (message) ->
    console.log("Getting message: #{message}")
    if message.data == "ping"
      lastPingTime = new Date()
      console.log("Got ping from server.")
    else
      data = JSON.parse(message.data)

      $rev = $("#revision_" + data.revision_id)

      # Didn't exist, so add it.
      # NOTE: Keep this in sync with revisions/index.html.slim.
      if !$rev.length
        $rev = $("<div class='revision-wrapper' id='revision_" + data.revision_id + "'>")
        $(".revisions").prepend($rev)

      $rev.html(data.html)

    setUpLinkOpening()
    filterByAuthor()

# Handle parameter-based modifications client side because we need to be able to push out
# one version of new pages during github receive for everyone.

# If ?open_in_same_page=true is set, remove target="_blank".
setUpLinkOpening = ->
  if location.search.indexOf("open_in_same_page") != -1
    $("a[target]").attr("target", "")

# De-emphasize commits by author provided as ?me=name
filterByAuthor = ->
  authorName = decodeURIComponent((location.search.match("me=([^&]+)") || ["", ""])[1])

  if authorName
    $revisions = $(".revision-author:contains("+authorName+")").parents(".revision-wrapper")
    $revisions.addClass("by-me")


reloadWhenSocketConnectionIsLost = ->
  currentTime = new Date()
  secondsSinceLastUpdate = (currentTime - lastPingTime) / 1000.0

  if secondsSinceLastUpdate > 10
    location.reload()

window.setInterval(reloadWhenSocketConnectionIsLost, 5000)
