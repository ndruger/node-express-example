module.exports = (grunt) ->
  grunt.initConfig(
    clean: 
     js: ["routes/**/*.js", "test/**/*.js"]
    watch:
      coffee:
        files: ['routes/**/*.coffee']
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
          cwd: 'routes/'
          src: '**/*.coffee'
          dest: 'routes'
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

