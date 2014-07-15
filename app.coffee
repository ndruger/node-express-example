require('source-map-support').install()

express = require("express")
newrelic = require("newrelic")

app = express()
app.getRequestInfo = =>
  getNamespace = require('continuation-local-storage').getNamespace
  getNamespace('requestInfo')

global.app = app

require("./dst/initializers/initializers")
require("./dst/routes")

module.exports = app
app.listen 3000
