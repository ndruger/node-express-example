app = global.app

routes = require("./routes/index")
users = require("./routes/users")
test = require("./routes/test")
mail = require("./routes/mail")

app.use "/", routes
app.use "/users", users
app.use "/test", test
app.use "/mail", mail

# 
# error handling
#
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
