http = require('http')
chai = require('chai')
request = require('supertest')
express = require('express')

app = require('app')

describe('GET /', ->
  it('respond with json', (done) ->
    request(app)
      .get('/')
      .expect(200)
      .end((err, res) ->
        if err
          return done(err)
        done()
      )
  )
)
