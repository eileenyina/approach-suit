%function [U x t]=ppde(uX,uT,phi,psi1,psi2,M,N,C)
%�ŵ���ʽ��ʽ���������ƫ΢�ַ���
%[U x t]=PDEParabolicClassicalExplicit(uX,uT,phi,psi1,psi2,M,N,C)
%
%���̣�u_t=C*u_xx 0 <= x <= uX,0 <= t <= uT
%��ֵ������u(x,0)=phi(x)
%��ֵ������u(0,t)=psi1(t), u(uX,t)=psi2(t)
%
%���������U -����󣬵�һ�б�ʾ��ֵ����һ�к����һ�б�ʾ��ֵ���ڶ��б�ʾ��2�㡭��
%         x -�ռ����
%         t -ʱ�����
%���������uX -�ռ����x��ȡֵ����
%         uT -ʱ�����t��ȡֵ����
%         phi -��ֵ����������Ϊ��������
%         psi1 -��ֵ����������Ϊ��������
%         psi2 -��ֵ����������Ϊ��������
%         M -��x��ĵȷ�������
%         N -��t��ĵȷ�������
%         C -ϵ����Ĭ�������C=1
%
%Ӧ�þ�����
% uX=1;uT=0.2;
% M=15;N=100;C=1;
% phi=inline('sin(pi*x)');psi1=inline('0');psi2=inline('0');
%[U x t]=PDEParabolicClassicalExplicit(uX,uT,phi,psi1,psi2,M,N,C);
% inline('263+15.11+2.216*cos(1.757*t)+3.687*sin(1.757*t)-1.895*cos(2*1.757*t)+1.728*sin(2*1.757*t)')
%���ò���C��Ĭ��ֵ


%���㲽��
%uX=15.2;
%%uX=1.52;
%uX=0.152;
uX=0.0172;
uT=5.4;
M=10;
N=5400;
dx=uX/M;%x�Ĳ���
dt=uT/N;%t�Ĳ���

x=(0:M)*dx;
t=(0:N)*dt;
rou=[300,862,74.2,1.18,1200];
c=[1377,2100,1726,1005,3400];
K=[0.082,0.37,0.045,0.028,0.532];
k=K./(c.*rou);
r=k.*dt/dx/dx;%������
r1=1-2.*r;


%�����ֵ�ͱ�ֵ
U=zeros(M+1,N+1);
for i=1:N+1
    for j=1:M+1
        U(i,j)=37;
    end;
end;
% for i=1:M+1
%     U(i,1)=37;
% end
for j=1:N+1
    U(1,j)=75;
    U(M+1,j)=37;
end

%������
for j=1:N
    for i=2:M
      
        if (j*dx<=0.006)
            U(i,j+1)=r(1)*U(i-1,j)+r1(1)*U(i,j)+r(1)*U(i+1,j);
        end;
        if ((j*dx>0.0066)&&(j*dx>0.0006))
            U(i,j+1)=r(2)*U(i-1,j)+r1(2)*U(i,j)+r(2)*U(i+1,j);
        end;
        if ((j*dx>0.0102)&&(j*dx>0.0066))
            U(i,j+1)=r(3)*U(i-1,j)+r1(3)*U(i,j)+r(3)*U(i+1,j);
        end;
        if ((j*dx>0.0152)&&(j*dx>0.0102))
            U(i,j+1)=r(4)*U(i-1,j)+r1(4)*U(i,j)+r(4)*U(i+1,j);
        end;
        if ((j*dx>0.01728)&&(j*dx>0.0152))
            U(i,j+1)=r(5)*U(i-1,j)+r1(5)*U(i,j)+r(5)*U(i+1,j);
        end;
    end
end

U=U';
heatmap(U)
%%figureee;
% 
% mesh(x,t,U);  
% title('�¶ȷֲ�ͼ��')
% ylabel('�ռ���� x')
% xlabel('ʱ����� t ')
% zlabel('�¶� U')
% 
% xlswrite('problem10086.csv',Tem');