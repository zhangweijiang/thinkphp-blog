var gulp        = require('gulp'),
    sass        = require('gulp-sass'),
    minifyCss   = require('gulp-clean-css'),//gulp-clean-css替代gulp-minify-css
    plumber     = require('gulp-plumber'),
    babel       = require('gulp-babel'),
    uglify      = require('gulp-uglify'),
    clearnHtml  = require("gulp-cleanhtml"),
    imagemin    = require('gulp-imagemin'),
    copy        = require('gulp-contrib-copy'),
	sourcemaps  = require('gulp-sourcemaps'),
	javascriptObfuscator = require("gulp-javascript-obfuscator"),//js混淆
	concat      = require('gulp-concat');
	del         = require('del'),
    browserSync = require('browser-sync').create(),
    reload      = browserSync.reload;
    
// 定义源代码的目录和编译压缩后的目录
var src='Template/default_src',
    dist='Template/default';

// 编译全部scss 并压缩
gulp.task('css', function(){
    gulp.src(src+'/**/*.scss')
		.pipe( sourcemaps.init() )
		.pipe(sourcemaps.identityMap())
        .pipe(sass())
        .pipe(minifyCss())
		.pipe( sourcemaps.write('./')) // 将map文件编译到和default同一目录下
        .pipe(gulp.dest(dist))
})

// 编译全部js 并压缩
gulp.task('js', function() {
  gulp.src(src+'/**/*.js')
    .pipe(plumber())
    .pipe(uglify({
      mangle: true,//类型：Boolean 默认：true 是否修改变量名
      compress: true,//类型：Boolean 默认：true 是否完全压缩
    }))
	.pipe(javascriptObfuscator({
            compact: false, //类型：Boolean 默认：true 是否完全压缩
            //domainLock: [".blog.com"],
            mangle: false, //类型：Boolean 默认：true 是否修改变量名
            rotateStringArray: true,
            //selfDefending: true, //类型: Boolean 默认：true
            stringArray: true,
			sourceMap:true
       }))
});

// 压缩全部html
gulp.task('html', function () {
    gulp.src(src+'/**/*.+(html|tpl)')
    .pipe(clearnHtml())
    .pipe(gulp.dest(dist));
});

// 压缩全部image
gulp.task('image', function () {
    gulp.src([src+'/**/*.+(jpg|jpeg|png|gif|bmp)'])
    .pipe(imagemin())
    .pipe(gulp.dest(dist));
});

// 其他不编译的文件直接copy
gulp.task('copy', function () {
    gulp.src(src+'/**/*.!(jpg|jpeg|png|gif|bmp|scss|js|html|tpl)')
    .pipe(copy())
    .pipe(gulp.dest(dist));
});

//创建删除任务
gulp.task('cleanMap', function() {
    del([dist+'/**/*.map']).then(paths => (
        console.log('*.map would be deleted,and the path is => ' + paths)
    ))
});



// 自动刷新
gulp.task('server', function() {
    browserSync.init({
        proxy: "www.blog.com", // 指定代理url
        notify: false, // 刷新不弹出提示
        //port:3056,
    });
    // 监听scss文件编译
    gulp.watch(src+'/**/*.scss', ['css']);

    // 监听其他不编译的文件 有变化直接copy
    gulp.watch(src+'/**/*.!(jpg|jpeg|png|gif|bmp|scss|js|html)', ['copy']);   

    // 监听html文件变化后刷新页面
    gulp.watch(src+"/**/*.js", ['js']).on("change", reload);

    // 监听html文件变化后刷新页面
    gulp.watch(src+"/**/*.+(html|tpl)", ['html']).on("change", reload);

    // 监听css文件变化后刷新页面
    gulp.watch(dist+"/**/*.css").on("change", reload);
});

// 监听事件
gulp.task('default', ['css', 'js', 'image', 'html', 'copy', 'server']);

gulp.task('concat', function(){
    gulp.src([
    	"Public/static/js/jquery-2.0.0.min.js",
    	"Public/static/bootstrap-3.3.5/js/bootstrap.min.js",
    	"Public/static/pace/pace.min.js",
    	"Template/default/Home/Public/js/index.js"
    	])
	    /*.pipe(uglify({
	      mangle: true,//类型：Boolean 默认：true 是否修改变量名
	      compress: true,//类型：Boolean 默认：true 是否完全压缩
	    }))*/
	    .pipe(javascriptObfuscator({
            compact: true, //类型：Boolean 默认：true 是否完全压缩
            domainLock: [".zhangweijiang.com"],
            mangle: false, //类型：Boolean 默认：true 是否修改变量名
            rotateStringArray: true,
            //selfDefending: true, //类型: Boolean 默认：true
            stringArray: true,
			//sourceMap:true
       }))
		.pipe(concat('app.js'))
		.pipe(gulp.dest("./Public/static/js/"));

		 gulp.src([
		"Public/static/font-awesome-4.4.0/css/font-awesome.min.css",
    	"Public/static/bootstrap-3.3.5/css/bootstrap.min.css",
    	"Public/static/bootstrap-3.3.5/css/bootstrap-theme.min.css",
    	"Public/static/css/main.css",
    	"Public/static/css/animate.css",
    	"Template/default/Home/Public/css/index.css",
    	])
	    .pipe(minifyCss())
		.pipe(concat('app.css'))
		.pipe(gulp.dest("./Public/static/css/"));
});
