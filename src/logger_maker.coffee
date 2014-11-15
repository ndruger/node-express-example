log4js = require('log4js')
_ = require('lodash')
require('colors')

getRequestIdProc = null

wrap = (context, name, makeProc) ->
  context[name] = makeProc(context[name])

wrapLogger = (logger) ->
  _.each(['info', 'debug', 'warn', 'error'], (name) ->
    wrap(logger, name, (orig) =>
      (->
        newArgs = Array.prototype.slice.apply(arguments)
        newArgs[0] = "[#{(getRequestId() || '').blue}] #{newArgs[0]}"
        orig.apply(logger, newArgs)
      )
    )
  )

getRequestId = () ->
  if getRequestIdProc
    getRequestIdProc()
  else
    ''

getLogger = (optName) ->
  logger = log4js.getLogger(optName)
  wrapLogger(logger)
  logger
  
requestId = ""

module.exports = {
  configure: (config) ->
    log4js.configure(config)
  setGetRequestIdProc: (proc) ->
    getRequestIdProc = proc
  getLogger: getLogger
  initExpressLogger: () ->
    baseLogger = getLogger('base')
    app.use(log4js.connectLogger(baseLogger,
      level: log4js.levels.INFO
    #  'nolog': [ '\\css', '\\.js', '\\.gif' ],
      format: (req, res, orig) ->
        t = orig(
          ':remote-addr - - ' +
            '":method :url HTTP/:http-version"' +
            ' :status' +
            ' :content-length' +
            ' ":referrer"' +
            ' ":user-agent"' +
            ' ":response-time ms"',
          req,
          res
        )
        "[#{getRequestId().blue}] #{t}"
    ))
}
