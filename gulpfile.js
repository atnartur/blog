/**
 * @author Artur Atnagulov (atnartur), ClienDDev team (clienddev.ru)
*/

var gulp = require('gulp');
var less = require('gulp-less')
var nano = require('gulp-cssnano');
var rename = require('gulp-rename');

gulp.task('copy-fa-css', () => gulp.src([
    './node_modules/font-awesome/css/*'
]).pipe(gulp.dest('./themes/atnartur/source/libs/font-awesome/css/')));

gulp.task('copy-fa-fonts', () => gulp.src([
    './node_modules/font-awesome/fonts/*'
]).pipe(gulp.dest('./themes/atnartur/source/libs/font-awesome/fonts/')));

gulp.task('copy-from-npm',  () => gulp.src([
    './node_modules/highlightjs/highlight.pack.min.js',
    './node_modules/highlightjs/styles/github.css',
    './node_modules/bootstrap-3-typeahead/bootstrap3-typeahead.min.js'
]).pipe(gulp.dest('./themes/atnartur/source/libs/')));

gulp.task('copy', ['copy-fa-css', 'copy-fa-fonts', 'copy-from-npm']);

gulp.task('css', function() {
    gulp.src('themes/atnartur/source/styles/_main.less')
    	.pipe(less())
    	.pipe(nano())
    	.pipe(rename('main.min.css'))
    	.pipe(gulp.dest('themes/atnartur/source/styles/'));
});

gulp.task('watch', function() {
    gulp.watch('themes/atnartur/source/styles/*', ['css']);
});

gulp.task('default', ['css', 'copy']);
