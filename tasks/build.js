var gulp = require('gulp');
var concat = require('gulp-concat');

var riot = require('gulp-riot');

var connect = require('gulp-connect');

gulp.task('build', [
  'build:html',
  'build:riot'
], function() {
  console.info('Done!');
});

gulp.task('build:html', function() {
  return gulp.src('app/index.html')
  .pipe(gulp.dest('dist'))
  .pipe(connect.reload());
});

gulp.task('build:riot', function() {
  return gulp.src('app/*.tag')
  .pipe(riot())
  .pipe(concat('tags.tag'))
  .pipe(gulp.dest('dist'))
  .pipe(connect.reload());
});
