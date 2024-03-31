function h=pred(cancion)
    load('w.mat'), load('norm_x.mat')
    [ys,fs]=audioread(cancion);
    %ys=ys/max(ys);
    [low, mid, high, loudness]=atrib(ys,fs);
    x=[low mid high loudness];
    for i=1:4
        x(i)=(x(i)-norm_x(1,i))/(norm_x(2,i)-norm_x(3,i));
    end
    x=[1 x];
    g=x*w';
    h=round(1/(1+exp(-g)));
end