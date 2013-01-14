###
                             .o8
                            "888
   .oooo.o oooo  oooo   .oooo888   .ooooo.  oooo d8b  ooo. .oo.  .oo.   ooo. .oo.
  d88(  "8 `888  `888  d88' `888  d88' `88b `888""8P  `888P"Y88bP"Y88b  `888P"Y88b
  `"Y88b.   888   888  888   888  888ooo888  888       888   888   888   888   888
  o.  )88b  888   888  888   888  888    .o  888  .o.  888   888   888   888   888
  8""888P'  `V88V"V8P' `Y8bod88P" `Y8bod8P' d888b Y8P o888o o888o o888o o888o o888o

                                                        ;-)###
# Gentlemen, load your libraries:
Modernizr.load load: [
  'scripts/lib/jquery.min.js',
  'scripts/lib/underscore.min.js',
  'scripts/dev/fixie.min.js',
], complete: -> jQuery app.init()

# Google Analytics
# window._gaq = [["_setAccount", "UA-35747031-1"], ["_trackPageview"], ["_trackPageLoadTime"]]
# Modernizr.load load: ((if "https:" is location.protocol then "//ssl" else "//www")) + ".google-analytics.com/ga.js"

# All site behavior right here folks!
window.app = {}

app.init = ->
  app.setup()
  app.doSomething(true)

app.setup = ->

  # Ruby-style string interpolation #{...}
  _.templateSettings = interpolate: /\#\{(.+?)\}/g

  # Turn http://, @usernames and #hashtags into links
  _.mixin
    linkify: (string) ->
      string = string.replace /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig, "<a target='_blank' href='$1'>$1</a>"
      string = string.replace /(^|\s)@(\w+)/g, "$1<a target='_blank' href='http://www.twitter.com/$2'>@$2</a>"
      string = string.replace /(^|\s)#(\w+)/g, "$1<a target='_blank' href='http://search.twitter.com/search?q=%23$2'>#$2</a>"

  # Classify iPhones
  if navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i)
    (jQuery 'html').addClass 'iphone'

app.doSomething = (arg)->
