express = require("express")
router = express.Router()
nodemailer = require("nodemailer")

app = global.app

router.get "/", (req, res) ->
     
  mailOptions = {
      from: "sender@example.com",
      to: "receiver@example.com",
      text: "hello world!"
  }

  app.mailer.transport.sendMail(mailOptions, (error, response) =>
    res.send response
  )
  

module.exports = router
