+++
title = "An Brief Introduction to HTML and CSS"
descr = "- this blog will introduce the basic conception of HTML and CSS, and also show several examples"
tags = ["html","css"]
noeval = true
+++


<!-- ####################################
          [1]. Abstract
#################################### -->

@@blog
<!-- a.blog title -->
@@blog-title 
**{{title}}** 
@@
<!-- b.blog intro -->
@@blog-intro
- {{descr}}
- This blog will introduce the basic conception of HTML and CSS, and also show several examples.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
\toc



<!-- ####################################
          [2]. Content
#################################### -->
# HTML Intro

- 前端的一个比喻: `HTML`是骨骼, `CSS`是皮肤, `JavaScript`是灵魂。网页的基本框架是由 HTML 构建的，其描述了每个部分由什么内容构成; 而这些内容由 CSS 修饰，将其变得五彩斑斓; 如果需要与人交互，则需要 JavaScript 编程实现，例如账号密码登录系统，输入的账号密码需要发送到后端，后端要接受这些信息再反馈到前端，这个过程由 JavaScript 代码实现。
- `CSS`有许多现成的库，例如`bootstrap.css`, 同样`JavaScript`也拥有众多库, 只需要在`HTML`代码中导入这些库就可以使用。目前通用的两个前端框架是[Vue](https://vuejs.org/) 和 [React](https://reactjs.org/).


## Overview

A html page is quite simple like:

```html
<!-- head.html -->
<!doctype html>
<html lang="en">
  <head>
    <!-- UTF-8 encoding support English and Chinese -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- you can add css code here -->
    <link rel="stylesheet" href="/css/adjust-yinfu.css">
  </head>
  <body>

<!-- ...
  resolved body + page foot
... -->

<!-- foot -->
  ...
  </body>
</html>
```


## Some Label

- `<html></html>` 
  - 根标签
- `<head></head>` 
  - 设置浏览器用的，是用户看不到的 
- `<body></body>` 
  - 主体内容，展示给用户看的
- `<title></title>` 
  - 网页标题
- `<html lang = "en">` 
  - 告诉搜索引擎爬虫，我们的网站是关于什么内容的`en`代表是英文，`zh`是中文，德语是`de`
- `<meta content = "code" name = "keywords">` 
  - 这样是告诉搜索引擎爬虫, 本网站的主要内容
- `<p></p>` 
  - 段落标签，让内容成段展示
- `<h1></h1>` `<h2></h2>` 
  - 标题标签，成段展示，独占一行，加粗字体，更改字体大小
- `<strong></strong>`
  - 加粗字体
- `<em></em>`
  - 斜体
- `<div></div>` 
  - 独占一行
- `<span></span>` 
  - 不独占一行

\note{`div`和`span`这两个标签是为了成块展示，规格化，这两个是容器。功能如下，**功能-1**：分块明确，让整个页面更加结构化；**功能-2**：捆绑操作的作用（搬书架）}

- `&nbsp;` 
  - 空格
- `<br>` 
  - 换行符，单标签，不成对出现
- `<hr>` 
  - 水平线，单标签，不成对出现

- `<ol></ol>`
  - 有序列表

```html
<!-- <ol> example -->
喜欢的电影:
<ol type = "1"> 
  <li>marvel</li> 
  <li>速 8</li> 
  <li>返老孩童</li> 
  <li>了不起的盖茨比</li> 
</ol>
```

~~~
喜欢的电影:
<ol type = "1"> 
  <li>marvel</li> 
  <li>速 8</li> 
  <li>返老孩童</li> 
  <li>了不起的盖茨比</li> 
</ol>
~~~

\note{如果写成：`<ol type = "1">` 就以ABC排序， 改成`a`，就以abc排序。 此处的`type`值只有五个：**数字，大写英文`A`，小写英文`b`，罗马数字大写`I`，罗马数字小写`i`**。写成`<ol type = "1" reversed = "reversed">` 就是**倒序**; 如果想从**第2个开始**排序，就写`<ol type = "1" start = "2">`}

- `<ul></ul>`
  - 无序列表

```html
<!-- <ul> example -->
<ul type = "disc">
  <li>草莓</li>
  <li>苹果</li> 
  <li>橙子</li> 
</ul>
```

~~~
<ul type = "disc">
  <li>草莓</li>
  <li>苹果</li> 
  <li>橙子</li> 
</ul>
~~~

\note{`type = "disc"`是实心圆(discircle)。`type = "square"`是实心方块(square)。`type = "circle"`是空心圆(circle)。}


- `<img src = "sss.jpg style = "width:100px;">`
  - 超链接图片

- `<a href = "https://www.baidu.com" target = "_blank">` 
  - 超链接
  - `target = "_blank"` 意思是在新标签中打开这个地址


## Form Label
- **两种属性**，`method`and`action`
  - `method = "get/post"` 表示 `form` 发送数据的两种方式 
  - `action = "http://ssffg.php"` 表示发送给谁，就是`action`的位置

- **配合`input`使用，`input`里面需要`type`**
  - `<input type = "text">` 输入框
  - `<input type = "password">` 密码框，默认是暗文
  - `<input type = "submit">` 提交的组件，或叫登录
  - `<input type = "submit" value = "login">` 修改提交框的值
  - `<input type = "radio">` 单选框
  - `<input type = "checkbox">` 复选框
  - `<input type = "text" name = "1234">` 此处`name`是数据名，`1234`是数据值

```html
<!-- For example -->
<form method="get" action="">
  <p>
    username:<input type="text" name="username">
  </p>
  <p>
  password:<input type="password" name="password">
  </p>
  <input type = "submit" value = "login">
</form>
```

~~~
<form method="get" action="">
  <p>
    username:<input type="text" name="username",value="Enter name">
  </p>
  <p>
  password:<input type="password" name="password">
  </p>
  <input type = "submit" value = "login">
</form>
~~~

\note{发送数据要注意数据的主题（数据名）和数据的内容（数据值），缺一不可，没有
其一就发送不了数据。接收数据需要使用`JavaScript`语言}



- **单选框储存数据值**
  - `<input type = "radio" name = "star">`
  - 此处的 `name` 的值是一样的，浏览器告诉大家是同一道题，此时没有填数据值的位置，可以写个`value = ""`来储存数据值。
  - 默认选中用`checked = "checked"`

```html
<!-- For example -->
<h3>CHOOSE YOUR SEX</h3>
male:<input type ="radio" name="sex" value="male" checked="checked">
female:<input type="radio" name="sex" value="female">
<br><br>
```

~~~
<h3>CHOOSE YOUR SEX</h3>
male:<input type ="radio" name="sex" value="male" checked="checked">
female:<input type="radio" name="sex" value="female">
none:<input type="radio" name="sex" value="none">
<br><br>
~~~

- **下拉菜单 `select`**
  - form 表单里面的组件`select`, 提供下拉菜单功能
  - **数据名**写在`select`里面更好，因为是天生的父子结构
  - **数据值** 在`option`标签中间填写
  - 如果写成`<option value = "jc">xxx</option>`点提交，那么后台会使用`jc`这个属性接收数据

```html
<form method="get" action="">
  <h3>Province</h3>
  <select name="province">
    <option>Beijing</option>
    <option>Shanghai</option>
    <option>Hongkong</option> 
  </select>
</form>
```

~~~
<form method="get" action="">
  <h3>Province</h3>
  <select name="province">
    <option>Beijing</option>
    <option>Shanghai</option>
    <option>Hongkong</option> 
  </select>
</form>
~~~





# CSS 导入

## 行间引用
- 例如: `<div style="width:100px;">xxx</div>`

## 页面引用
- 在`head`里编写, `type = "text/css"`的意思是告诉浏览器，我这里面是`css`，可写可不写

```html
<head>
  <style type = “text/css”></style> 
</head> 
```

## 外部导入
- 打开一个文件以 `adjust-yinfu.css` 命名保存, 在头标签里引入
- `rel="stylesheet" type="text/css"` 是告诉浏览器我是`css`
- `href`引入地址

```html
<head>
  <link rel="stylesheet" type="text/css" href="/css/adjust-yinfu.css">
</head> 
```



# CSS 选择器

## ID选择器
- 特点：一个元素只能有一个`id`值，一个`id`只对应一个元素，一一对应
- 语法： #（加上`id`后面的值，如`only`），就是选中这个`id`了

```css
<div id = "only">123</div> 

/* 在 css 中写 */
#only { background-color: red; }
```


## Class选择器
- 特点：一个`class`可以对应多个元素, 例`<div class = "demo">123</div>`
- 语法:`.class`就可以找到`class`选择器

```css
<div class = “demo”>234</div>

/* 在 css 中写 */
.demo{ background-color: green; }
```

- 如果想让多一个值，多写一个`class`名 

```css
<div class = "demo demo1"> 123</div>

/* 在 css 中写 */
.demo{ background-color: green; } 
.demo1{color: #f40;}
```

## 标签选择器
- 语法: `name{}`
- 如果想选择`<div>`就写`div{}`，如果想选择`<span>`就写`span{}`

```css
<span>123</span>

/* 在 css 中写 */
span{
  color:#F40;
  font-weight:bold;
}
```

## 通配符选择器
- 语法: `*{}`
- `*` 是任意的意思，此处是`all`，所有的标签（包括`<html>`和`<body>`）

## 选择器权重

- `Infinity + 1 > Infinity`
- 如果权重值一样（优先级一样），会显示后面的, 就是先来后到。后面的会覆盖前面的。
- 在权重中，是 256 进制，是从 0 到 255 后变成 1。所以这里的 1000 不是一千

@@ctable
| 标签名                           | 权重值     |
| :---                            | :---      |
| `!important`                    | Infinity  |
| 行间样式                         | 1000      |
| ID选择器                         | 100       |
| Class选择器, 属性选择器, 伪类选择器 | 10        |
| 标签选择器, 伪元素选择器            | 1         |
| 通配符选择器                      | 0         |
@@


> 下面是较为复杂的选择器

## 父子选择器
- 父子结构: 最外面的结构 --> 外面的结构 --> 里面的结构{}
- 例如，选出`<strong>`里面的`<em>`

```css
<div class="wrapper">
  <strong class="box">
    <em> 234 </em>
  </strong>
</div>

/* 在 css 中写 */
/* method-1 */
.wrapper .box em{
  background-color: red;
}

/* method-2 */
div strong em{
  background-color: red;
}
```


## 直接子元素选择器
- 语法: `div > em{}`意思是`div`下面直接一级的`em`

```css
<div>
  <em>123</em>
  <strong>
    <em>222</em>
  </strong>
</div>

/* 在 css 中写 */
div > em{
  background-color: green;
}
```


## 并列选择器
- 语法: `div.demo{}`在`.`之前不用写空格
```css
<div>1</div>
<div class="demo">2</div>

/* 在 css 中填写 */
div.demo{
  background-color:green;
}
```

## 分组选择器
- 语法: `.demo1, .demo2, .demo2{}` 中间由逗号`,`隔开
- 例如把1，2，3都变红

```css
<em>1</em>
<strong>2</strong>
<span>3</span>

/* 在 css 中写 */
/* 可以写成一行，但开发中一般是竖着写，方便看 */
em,
strong,
span{
  background-color:red;
}
```

## 伪类选择器
- 常见的: 任意选择器`:hover` **(当鼠标移入控制域内，发生变化)**

```css
<a href="www.baidu.com">www.baidu.com</a>

/* 在 css 中填写 */
a:hover{
  background-color: orange;
}
```


# CSS代码块

以`<div></div>`为例，用花括号包裹起来的是`css`**代码区**，在括号里面写 `属性名:属性值;`
- 每一个属性与属性之间用分号`;`隔开，例如: 
- 三大模型：盒模型，层模型，浮动模型

```css
div{
  /* 属性名: 属性值; */
  font-size:12px;
  font-weight:bold; 
}
```

下面介绍一些属性，在[www.css88.com](www.css88.com)可以查阅

## 设置字体

@@ctable
| 属性名               | 属性值举例          | 效果/功能 |
| :---                | :---              | :--- |
| **font-size**       | 12px              | 设置字体大小，默认是 16px，但是互联网字体一般用 12px 或 14px。设置的是字体的高度 |
| **font-weight**     | lighter           | 细体 |
| ↑                   | normal            | 正常(默认值) |
| ↑                   | bold              | 加粗，跟`<strong>`效果一样的 |
| ↑                   | bolder            | 加更粗   |
| ↑                   | 100,200...900     | 从细到粗，用整百表示 |
| **font-style**      | italic            | 斜体，`em`标签本身带有`italic`样式 |
| **font-family**     | arial             | 设置字体包的样式，这个是乔布斯发明的字体 |
| **color**           | red               | 纯英文字母(一般不用) |
| ↑                   | #ff4400           | 颜色代码: 其中每两位都是从`00`到`ff`，分别对应红`r`(`00-ff`）， 绿`g`(`00-ff`），蓝`b`(`00-ff`），这是一个十六进制的数, 代表的是饱和度, 如果每两位都可以重复，那么简写成`#f40`淘宝红，`#ffffff`白色，`#000000`黑色 |
| ↑                   | rgb(255,255,255)  | 颜色函数, `rgb（0-255，0-255，0-255）`里面的 0-255 是十进制数 |
| ↑                   | transparent       | 透明色 |
| **text-align**      | left              | 左对齐 |
| ↑                   | center            | 一行居中 |
| ↑                   | right             | 右对齐 |
| **line-heght**      | 16px              | 单行文本高度。当`line-height=height`（文本所占高度=容器高度）时，单行文本水平垂直居中 |
| ↑                   | 1.2em             | 单行文本所在的高度，意思是文字的高是 1.2 倍行高 |
| **text-indent**     | 2em               | 首行缩进`2em`(2个文本单位) |
| **text-decoration** | line-through      | 中划线  |
| ↑                   | none              | 不显示 |
| ↑                   | underline         | 下划线 |
| ↑                   | overline          | 上划线 |
| **cursor**          | pointer           | 光标定位值（cursor: pointer; 鼠标变成一个小手）|
@@

\note{
- 字体的粗细跟字体包有关
- 单位的衡量标准: 绝对单位`(m, cm)`, 相对单位`(px, em)`; 屏幕的分辨率, 即像素, 国际标准是每英寸所能容纳的垂直像素点数。
- `px`是像素的意思, 一个像素只能显示一个颜色
- `em`是文本单位, `1em = 1*font-size` 该文本的字体大小
}





## 标签的归类

- 行级元素，也叫内联元素 `inline`
  - 特点: 内容决定元素所占位置, 不可以通过 css 改变宽高
  - 举例: `span`，`strong`，`em`，`a`，`del` 
  - 行级元素自带 css 属性，可更改自带属性`span`自带隐藏属性`display:inline`; 可以通过改成`block`变成块级元素

- 块级元素，`block`
  - 特点: 独占一行, 可以通过 css 改变宽高
  - 举例: `div`，`p`，`ul`，`li`，`ol`，`form`，`address`

- 行级块元素，`inline-block`
  - 特点: 内容决定大小, 可以改变宽高
  - 我们可以通过`display`更改元素属性，如果写成`display:none`; 元素就没有了 
  - 举例: 

```css
<img src = "">

/* 在 css 中填写 */
/* 一般只设置宽或高，另外一个就等比例缩放了 */
img {
  border:0;
  width:100px;
  height:200px;
  margin-left:-6px;
}
```


## 盒模型

- 盒子三大组成部分：
  - 盒子壁 `border`
  - 盒子内边距 `padding`
  - 盒子内容 `width+height`

- 盒子模型(四部分)
  - 盒子壁 `border`
  - 盒子内边距 `padding`
  - 盒子内容 `content=width+height`
  - 盒子外边距 `margin`

> 可以利用谷歌浏览器控制台查看

~~~
<div style="display:block;">
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-1.png" />
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-2.png"/>
</div>
~~~

@@ctable
| `padding:`           | 效果 |
| :---                 | :--- |
| 上，右，下，左         | 4个值(顺时针), 每个方向单独设置 |
| 上下，左右             | 2个值 |
| 上，左右，下           | 3个值 | 
| 上下左右              | 1个值, 同时置四个方向 |
| `padding-left:10px;` |  代表单独设置左侧，= `padding:0 0 0 10px;` |
@@

\note{`margin`和`border-width`的设置方法和`padding`是一样的。浏览器是以左边和上边当做墙的，设置了`margin`就会推动盒子移动}




## 层模型

`position`有三种属性, 属于层模型, 对比盒子模型：

- `absolute`: 绝对定位定位，会出现脱离原来位置的现象
- `relative`: 相对定位
- `fixed`: 固定定位，例如本网页右侧的导航目录栏
- `z-index`: 表示元素在第几层，默认是0，值越大越靠近用户，只在`position`中使用

\note{
- 我们一般用`relative`作为参照物（不用其进行定位），用`absolute`进行定位。
- 给某元素只设置一个`relative`，不设置 `left`, `right`, `top`, `bottom`，这样不会对该元素有影响，且保留了原来位置，对后续元素也不会有影响。
- `absolute`可以任意的调整自己的参照物，更加灵活。
- 所以用于定位想让谁成为基地，就给谁`relative`定位。
}


### 绝对定位

层模型的特点，当一个元素`absolute`以后，就脱离了原来的层，跑到上一层面去了，所以会在同一点出现了，例如：

- 下方左图
```css
<div class="demo"></div>
<div class="box"></div>

/* 对应的 css 为： */
.demo{
  width: 100px;
  height: 100px;
  background-color: red;
  opacity: 0.5; /* 透明度 */
}

.box{
  width:150px;
  height:150px;
  background-color:green;
}
```

- 下方右图
```css
<div class="demo"></div>
<div class="box"></div>

/* 对应的 css 为： */
.demo{
  position:absolute;
  width: 100px;
  height: 100px;
  background-color: red;
  opacity: 0.5; /* 透明度 */
}

.box{
  width:150px;
  height:150px;
  background-color:green;
}
```

~~~
<div style="display:block;">
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-4.png" />
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-3.png" />
</div>
~~~




### 相对定位
`relative`是保留原来位置进行定位,两者比较:
- `absolute`定位：脱离原来位置定位。是相对于最近的有定位的父级进行定位；如果没有有定位的父级元素，就相对于文档进行定位
- `relative`定位：保留原来的位置进行定位，相对于自己原来（出生的）的位置进行定位，类似于灵魂出窍

**_Example-1_**: 这种情况下`relative`和`absolute`是一样的
```css
<div class="demo"></div>

/* 对应的 css */
.demo{
  position:relative;
  left:100px;
  top:100px;
  width:100px;
  height:100px;
  background-color:red;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-5.png" />~~~


**_Example-2_**: 
```css
<div class="demo"></div>
<div class="box"></div>

/* 对应的 css */
.demo{
  position:relative;
  width:100px;
  height:100px;
  background-color:red;
  opacity: 0.5;
}

.box{
  width:150px;
  height:150px;
  background-color:green;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-6.png" />~~~


**_Example-3_**: 
```css
<div class="demo"></div>
<div class="box"></div>

/* 对应的 css */
.demo{
  position:relative;
  left:100px;
  top:100px;
  width:100px;
  height:100px;
  background-color:red;
  opacity: 0.5;
}

.box{
  width:150px;
  height:150px;
  background-color:green;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-7.png" />~~~









### 固定定位

`fixed`是固定定位，可以用作小广告，不管滚动条怎么动，它都在一个固定的位置上面，需要搭配`right`, `left`, `top`, `bottom`使用

```css
<div>这是导航栏</div>
<br><br>

/* 在 css 中填写 */
div{
  position:fixed;
  left:0;
  top:300px;
  width:50px;
  height:200px;
  background-color:red;
  color:#fff;
}
```


## 浮动模型
`float: left/right;` 浮动模型可让元素在左边或者右边，浮动最开始是实现文字环绕的

**_Example-1_**: 

让元素排队,`left`使方块按`123`排序


```css
<div class="wrapper">
  <div class="content"> 1 </div>
  <div class="content"> 2 </div>
  <div class="content"> 3 </div>

/* 在 css 中 */
.wrapper{
  width:300px;
  height:300px;
  border:1px solid black;
}

.content{
  color:#fff;
  background-color:black;
  width:100px;
  height:100px;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-8.png" />~~~



```css
<div class="wrapper">
  <div class="content"> 1 </div>
  <div class="content"> 2 </div>
  <div class="content"> 3 </div>

/* 在 css 中 */
.wrapper{
  width:300px;
  height:300px;
  border:1px solid black;
}

.content{
  float:left;
  color:#fff;
  background-color:black;
  width:100px;
  height:100px;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-9.png" />~~~
~~~<br><br>~~~



**_Example-2_**:

`float`元素也会出现分层现象，与`absolute`效果是类似的，例如：

```css
<div class="box"></div>
<div class="demo"></div>

/* 对应的 css */
.box{
  width:100px;
  height:100px;
  background-color:black;
}
.demo{
  width:150px;
  height:150px;
  background-color:green;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-10.png" />~~~

```css
<div class="box"></div>
<div class="demo"></div>

/* 对应的 css */
.box{
  float:left;
  width:100px;
  height:100px;
  background-color:black;
  opacity:0.5;
}
.demo{
  width:150px;
  height:150px;
  background-color:green;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-11.png" />~~~





**_Example-3_**:

- 浮动元素能够产生了浮动流, 所有产生了浮动流的元素，块级元素看不到他们。
- 产生了`bfc`的元素，和文本类属性（带有`inline`属性就是文本类属性）的元素，以及文本，都能看到浮动元素。
- `inline`和`inline-block`都是文本类元素, 凡是带有`inline`属性的元素，都有文本类特点，所以叫文本类元素, 而`img`是`inline-block`
- 文本能看到浮动元素, 浮动元素不意味着分层，只能说明他产生了浮动流。
- 下述实例显示：`123`文本紧跟在`box`后面，说明该文本能看到浮动流

```css
<div class="box"></div>123

/* 在 css 中 */
.box{
  float:left;
  width:100px;
  height:100px;
  background-color:black;
  opacity:0.5;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-12.png" />~~~




**_Example-4_**:
- 浮动元素用完，尽量都清除浮动流。用`clear`清除周边的浮动流。
- `clear:left;` 或 `clear:right;` 或 `clear:both;` 一般直接写成 `both`

```css
<div class="wrapper">
  <div class="content"> 1 </div>
  <div class="content"> 2 </div>
  <div class="content"> 3 </div>
  <p></p>
</div>

/* 在 css 中 */
.wrapper{
  border:1px solid black;
}

.content{
  float:left;
  color:#fff;
  background-color:black;
  width:100px;
  height:100px;
}

p{
  border-top:10px solid green;
  clear:both;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-13.png" />~~~

\note{正常来说，在清除浮动的时候，是不能像上面那样通过增加`<p>`来改变 html 结构，从而清除浮动，这种方式在开发中是不能使用的, 一般用伪元素的方法}




## 伪元素选择器

伪元素天生就存在于任意一个元素(标签`tag element`)里面, 天生是行级元素。
- 为什么叫伪元素？因为他的元素结构是存在的，但是他没写到`HTML`里面，他可以被`css`选中，并正常操作，但是他没有`html`结构，所以叫伪元素。 
- 他有两个特殊的伪元素`before`和`after`伪元素可以跟正常元素差不多可以一起来使用，但是他没有正常的元素结构，一个标签诞生的时候，他就有了伪元素，伪元素存在于逻辑的最前`after`和逻辑的最后`before`
- 只是一般看不见，除非我们通过`css`选中，并操作他写成`span::before{}`就是选择了`span`的`before`伪元素，里面有一个必须要有的值是`content:""`, 而`content`也只能用在伪元素中

```css
<span>很帅</span>

/* 对应 css 填写 */
span::before{
  content:"成哥";
}

span::after{
  content:"是的";
}
```

- 伪元素可以跟正常元素一样操作, 而为了清除`float`的浮动流，就可以用到伪元素，也是最好的选择。
- `clear`很特殊，想让他生效，必须是块级元素才可以。

```css
<div class="wrapper">
  <div class="content"> 1 </div>
  <div class="content"> 2 </div>
  <div class="content"> 3 </div>
</div>

/* 在 css 中 */
.wrapper::after{
  content:"";
  clear:both;
  display: block;
}

.wrapperr{
  border:1px solid black;
}

.content{
  float:left;
  width:100px;
  height:100px;
  background-color:black;
  color:#fff;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-14.png" />~~~







## 文本溢出-打点处理
想让单行文本溢出文字，打点，步骤：
- 首先先让文本失去换行功能，`white-space:nowrap;`
- 再溢出部分不展示隐藏，`overflow:hidden;`
- 最后把溢出部分打点，`text-overflow:ellipsis;`

多行文本截断:
- `height`是`line-height`的两倍，就展示两行，内容区域高是单行文本的高度整数倍，算好了高度就可以做截断了。

```css
<p>法国议会选举第一轮投票结束马克龙所在的党领先法国议会选举第一轮投票结果马克龙所在的党领先法国议会选举第一轮投票结果</p>

/* 对应 css 填写 */
p{
  width:300px;
  height:20px;
  line-height:20px;
  border:1px solid black;

  white-space:nowrap;
  overflow:hidden;
  text-overflow:ellipsis;
}
```
~~~<img style="width:40%;height:40%;margin-left:30%;" src="/assets/blog-data/fig/2022-02-24-15.png" />~~~





# CSS EXAMPLE


## 两栏模式

- 利用**相对定位**`.research-box{position:relative;}`，将盒子框架设计成参照物，保留了原始位置。
- 在该框架内，利用**浮动元素**，将照片放左侧`.re-photo{float:left;}`，文字放右侧 `.re-intro{float:right;}`
- 最后利用`<div style="clear: both"></div>`清除浮动元素 (也可以使用伪元素选择器清除 `::after`)


**HTML 代码**

```html
<div class="research-box">
  <p><a class="re-title" href="research-1">
      Title here...
    </a>
  </p>

  <div class="re-photo">
    <img src="/assets/research-data/research-1.png">
    <br><br>
  </div>

  <div class="re-intro">
    Content here...
  </div>

  <div style="clear: both"></div>  <!-- 清除浮动元素效果 -->
</div>
```

**CSS 代码**

```css
.research-box {
  position:relative; /* 相对定位 */
  background-color: rgb(246, 246, 246);
  border-radius: 20px;
  padding: 20px 20px 30px 20px;
  margin-bottom: 30px;
  overflow:hidden; /* 超出的部分隐藏 */
}

.re-photo{
  float:left; /* 浮动元素 -- 左侧 */
  width:30%; /* 设置宽度 */
  margin-left: 0px;
  padding-top: 0%;
}
.re-photo img{
  background-color: rgb(255, 255, 255);
  box-shadow: 0px 0px 5px rgba(0,0,0,.2);
  width:100%;
  padding: 5px 5px 5px 5px;
}
.re-intro{
  float:right; /* 浮动元素 -- 右侧 */
  width:67%; /* 设置宽度 */
  font-size: var(--small);
  line-height: 1.5em;
}

.research-box:hover {
  outline: 3px solid pink;
  background-color: white;
}

a.re-title{
  color:black;
  font-weight: bold;
}
a.re-title:hover{
  color:#004de6;
  font-weight: bold;
}
```

**Result 效果**

~~~
<div class="research-box">
  <p><a class="re-title" href="research-1">
      Title here...
    </a>
  </p>

  <div class="re-photo">
    <img src="/assets/research-data/research-1.png">
    <br><br>
  </div>

  <div class="re-intro">
    Content here...
  </div>

  <div style="clear: both"></div>
</div>
~~~



## 属性 Active
- 属性`active`经常会使用到，例如`slider-bar`中，当页面滚动到某个标题的内容处，导航栏对应的标题就会变粗加下划线，此时其中对应的标题中的属性变成了 `active`，激活了新的`css`样式。
- 当点击某个`<a>`超链接标签时，会激活该标签的属性`a.active`, 设置激活后的`css`代码，实现不同样式的效果。

**HTML 代码**
```html
<ul class="visible-links">
  <li class="masthead__menu-item"><a href="/">Home</a></li>
  <li class="masthead__menu-item"><a href="/cv/">CV</a></li>  
  <li class="masthead__menu-item"><a href="/research/">Research</a></li>
  <li class="masthead__menu-item"><a href="/publication/">Publication</a></li>
  <li class="masthead__menu-item"><a href="/resource/">Resource</a></li>
  <li class="masthead__menu-item"><a href="/blog/">Blog</a></li>
  <li class="masthead__menu-item"><a href="/tag/">Tag</a></li>
  <li class="masthead__menu-item"><a href="/news/">News</a></li>
</ul>
```

**CSS 代码**
```css
/* a.active result */
ul li a.active{
  color:rgb(32, 32, 32);
  font-weight: 600;
}
```

**Result 效果**
- 效果参考本网站的标题栏


## 图片居中

- 设置`<div>`为块元素
- 设置`width:40%;`减小图片的宽度
- 设置`margin-left:5%;`调整图片之间的距离

```html
<div style="display:block;">
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-1.png" />
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-2.png"/>
</div>
```

~~~
<div style="display:block;">
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-1.png" />
  <img style="width:40%;height:40%;margin-left:5%;" src="/assets/blog-data/fig/2022-02-24-2.png"/>
</div>
~~~


## Checkbox
- working...


## Button
- working...



# End

## References

1. [腾讯课堂_2022新版HTML+CSS零基础入学](https://ke.qq.com/course/231570?taid=2955805083273362) (**_推荐_**)

## History:
@@small-font
- 2022-02-24: draft
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-25\\
@@


# Message Board ✨
{{ addcomments }}

