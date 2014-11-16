http = require('http')
expect = require('chai').expect
request = require('supertest')
express = require('express')

app = require('app')

describe('POST /mails', ->
  it('sends mail', (done) ->
    app.deliveries = []

    request(app)
      .post('/mails')
      .expect(200)
      .end((err, res) ->
        expect(app.deliveries.length).gt(0)
        if err
          return done(err)
        done()
      )
  )
)
