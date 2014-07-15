express = require("express")
putil = require('../putil')
logger = require('../plogger')

app.use((req, res, next) ->
  id = putil.createId()
  app.getRequestInfo().set('id', id)
  logger.setRequestInfoId(id)
  logger.info(req.url)
  next()
)