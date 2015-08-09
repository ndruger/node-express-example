express = require("express")

router = express.Router()

router.get "/", (req, res, next) ->
  res.json [
    { id: 1, name: "user1" },
    { id: 2, name: "user2" },
  ]

module.exports = router
