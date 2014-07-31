express = require("express")
putil = require('../putil')
loggerMaker = require('../logger_maker')

loggerMaker.configure({
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

loggerMaker.initExpressLogger()
loggerMaker.setGetRequestIdProc(->
  app.getRequestInfo().get('id')
)

defaultLogger = loggerMaker.getLogger('default')
global.logger = defaultLogger
