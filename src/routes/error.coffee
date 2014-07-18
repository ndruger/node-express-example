express = require("express")
router = express.Router()

router.get "/", (req, res) ->
  aa aa

router.get "/simple", (req, res) ->
  throw "simple error"

module.exports = router
