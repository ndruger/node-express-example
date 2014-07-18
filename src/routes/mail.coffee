express = require("express")
router = express.Router()

router.get "/", (req, res) ->
     
  opt = {
    from: "sender@example.com",
    to: "receiver@example.com",
    text: "hello world!"
  }

  app.mailer.transport.sendMail(opt, (error, info) =>
    res.send info
  )

module.exports = router
