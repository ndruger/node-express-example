require('source-map-support').install()
cluster = require('cluster')
_ = require('lodash')
config = require('config')

if cluster.isMaster && config.useCluster
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
  
  if process.env.NODE_ENV != 'test'
    newrelic = require("newrelic") # Don't move to initializer
   
  require("./dst/routes")

  module.exports = app
  if process.env.NODE_ENV == 'test'
    app.listen()
  else
    app.listen(3000)
