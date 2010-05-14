slower := Object clone
faster := Object clone

slower start := method(wait(2); writeln("slowly..."))
faster start := method(wait(1); writeln("faster!"))

# @ sends a message asynchronously with @: ridiculously simple CoRo-age.
slower @start; faster @start; wait(3)


#
# Here's an example of a "Futures" object. If you assign a slot to the result of an as-yet incomplete operation
# (as in the @fetch message below), it is a "future" object: when we pass it to writeln, the process blocks
# until @fetch actually returns.

futureResult := URL with("http://api.twitter.com/1/statuses/user_timeline.json?id=hypomodern") @fetch

writeln("Loading...")

writeln("fetched ", futureResult)