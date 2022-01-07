/**
   生成随机验证码的js文件
 * */
 var codeStr = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var oDiv = document.getElementById('code');
    // 用来生成随机整数
    function getRandom(n, m) { // param: (Number, Number)
        n = Number(n);
        m = Number(m);
        // 确保 m 始终大于 n
        if (n > m) {
            var temp = n;
            n = m;
            m = temp;
        }
        return Math.floor(Math.random()*(m - n) + n);
    }
    // 将随机生成的整数下标对应的字母放入div中
    function getCode() {
        var str = '';
        // 验证码有几位就循环几次
        for (var i = 0;i < 5;i ++) {
            var ran = getRandom(0, 62);
            str += codeStr.charAt(ran);
        }
        oDiv.innerHTML = str;
    }
    getCode();// 调用函数，页面刷新也会刷新验证码
    // 点击刷新验证码
    oDiv.onclick = function(){
        getCode();
    }