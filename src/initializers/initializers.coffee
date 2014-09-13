path = require("path")
bodyParser = require("body-parser")
cls = require("continuation-local-storage")
clsify = require("cls-middleware")
favicon = require("static-favicon")
baseLogger = require("morgan")
cookieParser = require("cookie-parser")
ns = cls.createNamespace("requestInfo")
express = require("express")

app.use require("connect-assets")(
  paths: [
    path.join(__dirname, "../../assets/js"),
    path.join(__dirname, "../../assets/vendor/js")
  ]
)

app.set "views", path.join(__dirname, "../../views")
app.set "view engine", "jade"

app.use clsify(ns)
app.use baseLogger('dev')
app.use favicon()
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()

app.use express.static(path.join(__dirname, "../../assets"))

app.use((req, res, next) ->
  id = require('cuid')()
  app.getRequestInfo().set('id', id)
  next()
)

require("./logger")
require("./mailer")

# don't move
if app.get("env") == "development"
  require('express-debug')(app, {
  })