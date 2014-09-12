express = require("express")
router = express.Router()

router.get "/", (req, res) ->
  aa aa

router.get "/simple", (req, res) ->
  throw new Error("simple error")

module.exports = router
