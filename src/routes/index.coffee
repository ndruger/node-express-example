express = require("express")
config = require("config")
router = express.Router()

# GET home page.
router.get "/", (req, res, next) ->
  res.render "index",
    title: "Express"
    config: config

module.exports = router
