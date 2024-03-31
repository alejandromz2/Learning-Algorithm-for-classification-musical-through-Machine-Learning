clc, clear all, close all
%%  EXTRAER ATRIBUTOS
files=dir('C:\Users\dospu\Documents\MATLAB\topicos\Proyecto 1\songs_train');
files_test=dir('C:\Users\dospu\Documents\MATLAB\topicos\Proyecto 1\songs_test');

% INICIALIZAMOS VECTORES DE ATRIBUTOS
low=zeros(length(files)-2,1);
mid=zeros(length(files)-2,1);
high=zeros(length(files)-2,1);
loudness=zeros(length(files)-2,1);
for k=3:length(files)
    n=k-2;
    cd songs_train
    name=files(k).name;
    [ys,fs]=audioread(files(k).name);
    cd ..
    [low(n),mid(n),high(n),loudness(n)]=atrib(ys,fs);%AQUI SE EXTRAEN LOS ATRIBUTOS
end
x=[low, mid, high, loudness];% GUARDAMOS LOS ATRIBUTOS

%% FORMAR LA REGLA DE REGRESION
load('salida2.mat')             %SALIDA DETERMINADA A MANUALMENTE

atrb=size(x,2);

%NORMALIZACION
for i=1:atrb
    norm_x(1,i)=mean(x(:,i));
    norm_x(2,i)=max(x(:,i));
    norm_x(3,i)=min(x(:,i));
    x(:,i)=(x(:,i)-norm_x(1,i))/(norm_x(2,i)-norm_x(3,i));
end
save norm_x.mat norm_x          %GUARDAMOS LA DATA DE NORMALIZACION

atrb=atrb+1;
x=[ones(size(x,1),1) x];        %AGREGAMOS UN 1 PARA QUE MULTIPLIQUE EL OFFSET

w=ones(1,atrb);
y=salida2;

n=size(x,1); %NUMERO DE MUESTRAS

alfa=5;    %TAMANO DE PASO
n_iter=3000;   %NUMERO DE ITERACIONES

for i=1:n_iter
    g=w*x';
    h=1./(1+exp(-g));   %FUNCION DE HIPOTESIS
    for cw=1:atrb
        wn(cw)= w(cw)-alfa/n*((h'-y)'*x(:,cw));
        w(cw)=wn(cw);
    end
    J(i)=-1/n*(y'*log(h')+(1-y')*log(1-h'));      %FUNCION DE COSTO
end

save w.mat w                %GUARDAMOS LOS PESOS PARA LA FUNCION DE PREDICCION INDIVIDUAL

%GRAFICANDO LA FUNCION DE COSTO
figure,plot(J,'b','linewidth',2),title('Decremento del costo vs iteraciones')
xlabel('Iteracion'),ylabel('Costo'),grid

%METRICAS DE EVALUACION
Numero_de_iteraciones = n_iter
Tamano_de_paso_entre_iteraciones = alfa
Costo_alcanzado_en_entrenamiento = J(end)

%% DESEMPENO CON LA DATA DE ENTRENAMIENTO

for n=1:length(files)-2
    g=x(n,:)*w';
    h(n)=round(1./(1+exp(-g)));
end
comparacion_train=[salida2,h'];
acertados=sum(and(salida2,h'))+sum(and(1-salida2,1-h'));
acertadont=length(salida2)-acertados;
porcetanje_exactitud=acertados/length(salida2)

%% TESTEANDO (primero sacamos atributos y luego comparamos)
load('salida2_test.mat')
names=zeros(length(files_test)-2,1);
low=zeros(length(files_test)-2,1);
mid=zeros(length(files_test)-2,1);
high=zeros(length(files_test)-2,1);
loudness=zeros(length(files_test)-2,1);
for k=3:length(files_test)
    n=k-2;
    cd songs_test
    name=files_test(k).name;
    %names(n)=name
    [ys,fs]=audioread(files_test(k).name);
    cd ..
    [low(n),mid(n),high(n),loudness(n)]=atrib(ys,fs);
    %atributos(n,:)=[low(n),mid(n),high(n),loudness(n)];
end
x_test=[low, mid, high, loudness];

for i=1:size(x_test,2)
    x_test(:,i)=(x_test(:,i)-mean(x_test(:,i)))/(max(x_test(:,i))-min(x_test(:,i)));
end

x_test=[ones(size(x_test,1),1) x_test];

for n=1:length(files_test)-2
    g=x_test(n,:)*w';
    h2(n)=round(1./(1+exp(-g)));
end
comparacion_test=[salida2_test,h2'];

acertados_test=sum(and(salida2_test,h2'))+sum(and(1-salida2_test,1-h2'));
acertadont_test=length(salida2_test)-acertados_test;
porcetanje_exactitud_test=acertados_test/length(salida2_test)
