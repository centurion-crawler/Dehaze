# CAP
* I(x)=J(x)t(x)+A(1-t(x))
* t=e-βd(x)
d(x) 景深，β为雾均匀下的常量，在理想的情况下d的范围是[0,∞)，反映在图像上就是物体可以距观察者多远
单幅图像去雾随着雾的浓度的变化，其像素的亮度和饱和度也发生了急剧的变化，具体情况就是，在无雾区域中，具有低亮度和高饱和度，它们两者之间的差值接近于0。
雾度+，亮度+，饱和度-

d(x)=θ0+θ1 v(x)+θ2 s(x)+ɛ(x)

θ(1,2,3)是不知道的线性参数，ɛ(x)是模型的随机误差，可以将它看作是一个随机图像

$\nabla d=\theta_1\nabla v+\theta_2\nabla s+\nabla \epsilon$

然后通过机器学习算法，分别训练出θ(1,2,3)

## 修正
$d_r(x)=\min_{y \in \Omega_r(x)} d(y)$

复原

$J(x)=\frac{I(x)-A}{min{max{e^{-\beta d(x)},0.1},0.9}}+A$