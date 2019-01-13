<?php
return array(
//此配置项为自动生成请勿直接修改；如需改动请在后台网站设置
//*************************************网站设置****************************************
    'WEB_STATUS'                =>  '1',           //网站状态1:开启 0:关闭
    'WEB_CLOSE_WORD'            =>  '网站升级中，请稍后访问。',       //网站关闭时提示文字
    'WEB_ICP_NUMBER'            =>  '闽ICP备17030565号-3',       // 网站ICP备案号
    'ADMIN_EMAIL'               =>  '982215226@qq.com',          // 站长邮箱

//*************************************优化推广****************************************
    'WEB_NAME'                  =>  '张伟江博客_专注PHP开发与技术交流、web网站开发、IT技术的网站',             //网站名：
    'WEB_KEYWORDS'              =>  '张伟江博客,PHP开发,网站开发,web前端开发,开源项目,linux,全栈工程师',         //网站关键字
    'WEB_DESCRIPTION'           =>  '张伟江博客，是一个专注于分享PHP开发与技术、web网站开发，开源代码，php，linux，mysql等IT技术领域学习经验的个人博客网站,技术交流QQ:982215226。',      //网站描述
    'AUTHOR'                    =>  '张伟江',               //默认作者
    'COPYRIGHT_WORD'            =>  '本文为张伟江原创文章，转载无需和我联系，但请注明来自<a href="http://www.zhangweijiang.com">张伟江博客</a>http://zhangweijiang.com',       //文章保留版权提示
    'IMAGE_TITLE_ALT_WORD'      =>  '张伟江博客', //图片默认title和alt

//*************************************水印设置****************************************
    'WATER_TYPE'                =>  '1',           //水印类型 0:不使用水印 1:文字水印 2:图片水印 3:文字和图片水印同时使用
    'TEXT_WATER_WORD'           =>  'zhangweijiang.com',      //文字水印内容
    'TEXT_WATER_TTF_PTH'        =>  './Public/static/font/ariali.ttf',   //文字水印字体路径
    'TEXT_WATER_FONT_SIZE'      =>  '15', //文字水印文字字号
    'TEXT_WATER_COLOR'          =>  '#008cba',     //文字水印文字颜色
    'TEXT_WATER_ANGLE'          =>  '0',     //文字水印文字倾斜程度
    'TEXT_WATER_LOCATE'         =>  '9',    //文字水印位置 1：上左 2：上中 3：上右 4：中左 5：中中 6：中右 7：下左 8：下中 9：下右
    'IMAGE_WATER_PIC_PTAH'      =>  './Upload/image/logo/logo.png', //图片水印 水印路径
    'IMAGE_WATER_LOCATE'        =>  '9',   //图片水印 水印位置 1：上左 2：上中 3：上右 4：中左 5：中中 6：中右 7：下左 8：下中 9：下右
    'IMAGE_WATER_ALPHA'         =>  '80',    //图片水印 水印透明度：0-100

//*************************************第三方登录****************************************
    'QQ_APP_ID'                 =>  '101539932',            // QQ登录APP D
    'QQ_APP_KEY'                =>  '1d11e30b514a49d01c6bf4058ec6a357',           // QQ登录APP KEY
    'SINA_API_KEY'              =>  '3342787418',         // 新浪登录API KEY
    'SINA_SECRET'               =>  '37cc75896c06a0a970fe6ba72bbd3cfe',          // 新浪登录SECRET
    'DOUBAN_API_KEY'            =>  '',       // 豆瓣登录API KEY
    'DOUBAN_SECRET'             =>  '',        // 豆瓣登录SECRET
    'RENREN_API_KEY'            =>  '',       // 人人登录API KEY
    'RENREN_SECRET'             =>  '',        // 人人登录SECRET
    'KAIXIN_API_KEY'            =>  '',       // 开心网登录API KEY
    'KAIXIN_SECRET'             =>  '',        // 开心网登录SECRET
    'GITHUB_CLIENT_ID'          =>  '99116065016bde4ccd67',     // github登录API KEY
    'GITHUB_CLIENT_SECRET'      =>  '2cd44fbe94c8bc699ba59eade8cc157a4d130893', // github登录SECRET
    'SOHU_API_KEY'              =>  '',         // 搜狐网登录API KEY
    'SOHU_SECRET'               =>  '',          // 搜狐网登录SECRT
//***********************************其他第三方接口****************************************
    'WEB_STATISTICS'            =>  '<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?6fe42bbfb2fc3099ceef1ebe42aa574d";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
',       // 第三方统计代码
    'BAIDU_SITE_URL'            =>  '',       // 百度推送site提交接
//***********************************邮箱设置***********************************************
    'EMAIL_SMTP'                =>  'smtp.qq.com',           //  SMTP服务器
    'EMAIL_USERNAME'            =>  '982215226@qq.com',       //  邮箱用户名
    'EMAIL_PASSWORD'            =>  'qwgoicxmutkobehg',       //  邮箱密码
    'EMAIL_FROM_NAME'           =>  '张伟江',      //  发件名
//***********************************评论管理***********************************************
    'COMMENT_REVIEW'            =>  '1',       // 评论审核1:开启 0:关闭
    'COMMENT_SEND_EMAIL'        =>  '1',   // 被评论邮件通知1:开启 0:关闭
    'EMAIL_RECEIVE'             =>  '982215226@qq.com',        // 接收评论通知邮箱

);