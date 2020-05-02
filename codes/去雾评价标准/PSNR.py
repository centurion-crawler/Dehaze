
import numpy as np
import math


def psnr(target, ref, scale):
    # target:目标图像  ref:参考图像  scale:尺寸大小
    # assume RGB image
    target_data = np.array(target)
    target_data = target_data[scale:-scale,scale:-scale]
 
    ref_data = np.array(ref)
    ref_data = ref_data[scale:-scale,scale:-scale]
 
    diff = ref_data - target_data
    diff = diff.flatten('C')
    rmse = math.sqrt( np.mean(diff ** 2.) )
    return 20*math.log10(1.0/rmse)



'''
compute PSNR with tensorflow
import tensorflow as tf
def read_img(path):
	return tf.image.decode_image(tf.read_file(path))

def psnr(tf_img1, tf_img2):
	return tf.image.psnr(tf_img1, tf_img2, max_val=255)
 
def _main():
	t1 = read_img('t1.jpg')
	t2 = read_img('t2.jpg')
	with tf.Session() as sess:
		sess.run(tf.global_variables_initializer())
		y = sess.run(psnr(t1, t2))
		print(y)

if __name__ == '__main__':
    _main()
'''