function [mean_low,mean_mid,mean_high,mean_loudness]=atrib(ys,fs)
    %[ys,fs]=audioread(cancion);
    
    low_start=20;
    low_mid=300;
    mid_high=2000;
    %high_end=18000;
    
    if size(ys,2)==2
        y=(ys(:,1)+ys(:,2))/2;
    else
        y=ys;
    end
    
    %y=y/max(y);
    yfft=abs(fft(y));
    %yfft=periodogram(y);
    yfft=yfft(1:fix(length(yfft)/2),:);
    %yfft=yfft/max(yfft);
    %freq=linspace(0,fs/2,length(yfft));
    %figure,plot(freq,yfft),hold on

    yfft_low=yfft(fix(length(yfft)*low_start/(fs/2)):fix(length(yfft)*low_mid/(fs/2)));
    %freq_low=freq(fix(length(yfft)*low_start/(fs/2)):fix(length(freq)*low_start/(fs/2)));

    yfft_mid=yfft(fix(length(yfft)*low_mid/(fs/2)):fix(length(yfft)*mid_high/(fs/2)));
    %freq_mid=freq(fix(length(freq)*low_mid/(fs/2)):fix(length(freq)*mid_high/(fs/2)));

    yfft_high=yfft(fix(length(yfft)*mid_high/(fs/2)):end);
    %freq_high=freq(fix(length(freq)*mid_high/(fs/2)):end);

    %plot(freq_low,yfft_low,'r')
    %plot(freq_mid,yfft_mid,'k')
    %plot(freq_high,yfft_high,'b')
    %hold off,

    %%%%%%%%%%%%%%%
    mean_low=mean(yfft_low);
    mean_mid=mean(yfft_mid);
    mean_high=mean(yfft_high);

    mean_loudness=mean(abs(y));

end