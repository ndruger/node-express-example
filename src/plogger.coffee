log4js = require('log4js')

if global.ploggerLogger
  module.exports = global.ploggerLogger
  return

wrap = (context, name, makeProc) ->
  context[name] = makeProc(context[name])

logger = log4js.getLogger()
logger.log4js = log4js


logger.configure = (config) ->
  log4js.configure(config)

logger.setRequestInfoId = (id) ->
  @_requesttInfoId = id + ""
  

wrap(logger, 'info', (orig) =>
  (->
    newArgs = Array.prototype.slice.apply(arguments)
    if @_requesttInfoId
      newArgs[0] = "[#{@_requesttInfoId}] #{newArgs[0]}"
    orig.apply(logger, newArgs)
  )
)

global.ploggerLogger = logger

module.exports = logger
