require('source-map-support').install()

express = require("express")
newrelic = require("newrelic")

app = express()
global.app = app

require("./dst/initializers/initializers")
require("./dst/routes")

module.exports = app
app.listen 3000
