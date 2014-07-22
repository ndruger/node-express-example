
createId = =>
  Math.floor(Math.random() * 10000000)

sendExceptionMail = (err) -> # TODO: use config
  opt = {
    from: "no-reply@example.com",
    to: "exception_to@example.com",
    title: "[Exception][#{app.get('env')}] #{err.message}",
    text: err.stack,
  }
  app.mailer.transport.sendMail(opt, =>)
  
# For file and line
colors = require('colors')
traceLogger = require('tracer').colorConsole({
  format : "{{message}} (in {{file}}:{{line}})",
  dateformat : "HH:MM:ss.L",
  filters : [colors.underline, colors.red]
})

DP = (->
  traceLogger.info.bind(traceLogger)
)()
global.DP = DP
 
module.exports = {
  createId: createId,
  sendExceptionMail: sendExceptionMail
}
