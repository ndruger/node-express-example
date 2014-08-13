express = require("express")
router = express.Router()

redis = require("redis")
client = redis.createClient();

router.get "/1", (req, res) ->
  client.set("string key", "string val", redis.print)
  res.send "hello world"

module.exports = router
