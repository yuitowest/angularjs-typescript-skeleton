module.exports = (grunt)->
  pkg = grunt.file.readJSON 'package.json'

  # load task module
  for taskName of pkg.devDependencies
    if taskName.substring(0,6) == 'grunt-'
      grunt.loadNpmTasks taskName

  # task
  grunt.initConfig

    exec:
      tsCompile:
        cmd: 'node_modules/.bin/tsc public/js/app.ts public/js/**/*.ts -t ES5'

    clean:
      public:
        src:['public/js/*.js*', 'public/js/**/*.js*']

    tsd:
      refresh:
        options:
          command: 'reinstall'
          latest: true,
          config: 'tsd.json'

    bower:
      install:
        options:
          targetDir: 'public/vendor'
          layout: 'byComponent'
          install: true
          verbose: true
          cleanTargetDir: true
          cleanBowerDir: false
      clean:
        options:
          targetDir: 'public/vendor'
          layout: 'byComponent'
          install: false
          verbose: false
          cleanTargetDir: true
          cleanBowerDir: true

    watch:
      options:
        spawn: false
      public:
        files: ["public/js/**/*.ts"]
        tasks: ["exec:tsCompile"]
        options:
          livereload: true
      html:
        files: ["public/**/*.html", "public/*.html"]
        options: 
          livereload: true

    connect:
      server:
        options:
          port: 8888,
          base: 'public'

  grunt.registerTask 'init', ['clean:public', 'bower:install', 'tsd:refresh', 'exec:tsCompile']
  grunt.registerTask 'runserver', ['connect:server', 'watch']
  grunt.registerTask 'cleanup', ['clean:public', 'bower:clean']
