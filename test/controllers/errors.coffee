http = require('http')
chai = require('chai')
request = require('supertest')
express = require('express')

app = require('app')

describe('POST /errors', ->
  it('makes 500', (done) ->
    request(app)
      .post('/errors')
      .expect(500)
      .end((err, res) ->
        DP(err)
        if err
          return done(err)
        done()
      )
  )
)
