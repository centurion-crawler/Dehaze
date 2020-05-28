# GAN
## 框架思想
### 生成模型G，判别模型D（二分类器）+其他
min-max game 博弈论 纳什均衡 GD优化

最大化$L_{cGAN}(G,D)=E_{x,y}[logD(x,y)]+E_{x,z}[log(1-D(x,G(x,z)))]$

判别器$L_{GAN}(G,D)=E_y[logD(y)]+E_{x,z}[log(1-D(G(x,z)))]$

L1-loss$L_{L1}=E_{x,y,z}(||y-G(x,z)||_1)$

$G^*=arg~min~max~L_{cGAN}(G,D)=\lambda~L_{L1}(G)$

问题：自由度大，需要Partical Guidance,Fine-Grained Guiance Special Architecture
#### Partical Guidance
1、加显式外部信息，G、D的去拟合分布变为概率分布，半监督模型

2、Improved GAN: feature matching, minibatch discrimination
* feature matching D强G弱，让D传特征给G。
  目标函数：D为神经网络中间层，给G特供输出特征(??)
*  minibatch discrimination : D判断真假的时候不只关注现有输入。
*  pix2pix、iGAN 监督学习
#### Fine-Grained Guiance
无监督模型。
* 递增生成G，每次得到残差图片，之后每个图片放大做加法
* Text -> IMAGE matching-aware discriminator 扩大目标函数项(???)
* LAPGAN & matching-aware——StackGAN 层次化标题生成，(1)捕捉轮廓和色调 (2)细节调整 (如何?)
* PPGN LAPGAN 使用 Denosing AutoEncoder 迭代。(???迭代过程不清楚)
### pix2pix 
* U-Net 
* PatchGAN来处理图像的高频部分
