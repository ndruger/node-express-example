
# view engine setup

#app.use(logger('dev'));

# error handlers

# development error handler
# will print stacktrace

# production error handler
# no stacktraces leaked to user

#function trans() {
#  return newrelic.agent.tracer.getTransaction();
#}
trans = ->
  url: ns.get("name")
heavy = (cb) ->
  console.log trans().url
  a = a or newrelic.agent.tracer.getTransaction()
  http.get "http://www.google.com", ->
    console.log trans().url
    
    #   b = b || newrelic.agent.tracer.getTransaction();
    newrelic.setTransactionName "neko2"
    setTimeout (->
      
      #    c = c || newrelic.agent.tracer.getTransaction();
      console.log trans().url
      
      #  console.log('test', a === b, b === c);
      #      console.log(a, b, c);
      cb()
      return
    ), 1000
    return

  return
cls = require("continuation-local-storage")
clsify = require("cls-middleware")
express = require("express")
path = require("path")
favicon = require("static-favicon")
logger = require("morgan")
cookieParser = require("cookie-parser")
bodyParser = require("body-parser")
newrelic = require("newrelic")
ns = cls.createNamespace("namespace")
routes = require("./routes/index")
users = require("./routes/users")
app = express()
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"
app.use clsify(ns)
app.use favicon()
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()
app.use express.static(path.join(__dirname, "public"))
app.use "/", routes
app.use "/users", users
app.get "/test2", (req, res) ->
  ns.set "name", "test2"
  heavy ->
    res.send "hello world"
    return

  return

app.get "/test3", (req, res) ->
  ns.set "name", "test3"
  heavy ->
    res.send "hello world"
    return

  return

if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: err

    return

app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render "error",
    message: err.message
    error: {}

  return

http = require("http")
a = undefined
b = undefined
c = undefined
module.exports = app
app.listen 3000
