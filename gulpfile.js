/**
 * @author Artur Atnagulov (atnartur), ClienDDev team (clienddev.ru)
*/

var gulp = require('gulp');
var less = require('gulp-less')
var nano = require('gulp-cssnano');
var rename = require('gulp-rename');

gulp.task('css', function() {
    gulp.src('themes/atnartur/source/styles/_main.less')
    	.pipe(less())
    	.pipe(nano())
    	.pipe(rename('main.min.css'))
    	.pipe(gulp.dest('themes/atnartur/source/styles/'));
});

gulp.task('default',['css']);