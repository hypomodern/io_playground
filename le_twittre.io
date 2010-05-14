# This is a command-line Twitter feed checker. Primitive, but just messin' with Socket.
# usage: io le_twittre.io <username>
doFile("json.io") # import us some primitive looking JSON parsing I found on the interwebs

# ARGV == System args
user := System args at(1)

twitter_url := if(user,
  "http://api.twitter.com/1/statuses/user_timeline.json?id=#{user}" interpolate,
  "http://api.twitter.com/1/statuses/public_timeline.json"
)

twits := URL with(twitter_url) @fetch

# holy crap:
if(user, user, user = "the public")
writeln("Loading tweets for #{user}..." interpolate)

# So... this json lib doesn't do base arrays, so we need to purge the surrounding [] chars
#       then split on tweet breakage ourselves, and reconstruct the json. Yikes :).
#       I'm probably missing something like a built-in JSON lib, but since the Yajl Addon
#       doesn't work in MacOS, bork bork bork.
formatForSillyJsonLib := twits removeAt(0) removeLast
rebuilt := formatForSillyJsonLib split("},{") map(thing,
  thing removePrefix("{")
  thing removeSuffix("}")
  "{ #{thing} }" interpolate
)

parsed := rebuilt map(thing, thing parseJson)

parsed foreach( tweet, writeln(tweet user name, ": ", tweet text) )