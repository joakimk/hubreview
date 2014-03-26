window.Hubreview or= {}
Hubreview.opts or= {}

# Provided as ?open_in_same_page=true
Hubreview.opts.openInSamePage = location.search.indexOf("open_in_same_page") != -1

# Provided as ?me=name
Hubreview.opts.me = decodeURIComponent((location.search.match("me=([^&]+)") || ["", ""])[1])

Hubreview.lastPingTime = new Date()


init = ->
  window.setInterval(reloadWhenSocketConnectionIsLost, 5000)

  # document.ready does not trigger for some reason on heroku, probably websocket related
  window.setTimeout(documentIsReady, 1000)


documentIsReady = ->
  updateRevisionStates()

  scheme = $("body").data("push-scheme")
  uri = scheme + window.document.location.host + "/"
  ws = new WebSocket(uri)
  ws.onmessage = actOnMessage


actOnMessage = (message) ->
  if message.data == "ping"
    Hubreview.lastPingTime = new Date()
  else
    data = JSON.parse(message.data)

    $rev = $("#revision_" + data.revision_id)

    # Didn't exist, so add it.
    # NOTE: Keep this in sync with revisions/index.html.slim.
    if !$rev.length
      $rev = $("<div class='revision-wrapper' id='revision_" + data.revision_id + "'>")
      $(".revisions").prepend($rev)

    $rev.html(data.html)

  updateRevisionStates()


updateRevisionStates = ->
  setUpLinkOpening()
  filterByAuthor()
  updateInReview()

# Handle parameter-based modifications client side because we need to be able to push out
# one version of new pages during github receive for everyone.

# If ?open_in_same_page=true is set, remove target="_blank".
setUpLinkOpening = ->
  if Hubreview.opts.openInSamePage
    $("a[target]").attr("target", "")

# De-emphasize commits by author
filterByAuthor = ->
  authorName = Hubreview.opts.me

  if authorName
    $revisions = $(".revision-author:contains("+authorName+")").parents(".revision-wrapper")
    $revisions.addClass("by-me")

updateInReview = ->
  for revision in $(".revision")
    unix = Math.round(new Date() / 1000)
    timeSinceLastReview = unix - $(revision).attr("last_in_review")
    howLongToConsiderRevisionCurrentlyInReview = 300 # seconds

    if !$(revision).hasClass("was-reviewed") && timeSinceLastReview < howLongToConsiderRevisionCurrentlyInReview
      $(revision).addClass("in-review")
      setTimeout(updateInReview, howLongToConsiderRevisionCurrentlyInReview * 1000)
    else
      $(revision).removeClass("in-review")


reloadWhenSocketConnectionIsLost = ->
  currentTime = new Date()
  secondsSinceLastUpdate = (currentTime - Hubreview.lastPingTime) / 1000

  if secondsSinceLastUpdate > 10
    location.reload()


init()
