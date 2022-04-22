clear all;clc;load clrmap;
Path = 'F:\小论文实验\REC027dfq61o.wav';	
[y1,fs]= audioread(Path);
[S,F,T,P]=spectrogram(y1,1024,512,1024,4000);
spec=10*log10(abs(P)); 
spec=spec.';
% 量化为64阶
min_spec=min(min(spec));
max_spec=max(max(spec));
step_spec=(max_spec-min_spec)/63;

spec64=zeros(size(spec)); %64阶量化后的语谱图
I=zeros(size(spec,1),size(spec,2),3);

% 将强度语谱图变换为JET映射的彩色图像，RGB空间
for i=1:size(spec,1)
    for j=1:size(spec,2)
       spec64(i,j)=floor((spec(i,j)-min_spec)/step_spec)+1;
       I(i,j,:)=clrmap(spec64(i,j),:);
    end
end
az=-15;
el=30;
% s=surf(F,T,spec,'EdgeColor','none'); colormap(jet);
% view(az,el) 
s=surf(F,T,spec,I); axis tight;
s.EdgeColor = 'none';
view(az,el) 





% clear all;clc;load clrmap;
% Path = 'F:\小论文实验\REC004-a04.wav';	
% [y1,fs]= audioread(Path);
% [S,F,T,P]=spectrogram(y1,1024,512,1024,4000);
% spec=10*log10(abs(P)); 
% % 量化为64阶
% min_spec=min(min(spec));
% max_spec=max(max(spec));
% step_spec=(max_spec-min_spec)/63;
% 
% spec64=zeros(size(spec)); %64阶量化后的语谱图
% I=zeros(size(spec,1),size(spec,2),3);
% 
% % 将强度语谱图变换为JET映射的彩色图像，RGB空间
% for i=1:size(spec,1)
%     for j=1:size(spec,2)
%        spec64(i,j)=floor((spec(i,j)-min_spec)/step_spec)+1;
%        I(i,j,:)=clrmap(spec64(i,j),:);
%     end
% end
% s=surf(T,F,spec,I); axis tight;
% s.EdgeColor = 'none';










% clear all;clc;
% Path = 'F:\小论文实验\REC004-a04.wav';	
% [y1,fs]= audioread(Path);
% win = 0.1*fs; % 窗长
% noverlap = win/2; % 帧间重叠点数
% nfft = 2^nextpow2(win);  % fft点数
% [S,F,T,P] = spectrogram(y1,win,noverlap,nfft,fs);
% PP=10*log10(P);
% PP=PP.';
% surf(F,T,PP,'edgecolor','none'); axis tight;
% % view(0,90);  % 通常看时谱图时都采用这个角度，若需要可以采用
% xlabel('Hx)'); ylabel('time');