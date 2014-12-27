# thanks to Jonathon Wolfe at http://reed.github.io/turbolinks-compatibility/google_analytics.html

class @GoogleAnalytics

  @load: ->
    # Google Analytics depends on a global _gaq array. window is the global scope.
    window._gaq = []
    window._gaq.push ["_setAccount", GoogleAnalytics.analyticsId()]

    # Create a script element and insert it in the DOM
    ga = document.createElement("script")
    ga.type = "text/javascript"
    ga.async = true
    ga.src = ((if "https:" is document.location.protocol then "https://ssl" else "http://www")) + ".google-analytics.com/ga.js"
    firstScript = document.getElementsByTagName("script")[0]
    firstScript.parentNode.insertBefore ga, firstScript

    # If Turbolinks is supported, set up a callback to track pageviews on page:change.
    # If it isn't supported, just track the pageview now.
    if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
      document.addEventListener "page:change", (->
        GoogleAnalytics.trackPageview()
      ), true
    else
      GoogleAnalytics.trackPageview()
      GoogleAnalytics.trackAddToCart()
      GoogleAnalytics.trackEmptyCart()

  @trackPageview: (url) ->
    unless GoogleAnalytics.isLocalRequest()
      if url
        window._gaq.push ["_trackPageview", url]
      else
        window._gaq.push ["_trackPageview"]
      window._gaq.push ["_trackPageLoadTime"]

  @trackAddToCart: () ->
    unless GoogleAnalytics.isLocalRequest()
      $(document).on('click', '.check-out', ( ->
        window._gaq.push ['_trackEvent', 'cart', 'added']
      ));

  @trackEmptyCart: () ->
    unless GoogleAnalytics.isLocalRequest()
      $(document).on('click', '.empty-cart', ( ->
        window._gaq.push ['_trackEvent', 'cart', 'empty']
      ));

  @trackCheckOut: () ->
    unless GoogleAnalytics.isLocalRequest()
      $(document).on('click', '.cart-check-out', ( ->
        window._gaq.push ['_trackEvent', 'Cart', 'check-out']
      ));

  @trackAddToCart: (url) ->
    unless GoogleAnalytics.isLocalRequest()
      if url
        window._gaq.push ["_addToCart", url]
      else
        window._gaq.push ["_addToCart"]

  @isLocalRequest: ->
    GoogleAnalytics.documentDomainIncludes "local"

  @documentDomainIncludes: (str) ->
    document.domain.indexOf(str) isnt -1

  @analyticsId: ->
    'UA-56565633-1'

GoogleAnalytics.load()
