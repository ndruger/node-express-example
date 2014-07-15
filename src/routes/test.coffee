express = require("express")
router = express.Router()
nodemailer = require("nodemailer")
logger = require("../plogger")

newrelic = require("newrelic")
http = require("http")

heavy = (cb) ->
  console.log('neko3')
  logger.info(app.getRequestInfo().get('name'))
  http.get "http://www.google.com", ->
    logger.info(app.getRequestInfo().get('name'))
#    newrelic.setTransactionName "neko2"
    setTimeout (->
      #    c = c || newrelic.agent.tracer.getRequestInfo();
      logger.info(app.getRequestInfo().get('name'))
      cb()
    ), 1000

router.get "/1", (req, res) ->
  app.getRequestInfo().set('name', 'test3')
  heavy ->
    res.send "hello world"

module.exports = router
