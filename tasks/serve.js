var gulp = require('gulp');
var watch = require('gulp-watch');

connect = require('gulp-connect');

gulp.task('connect', ['build'], function() {
  connect.server({
    root: 'dist',
    port: 8000,
    livereload: true
  });
});

gulp.task('connect:reload', function() {
  console.log('hi');
  connect.reload();
});

gulp.task('serve', ['connect'], function() {
   gulp.watch(['./app/**/*'], ['build']);
});


gulp.task('default', ['serve']);
