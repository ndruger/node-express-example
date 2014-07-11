express = require("express")
router = express.Router()
nodemailer = require("nodemailer")

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


router.get "/1", (req, res) ->
  console.log('neko')
  ns.set "name", "test2"
  console.log('neko')
     
  heavy ->
    res.send "hello world"

module.exports = router
