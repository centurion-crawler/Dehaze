# 暗通道去雾note
$J^{dark}(x)=\min \limits_{y\in\Omega(x)}(\min \limits_{c \in\{r,g,b\}}J^c(y))$

暗通道先验理论: $J^{dark} \rightarrow 0$

rgb各通道取最小值组成灰度图，
然后最小值滤波(?)

[最小值滤波](https://blog.csdn.net/imwtj123/article/details/79828998)

中值滤波法是一种非线性平滑技术，它将每一像素点的灰度值设置为该点某邻域窗口内的所有像素点灰度值的中值。原理是把数字图像或数字序列中一点的值用该点的一个邻域中各点值(个人理解：周围半径为r的范围内)的中值代替，让周围的像素值接近的真实值，从而消除孤立的噪声点。方法是用某种结构的二维滑动模板，将板内像素按照像素值的大小进行排序，生成单调上升（或下降）的为二维数据序列。

最大值、最小值滤波与中值滤波相类似，先是排序像素值，而后对中心像素值和最大、最小像素值进行比较。若比最小值小，则将最小值替换成中心像素；同样若比最大值大，则将最大值替换成中心像素。

雾图形成模型：\
$I(x)=J(x)t(x)+A(1-t(x))$

I(x)：现有图像(待去雾)，J(X)要恢复的图像，A是大气光成分，t(x)是投射率

一系列推导，t值预估：$\hat{t}(x)=1-\min \limits_{y\in\Omega(x)}(\min \limits_{c \in\{r,g,b\}}\frac{J^c(y)}{A^C})$

实际情况修正：$\hat{t}(x)=1-\omega\min \limits_{y\in\Omega(x)}(\min \limits_{c \in\{r,g,b\}}\frac{J^c(y)}{A^C}),\omega\in[0,1]$

A[全球大气光](https://blog.csdn.net/yinhou1771/article/details/81070803)

$J(x)=(I(x)-A)/t(x)+A$\
$J(x)=\frac{(I(x)-A)}{max(t(x),t_0)}+A$,设置$t_0$限制，防止某些地方过曝
```
import cv2  
import numpy as np  
   
def zmMinFilterGray(src, r=7):  
    '''''最小值滤波，r是滤波器半径'''  
    return cv2.erode(src,np.ones((2*r-1,2*r-1)))
# =============================================================================
#     if r <= 0:  
#         return src  
#     h, w = src.shape[:2]  
#     I = src  
#     res = np.minimum(I  , I[[0]+range(h-1)  , :])  
#     res = np.minimum(res, I[range(1,h)+[h-1], :])  
#     I = res  
#     res = np.minimum(I  , I[:, [0]+range(w-1)])  
#     res = np.minimum(res, I[:, range(1,w)+[w-1]])  
# =============================================================================
 #   return zmMinFilterGray(res, r-1)  
   
def guidedfilter(I, p, r, eps):  
    '''''引导滤波，直接参考网上的matlab代码'''  
    height, width = I.shape  
    m_I = cv2.boxFilter(I, -1, (r,r))  
    m_p = cv2.boxFilter(p, -1, (r,r))  
    m_Ip = cv2.boxFilter(I*p, -1, (r,r))  
    cov_Ip = m_Ip-m_I*m_p  
   
    m_II = cv2.boxFilter(I*I, -1, (r,r))  
    var_I = m_II-m_I*m_I  
   
    a = cov_Ip/(var_I+eps)  
    b = m_p-a*m_I  
   
    m_a = cv2.boxFilter(a, -1, (r,r))  
    m_b = cv2.boxFilter(b, -1, (r,r))  
    return m_a*I+m_b  
   
def getV1(m, r, eps, w, maxV1):  #输入rgb图像，值范围[0,1]  
    '''''计算大气遮罩图像V1和光照值A, V1 = 1-t/A'''  
    V1 = np.min(m,2)                                         #得到暗通道图像  
    V1 = guidedfilter(V1, zmMinFilterGray(V1,7), r, eps)     #使用引导滤波优化  
    bins = 2000  
    ht = np.histogram(V1, bins)                              #计算大气光照A  
    d = np.cumsum(ht[0])/float(V1.size)  
    for lmax in range(bins-1, 0, -1):  
        if d[lmax]<=0.999:  
            break  
    A  = np.mean(m,2)[V1>=ht[1][lmax]].max()  
           
    V1 = np.minimum(V1*w, maxV1)                   #对值范围进行限制  
       
    return V1,A  
   
def deHaze(m, r=81, eps=0.001, w=0.95, maxV1=0.80, bGamma=False):  
    Y = np.zeros(m.shape)  
    V1,A = getV1(m, r, eps, w, maxV1)               #得到遮罩图像和大气光照  
    for k in range(3):  
        Y[:,:,k] = (m[:,:,k]-V1)/(1-V1/A)           #颜色校正  
    Y =  np.clip(Y, 0, 1)  
    if bGamma:  
        Y = Y**(np.log(0.5)/np.log(Y.mean()))       #gamma校正,默认不进行该操作  
    return Y  
   
if __name__ == '__main__':  
    m = deHaze(cv2.imread('test.jpg')/255.0)*255  
    cv2.imwrite('defog.jpg', m) 
```