
%%
clear
clc
delete(instrfindall);
%s=serial('COM12','BaudRate',230400);
s = Bluetooth('Golfication Khelfie',1);
fopen(s);


%%
for k=1:1000000
    data=fscanf(s);
    
    disp(data);
end
%%

x=0;
t=0;
%ypr=[];
figure(1)
Rotation_Matrix=[-0.1422443,0.8067073,-0.5735765;-0.8184285,0.2300644,0.5265408;0.5567238,0.5443287,0.6275069];

for i=1:10000
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    fscanf(s);
    
    data=fscanf(s);
    
    
    IncomingString = char(data);
    IncomingString = regexp(IncomingString, '\s*', 'split');
    
    xxx=str2double(IncomingString(1,11));
    yyy=str2double(IncomingString(1,12));
    zzz=str2double(IncomingString(1,13));
    
    
    if(xxx<0)
        error=180-abs(xxx);
        EX=180+error;
    else
        EX=xxx;
    end
    
    if(yyy<0)
        error=180-abs(yyy);
        EY=180+error;
    else
        EY=yyy;
    end
    EZ=zzz;
    
    ypr=[EX EY EZ];
    
   YPR=ypr*Rotation_Matrix;
    
    Ex=YPR(1,1);
    Ey=YPR(1,2);
    Ez=YPR(1,3);
    
    time=t;
    array=[i Ex Ey Ez];
    disp(array);
    subplot(3,1,1);
    plot(time, Ez, '.')
    axis([0 1000 0 360])
    title('YAW')
    grid on
    hold on
    subplot(3,1,2);
    plot(time,Ey, '.')
    axis([0 1000 0 360])
    title('PITCH')
    grid on
    hold on
    subplot(3,1,3);
    plot(time,Ex, '.')
    axis([0 1000 0 360])
    title('ROLL')
    grid on
    hold on
    
    
    t=t+1;
    pause(.00002)
end
%%
figure(2)
subplot(2,1,1);
plot(time, Py, 'r');
title('Pitch')
subplot(2,1,2);
plot(time, Rz, 'g');
title('Roll')

clearvars -except s
