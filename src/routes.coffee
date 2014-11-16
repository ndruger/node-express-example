app = global.app

routes = require("./controllers/index")
users = require("./controllers/users")
clss = require("./controllers/clss")
mails = require("./controllers/mails")
errors = require("./controllers/errors")
if app.get("env") != "test"
  redisTest = require("./controllers/redis_test")
putil = require('./putil')
util = require('util')

app.use "/", routes
app.use "/users", users
app.use "/clss", clss
app.use "/mails", mails
app.use "/errors", errors

if app.get("env") != "test"
  app.use "/redis-test", redisTest

#
# error handling
#
if app.get("env") == "development"
  app.use (err, req, res, next) ->
    putil.sendExceptionMail(err)
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: err
else
  app.use (err, req, res, next) ->
    putil.sendExceptionMail(err)
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: {}
