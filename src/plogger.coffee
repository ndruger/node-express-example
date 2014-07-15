log4js = require('log4js')

wrap = (context, name, makeProc) ->
  context[name] = makeProc(context[name])

if global.ploggerLogger
  return global.ploggerLogger

logger = log4js.getLogger()
logger.setRequestInfoId = (id) ->
  @_requesttInfoId = id + ""
  
old = logger.info
logger


wrap(logger, 'info', (orig) =>
  neko = ->
    newArgs = Array.prototype.slice.apply(arguments);
    if @_requesttInfoId
      newArgs[0] = "[#{@_requesttInfoId}] #{newArgs[0]}"
    orig.apply(logger, newArgs)
)

global.ploggerLogger = logger

module.exports = logger
