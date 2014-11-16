http = require('http')
chai = require('chai')
request = require('supertest')
express = require('express')

app = require('app')

describe('POST /clss', ->
  it('respond with json', (done) ->
    request(app)
      .post('/clss')
      .expect(200)
      .end((err, res) ->
        if err
          return done(err)
        done()
      )
  )
)
