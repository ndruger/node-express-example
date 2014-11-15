require('source-map-support').install()
cluster = require('cluster')
_ = require('lodash')
config = require('config')

if cluster.isMaster
  cpuCount = require('os').cpus().length
  _.times(cpuCount, ->
    cluster.fork()
  )

else
  express = require("express")

  app = express()
  app.getRequestInfo = ->
    getNamespace = require('continuation-local-storage').getNamespace
    getNamespace('requestInfo')

  global.app = app

  require("./dst/initializers/initializers")
  newrelic = require("newrelic") # Don't move to initializer
  require("./dst/routes")

  module.exports = app
  app.listen 3000

