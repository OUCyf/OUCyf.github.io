+++
title = "Buy and Bind Domain Name with Github Pages"
descr = ""
tags = ["domain-name","dns","website","github"]
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
- This blog will introduce how to buy a domain-name form **Namesilo**, bind with your website in Github and DNS setting.
@@
<!-- c.blog tag -->
{{page_tags}}
@@

<!-- d.toc -->
<!-- \toc -->

<!-- ####################################
          [2]. Content
#################################### -->

# Buy from Namesilo
The default domain-name in github pages is `your_name.github.io`, but you can set your own domain-name. Firstly, buy a domain-name; I get `yinfu.info` domain-name from [**Namesilo**](https://www.namesilo.com/), the purchase process show below:

Create an account and check your favorite domain-name whether be used or not. Just buy it. Now use Namesilo to resolve the domain-name: click on the `blue ball` to edit `DNS`; you can sey by yourself or using the template provided below. Generally set `example.com` and `www.example.com` to point to your own server IP address is sufficent, set `A` and `CNAME`:


- My domain-name information:

![](/assets/blog-data/fig/2022-02-21-2.jpg)




- For `A`:

| HOSTNAME | TYPE | ADDRESS/VALUE|
|-----------|-----------|-----------|
| none | A | 185.199.108.153 |

\note{
Use `ping OUCyf.github.io` to get id of ADDRESS/VALUE
}

- For `CNAME`:

| HOSTNAME | TYPE | ADDRESS/VALUE|
|-----------|-----------|-----------|
| www | CNAME | oucyf.github.io |


- My setting screenshot:

![](/assets/blog-data/fig/2022-02-21-1.jpg)


- Renew domains

    click `Renew Domains` then `CHECKOUT`.




# Bind with Github

Add the CNAME file to the github Pages repository at root directory and write your domain name inside:

![](/assets/blog-data/fig/2022-02-21-3.jpg)


Or set `custom domain` directly to `Github Pages` in `Settings` of github. Github will automatically adds the CNAME file.


![](/assets/blog-data/fig/2022-02-21-4.jpg)

Enforce `HTTPS` which provides a layer of encryption that prevents others from snooping on or tampering with traffic to your site. When `HTTPS` is enforced, your site will only be served over `HTTPS`.


## References
1. [Segmentfault](https://segmentfault.com/a/1190000011203711)
1. [Zhihu](https://www.zhihu.com/question/31377141)
1. [Namesilo website](https://www.namesilo.com/)


## History:
@@small-font
- 2022-01-21: full edition
@@

@@colbox-blue,small-font
**Author**: Fu Yin\\
**Last-Update**: 2022-02-21
@@

# Message Board ✨
{{ addcomments }}