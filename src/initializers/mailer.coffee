nodemailer = require("nodemailer")

global.app.mailer = {}
global.app.mailer.transport = nodemailer.createTransport("Stub",
  debug: true
)
 