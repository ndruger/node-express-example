express = require("express")
putil = require('../putil')
logger = require('../plogger')

logger.configure({
  appenders: [{
    type: "console",
  },
  {
    type: "dateFile",
    filename: "log/access.log",
    pattern: "-yyyy-MM-dd",
    alwaysIncludePattern: true
  }],
# replaceConsole: true
})
putil.updateDP

app.use((req, res, next) ->
  id = putil.createId()
  app.getRequestInfo().set('id', id)
  logger.setRequestInfoId(id)
  next()
  logger.info([
    req.headers['x-forwarded-for'] || req.client.remoteAddress,
    req.method,
    req.url,
    res.statusCode,
  ].join(" "))
)

# TODO: fix
app.use(logger.log4js.connectLogger(logger, { level: logger.log4js.levels.INFO }));
