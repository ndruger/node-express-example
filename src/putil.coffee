
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
 
module.exports = {
  createId: createId,
  sendExceptionMail: sendExceptionMail
}
