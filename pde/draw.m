%A=AS1(3:5403,:)
x=A(:,1);
y=A(:,2)
%AA=AAS1(3:5403,:)
plot(x,y,'linewidth',2);
hold on 
plot(x,AA,'linewidth',2)
legend('��õ�Ƥ��T-t����','ʵ��õ���Ƥ��T-t����')
xlabel('ʱ��t���룩');
ylabel('�¶�T(��)');
title('��õ���ʵ���Ƥ���¶�-ʱ������ͼ')