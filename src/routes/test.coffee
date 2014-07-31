express = require("express")
router = express.Router()
nodemailer = require("nodemailer")

newrelic = require("newrelic")
http = require("http")

heavy = (cb) ->
  logger.info(1)
  http.get "http://www.google.com", ->
    logger.info(2)
#    newrelic.setTransactionName "neko2"
    setTimeout (->
      #    c = c || newrelic.agent.tracer.getRequestInfo();
      logger.info(3)
      cb()
    ), 1000

router.get "/1", (req, res) ->
  DP('test')
  app.getRequestInfo().set('name', 'test3')
  heavy ->
    res.send "hello world"

module.exports = router
