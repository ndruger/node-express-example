require('source-map-support').install()

process.env.NODE_ENV ||= 'development'

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

  if config.useRepl
    replify = require('replify')
    replify('node-express-example', require('http').createServer())

  app = express()

  app.getRequestInfo = ->
    getNamespace = require('continuation-local-storage').getNamespace
    getNamespace('requestInfo')

  global.app = app

  require("./dst/initializers/initializers")
  
  if process.env.NODE_ENV != 'test'
    newrelic = require("newrelic") # Don't move to initializer
   
  require("./dst/routes")

  port = if process.env.NODE_ENV == 'test' then undefined else 3000
  app.listen(port, ->
    logger.info('Listening');
  )
  
  module.exports = app
