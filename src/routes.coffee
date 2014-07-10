newrelic = require("newrelic")
http = require("http")

getNamespace = require('continuation-local-storage').getNamespace;
ns = getNamespace('namespace');

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


module.exports = (app) =>
  routes = require("./routes/index")
  users = require("./routes/users")

  app.use "/", routes
  app.use "/users", users
 
  app.get "/test2", (req, res) ->
    ns.set "name", "test2"
    heavy ->
      res.send "hello world"

  app.get "/test3", (req, res) ->
    ns.set "name", "test3"
    heavy ->
      res.send "hello world"
 
  # 
  # error handling
  if app.get("env") is "development"
    app.use (err, req, res, next) ->
      res.status err.status or 500
      res.render "error",
        message: err.message
        error: err

  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: {}
