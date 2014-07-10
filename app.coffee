require('source-map-support').install()

express = require("express")
newrelic = require("newrelic")

# error handlers

# development error handler
# will print stacktrace

# production error handler
# no stacktraces leaked to user

#function trans() {
#  return newrelic.agent.tracer.getTransaction();
#}




app = express()

require("./dst/initialize")(app)
require("./dst/routes")(app)


module.exports = app
app.listen 3000
