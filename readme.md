## Playing Around with Io

Io is an interesting little prototype-based language. It has a significantly higher purity of essence than the world's most popular prototype-based language, javascript, in that it is pure message passing, which is pretty cool. I consider myself something of a javascript expert; one of my favorite things about javascript *is* the inheritance chain, so it is pretty cool to see Io in action.

It is lightweight, so there are a lot of rough edges (like, say, *installing things*), but there are some quite interesting language features like built-in and easy to use CoRos and a mega-simple Actor pattern. Check out `coroutines_and_actors.io`. Also compare how easy setting up a webserver (`twitter_frontend_server.io` or `basic_http_server.io`) to Node.js.

I couldn't get a lot of the Addons to build in my limited time with it so far, which was a major downside. I have plans to build a mini-web-framework, but only if I can figure out how to get the SQLite package to work.