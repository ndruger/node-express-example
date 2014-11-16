express = require("express")
router = express.Router()

router.post "/", (req, res, next) ->
  if req.param('simple') == true
    throw new Error("simple error")
  else
    aa aa

module.exports = router
