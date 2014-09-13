module.exports = (grunt) ->
  grunt.initConfig(
    compass:
      all:
        options:
          config: "config/compass.rb"
    clean: 
     js: ["routes/**/*.js", "test/**/*.js"]
    watch:
      compass:
        files: ['assets/**/*.scss']
        tasks: 'compass'
      coffee:
        files: ['src/**/*.coffee', 'app.coffee']
        tasks: 'coffee:src'
      test:
        files: ['test/**/*.coffee']
        tasks: 'coffee:test'
    coffeelint:
      options:
        configFile: '.coffeelint.json'
      src:
        files: [
          src: ['src/**/*.coffee', 'app.coffee']
        ]
    coffee:
      src:
        options:
          sourceMap: true
        files: [
          expand: true
          bare: true
          cwd: 'src/'
          src: '**/*.coffee'
          dest: 'dst'
          ext: '.js'
        ]
      app:
        options:
          sourceMap: true
        files: [
          expand: true
          bare: true
          src: 'app.coffee'
          ext: '.js'
        ]
      test:
        options:
          sourceMap: true
        files: [
          expand: true
          bare: true
          cwd: 'test/'
          src: '**/*.coffee'
          dest: 'test'
          ext: '.js'
        ]
  )
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.registerTask('default', [
    'compass',
    'coffee'
  ])

