# A webserver version of le_twittre!
# usage: io twitter_frontend_server.io
# "API" : http://localhost:8080/?user=<username>, otherwise you get the public timeline.
doFile("json.io") # yep, same lib

server := HttpServer clone do(
  setPort(8080)
  renderResponse := method(request, response,
    user := request parameters at("user")
    
    twitter_url := if(user,
      "http://api.twitter.com/1/statuses/user_timeline.json?id=#{user}" interpolate,
      "http://api.twitter.com/1/statuses/public_timeline.json"
    )

    twits := URL with(twitter_url) @fetch
    
    # better than if(user, user, user = "the Public")!
    (user) ifNil(user = "the Public")
    
    response body appendSeq("<h1>Last 20 Tweets by " .. user .. "</h1>")
    
    parsed := formatAndParseJson(twits)
    
    response body appendSeq("<ul>")
    parsed foreach( tweet,
      response body appendSeq("<li><strong>" .. tweet user name .. ":</strong> " .. tweet text .. "</li>")
    )
    response body appendSeq("</ul>")
  )
  
  formatAndParseJson := method(theJson,
    formatForSillyJsonLib := theJson removeAt(0) removeLast
    rebuilt := formatForSillyJsonLib split("},{") map(thing,
      thing removePrefix("{")
      thing removeSuffix("}")
      "{ #{thing} }" interpolate
    )

    rebuilt map(thing, thing parseJson)
  )
)

server start # and now our server is up.