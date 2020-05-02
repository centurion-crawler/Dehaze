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
后面还会给让大家了解最近的知识，以及我们做**去雾的风格**，后面会希望大家加深了解生成对抗网络，也就是**GAN**，这个会稍微难一点，我们组是最早用GAN做去雾工作的，相对来说做得比较好了，GAN需要大家以了解**卷积神经网络**为基础，所以希望这两天大家能好好入一下门。

上次有给大家介绍一点点点点深度学习相关的去雾算法：dehazenet和aod
今天主要介绍深度学习的算法和另外一种好用的工具

深度学习去雾算法进阶版本

直接的图像到图像映射去雾：
[Gridedehaze](http://www.bubuko.com/infodetail-3393932.html)

[Dr-Net-blog1](https://www.jianshu.com/p/1733fb64e734)
[Dr-Net-blog2](https://blog.csdn.net/deepinC/article/details/86418635)
还有一个PFF-Net，但是没有找到合适的博客，你们想看我就给你们原文，不想看现在不看也没关系
上一次又让你们看AOD GFN，加上几个，作为直接到直接图像映射的了解差不多了

重点知识：
GAN，生成对抗网络，这是一个神奇的工具，挺不错的，除了他本身的图像转换、图像生成应用，它还可以用来做图像复原、分割、分类、检测、样本生成，只要你用得好，基本上所有领域都可以应用，我和淑鑫也主要是用GAN做图像去雾的。

原始的GAN：
[GAN1](https://www.cnblogs.com/bonelee/p/9166084.html)\
[GAN2](https://blog.csdn.net/c2a2o2/article/details/73195871)\
[GAN3](https://blog.csdn.net/u013709270/article/details/78763056)

GAN的一些简单工作和综述：
[https://www.jiqizhixin.com/articles/2019-03-19-12](https://www.jiqizhixin.com/articles/2019-03-19-12)\
[https://blog.csdn.net/Sakura55/article/details/81514828](https://blog.csdn.net/Sakura55/article/details/81514828)\
[https://zhuanlan.zhihu.com/p/25071913](https://zhuanlan.zhihu.com/p/25071913)

里面可能涉及一些公式，推导一时间看不来，没关系，不一定要现在就看懂，后面了解深入了，再去推导公式就会懂了

基于GAN的去雾：

[Cycledehaze](https://www.jianshu.com/p/a68b7cd6e4c1)
[Dehazegan](https://blog.csdn.net/weixin_44795555/article/details/104655926)
我做得那个上次把原文发你们了

这次的了解内容差不多就是这些了，很有一点多。
然后就是dcp、nld这些传统算法网上都可以找到matlab算法，可以在自己的电脑上跑一下，对结果分析一下，然后这周天或下周你们做得完，我们可以讨论一下，你们对这些传统算法结果的看法，我们来分析一下为什么会有这样的结果，你们对这些结果有没有什么想法。
