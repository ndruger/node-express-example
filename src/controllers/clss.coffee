express = require("express")
nodemailer = require("nodemailer")
http = require("http")

putil = require("../putil")

router = express.Router()

heavy = (cb) ->
  http.get("http://www.google.com", ->
    cb()
  )

router.post "/", (req, res, next) ->
  logger.info('cls sample')
  app.getRequestInfo().set('name', putil.createId())
  heavy ->
    name = app.getRequestInfo().get('name')
    logger.info('cls sample: ', name)
    res.send("hello world #{name}");

module.exports = router
