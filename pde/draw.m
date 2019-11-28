%A=AS1(3:5403,:)
x=A(:,1);
y=A(:,2)
%AA=AAS1(3:5403,:)
plot(x,y,'linewidth',2);
hold on 
plot(x,AA,'linewidth',2)
legend('求得的皮肤T-t曲线','实验得到的皮肤T-t曲线')
xlabel('时间t（秒）');
ylabel('温度T(℃)');
title('求得的与实验的皮肤温度-时间曲线图')