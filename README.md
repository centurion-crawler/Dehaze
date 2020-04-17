# Dehaze
## 深度学习入门
### 机器学习 
[吴恩达的课程](https://www.bilibili.com/video/BV164411b7dx?from=search&seid=8994483498162092479)内容比较多，直接看完太久了，平时抽时间看看就可以了

## 卷积神经网络 
主要看博客：\
[如何解释「卷积神经网络」](https://www.zhihu.com/question/304163753/answer/544397323)
[零基础理解卷积神经网络](https://zhuanlan.zhihu.com/p/32472241)

## 去雾入门：
传统去雾方法：
传统去雾方法通过求解大气散射模型得到清晰图像\
![](http://latex.codecogs.com/gif.latex?I(x)=J(x)t(x)+A(1-t(x)))
\
这个公式非常重要，下面方法的博客里面都会提到，并给出解释，这个里面J是要求解的，I是已知的，t和a未知，未知参数多余方程数，是一个不适定问题，传统方法就通过添加先验（就是约束条件），使得方程可解，每个方法添加的先验都不一样，可以通过博客了解。

[最著名的DCP](https://www.jianshu.com/p/df9c963a392a)\
[CAP](https://www.geek-share.com/detail/2752862833.html)\
[Non-Local Dehazing](https://blog.csdn.net/cv_family_z/article/details/52849543)
### 早期经典深度学习去雾算法
[DehazeNet](https://blog.csdn.net/Julialove102123/article/details/80199276)\
[AOD-Net](https://blog.csdn.net/Julialove102123/article/details/89046288)\
[GFN](https://www.cnblogs.com/jingyingH/p/10061286.html)

去雾的评价标准：\
[PSNR](https://baike.baidu.com/item/psnr/2925132?fr=aladdin)\
[SSIM](https://baike.baidu.com/item/SSIM)\
传统及早期的深度学习算法就不推荐大家阅读论文原文了，通过大量阅读博客快速了解就够了，主要是为了大家快速入门深度学习以及快速了解去雾任务是什么、怎么做。
关于深度学习的基础，西瓜书、吴恩达以及一些博客，边进行任务的时候边感受一下这个知识，会理解得更快。
## 后续
后面还会给让大家了解最近的知识，以及我们做**去雾的风格**，后面会希望大家加深了解生成对抗网络，也就是**GAN**，这个会稍微难一点，我们组是最早用GAN做去雾工作的，相对来说做得比较好了，GAN需要大家以了解**卷积神经网络**为基础，所以希望这两大大家能好好入一下门。