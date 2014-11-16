express = require("express")
redis = require("redis")

router = express.Router()
client = redis.createClient()

router.get "/1", (req, res, next) ->
  client.set("string key", "string val", redis.print)
  res.send "hello world"

module.exports = router
