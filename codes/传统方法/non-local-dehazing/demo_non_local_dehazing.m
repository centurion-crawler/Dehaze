% This is a demo script demonstrating the non-local image dehazing algorithm
% described in the paper:
% Non-Local Image Dehazing. Berman, D. and Treibitz, T. and Avidan S., CVPR2016,
% which can be found at:
% www.eng.tau.ac.il/~berman/NonLocalDehazing/NonLocalDehazing_CVPR2016.pdf
% If you use this code, please cite our paper.
% 
% Please read the instructions on README.md in order to use this code.
%
% Author: Dana Berman, 2016. 
% 
% The software code of the Non-Local Image Dehazing algorithm is provided
% under the attached LICENSE.md
clear all
% Choose image to use, four example image are supplied with the code in the
% sub-folder "images":
%image_name = 'pumpkins';%'pumpkins'; % 'train'; % 'cityscape';   % 
pathin="E:\learning\program\github\Dehazeimages\SOTS\indoor\hazy\";
File=dir(fullfile(pathin,'*.png'));
FileNames={File.name}';
pathtest="E:\learning\program\github\Dehazeimages\SOTS\indoor\gt\";
pathout="E:\learning\program\github\Dehazeimages\SOTS\indoor\mytestnld_zzf\";
score1=[];
score2=[];
for i=1:30
    disp(i)
    img_hazy=imread(strcat(pathin,FileNames{i}));
    img_test = imread(strcat(pathtest,FileNames{i}(1:4),".png"));
% % Load the gamma from the param file. 
% % These values were given by Ra'anan Fattal, along with each image:
% % http://www.cs.huji.ac.il/~raananf/projects/dehaze_cl/results/
    fid = fopen(["E:\learning\program\github\Dehaze\codes\传统方法\params.txt"],'r');
    [C] = textscan(fid,'%s %f');    
    fclose(fid);
    gamma = C{2}(1);
% 
% % Estimate air-light using our method described in:
% % Air-light Estimation using Haze-Lines. Berman, D. and Treibitz, T. and 
% % Avidan S., ICCP 2017
    A = reshape(estimate_airlight(im2double(img_hazy).^(gamma)),1,1,3);
% 
% % Dehaze the image	
    [img_dehazed, trans_refined] = non_local_dehazing(img_hazy, A, gamma );
    %imwrite(img_dehazed,strcat(pathout,FileNames{i}(1:4),num2str(i),".png"));
    score1=[score1,ssim(img_dehazed,img_test)];
    score2=[score2,psnr(img_dehazed,img_test)];
end
disp(mean(score1))
disp(mean(score2))
% % Display results
% figure('Position',[50,50, size(img_hazy,2)*3 , size(img_hazy,1)]);
% subplot(1,3,1); imshow(img_hazy);    title('Hazy input')
% subplot(1,3,2); imshow(img_dehazed); title('De-hazed output')
% subplot(1,3,3); imshow(trans_refined); colormap('jet'); title('Transmission')
% % 