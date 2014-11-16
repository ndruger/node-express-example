nodemailer = require("nodemailer")
stubTransport = require('nodemailer-stub-transport')

global.app.mailer = {}
global.app.mailer.transport = nodemailer.createTransport(
  stubTransport(
    debug: true
  ),
)
 
app.deliveries = []
global.app.mailer.transport.on('log', (data) ->
  if app.get("env") == "test" || app.get("env") == "development"
    app.deliveries.push(data)
  logger.info(data.message)
)
