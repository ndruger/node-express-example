nodemailer = require("nodemailer")
stubTransport = require('nodemailer-stub-transport');

global.app.mailer = {}
global.app.mailer.transport = nodemailer.createTransport(
  stubTransport(
    debug: true
  ),
)
 
global.app.mailer.transport.on('log', (data) ->
  console.log(data.message)
)