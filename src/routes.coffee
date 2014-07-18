app = global.app

routes = require("./routes/index")
users = require("./routes/users")
test = require("./routes/test")
mail = require("./routes/mail")
error = require("./routes/error")
putil = require('./putil')
util = require('util')

app.use "/", routes
app.use "/users", users
app.use "/test", test
app.use "/mail", mail
app.use "/error", error

try
  throw Error('neko')
catch e
  console.log(util.inspect(e))
  console.dir(e)

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
