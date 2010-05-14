#
# I cannot for the life of me convince the SQLite Addon to build+install on my machine.
# I was going to combine this and the Builder stuff into a little web app. Ah well.
db := SQLite clone

db setPath("ioTest.sqlite")

db open

db exec("CREATE TABLE IF NOT EXISTS widgets (id INTEGER AUTOINCREMENT PRIMARY KEY ASC, name TEXT, price REAL)")

db exec("INSERT INTO widgets (name, price) VALUES ('flange', 12.34)")
db exec("INSERT INTO widgets (name, price) VALUES ('cog', 1.99)")

rows := db exec("SELECT * FROM widgets")

rows foreach(row,
  writeln(row)
)