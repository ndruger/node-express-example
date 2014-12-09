# Express Test

[![Build Status](https://secure.travis-ci.org/ndruger/node-express-example.png?branch=master)](http://travis-ci.org/ndruger/node-express-example)

## Run

```bash
$ grunt coffee
$ node app.js
```

## Test

```bash
$ npm test
```

```bash
$ export NODE_PATH=.
$ grunt test
```

### Run single test file
```bash
$ NODE_PATH=. NODE_ENV=test mocha --compilers coffee:coffee-script/register [target_file]
```
