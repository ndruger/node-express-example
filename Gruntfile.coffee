module.exports = (grunt) ->
  grunt.initConfig(
    clean: 
     js: ["routes/**/*.js", "test/**/*.js"]
    watch:
      coffee:
        files: ['src/**/*.coffee']
        tasks: 'coffee:src'
      test:
        files: ['test/**/*.coffee']
        tasks: 'coffee:test'
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
  grunt.registerTask('default', ['watch'])

