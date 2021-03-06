express = require("express")

router = express.Router()

router.post "/", (req, res, next) ->
     
  opt = {
    from: "sender@example.com",
    to: "receiver@example.com",
    text: "hello world!"
  }

  app.mailer.transport.sendMail(opt, (error, info) ->
    res.send info
  )

module.exports = router
