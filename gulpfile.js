const gulp = require('gulp');
const less = require('gulp-less')
const nano = require('gulp-cssnano');
const rename = require('gulp-rename');

const copyFaCss = () => gulp.src('./node_modules/font-awesome/css/*')
    .pipe(gulp.dest('./themes/atnartur/source/libs/font-awesome/css/'));

const copyFaFonts = () => gulp.src('./node_modules/font-awesome/fonts/*')
    .pipe(gulp.dest('./themes/atnartur/source/libs/font-awesome/fonts/'));

const copyFromNpm = () => gulp.src([
        './node_modules/highlightjs/styles/github.css',
        './node_modules/bootstrap-3-typeahead/bootstrap3-typeahead.min.js',
        './node_modules/bootstrap/dist/css/bootstrap.min.css',
        './node_modules/jquery/dist/jquery.min.js'
    ]).pipe(gulp.dest('./themes/atnartur/source/libs/'));

const copy = gulp.parallel([copyFaCss, copyFaFonts, copyFromNpm]);

const css = () => gulp.src('themes/atnartur/source/styles/_main.less')
	.pipe(less())
	.pipe(nano())
	.pipe(rename('main.min.css'))
	.pipe(gulp.dest('themes/atnartur/source/styles/'));

module.exports.watch = () => gulp.watch('themes/atnartur/source/styles/*.less', gulp.parallel([css]));

module.exports.default = gulp.parallel([css, copy]);
