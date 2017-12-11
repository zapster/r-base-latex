if (process.argv.length < 3) {
  console.log("Usage: " + process.argv.slice(0,2) + " <PORT>");
  process.exit(1);
}

const http = require('http')
const { exec } = require('child_process');
const spawn = require('child_process').spawn;
const port = process.argv[2];

const requestHandler = (request, response) => {
  console.log('opening ' + request.url)
  var file = request.url.substr(1)
  spawn("xdg-open", [file], {
    stdio:'ignore',
    stderr:'ignore',
    detached:true
  }).unref()
  response.end()
}

const server = http.createServer(requestHandler)

server.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }
  console.log(`server is listening on ${port}`)
})
