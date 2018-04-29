clc;
clear all;
close all;

%%%%%%%%%%% Getting different features %%%%%%%%%%%%%%%
year='2010'; W='2'; DATA=[];
load(['PWV_',year,'from_WS_',W,'_withGradient']);

DOY=[]; DOY=DATA(:,1);
Hour=[]; Hour=DATA(:,2);
Min=[]; Min=DATA(:,3);
T=[]; T=DATA(:,4);
SR=[]; SR=DATA(:,5);
RH=[]; RH=DATA(:,6);
DPT=[]; DPT=DATA(:,8);
PWV=[]; PWV=DATA(:,13);
Rain=[]; Rain=DATA(:,7);


f=[]; f=find(PWV<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];Min(f)=[];
i=[]; i=isnan(PWV); f=[]; f=find(i>0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];Min(f)=[];
f=[]; f=find(T<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];Min(f)=[];
f=[]; f=find(DPT<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];Min(f)=[];
f=[]; f=find(RH<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];Min(f)=[];

%%%% Plot for specific Rainy Days %%%%%%%%%%%
f=find(Rain>0);
d=333;
f=[]; f=find(DOY==d);
rain=[]; rain=Rain(f); 
p=[]; p=PWV(f); t=[]; t=T(f); sr=[]; sr=SR(f); rh=[]; rh=RH(f); dpt=[]; dpt=DPT(f);
h=[]; h=Hour(f); m=Min(f);
dt=[]; dt=d+h./24+m./(60*24);
d=d+1;
f=[]; f=find(DOY==d);
rain=[rain; Rain(f)]; 
p=[p; PWV(f)]; t=[t; T(f)]; sr=[sr; SR(f)]; rh=[rh; RH(f)]; dpt=[dpt; DPT(f)];
h=[]; h=Hour(f); m=[]; m=Min(f);
dt=[dt; d+h./24+m./(60*24)];



% dateTime=[]; dateTime=DOY(f)+Hour./24;
subplot(3,1,1)
Ax=[]; H1=[]; H2=[]; [Ax, H1, H2]=plotyy(dt,p,dt,rain);
ylabel(Ax(2),'Rainfall Rate(mm/hr)','FontName','Times','FontSize',12,'Color','k')
ylabel(Ax(1),'PWV (mm)','FontName','Times','FontSize',12,'Color','k')
set(Ax(2),'FontName','Times','FontSize',12)
set(Ax(1),'FontName','Times','FontSize',12)
set(H1,'LineWidth',2,'Color','b')
set(H2,'LineWidth',2,'Color','g')
ylim(Ax(1),[55 65])
ylim(Ax(2),[0 35])
Ax(1).YColor = 'k';
Ax(2).YColor = 'k';
Ax(1).YTick=[55 60 65];
Ax(1).YTickLabel=[55 60 65];
Ax(2).YTick=[0 15 35 ];
Ax(2).YTick=[0 15 35 ];
title('Time series of different weather varibales','FontName','Times','FontSize',12)

subplot(3,1,2)
Ax=[]; H1=[]; H2=[]; [Ax, H1, H2]=plotyy(dt,t,dt,rh);
hold on;
plot(dt,dpt,'--c','LineWidth',2)
ylabel(Ax(1),'Temperature (Deg)','FontName','Times','FontSize',12,'Color','k')
ylabel(Ax(2),'Relative Humidity (%)','FontName','Times','FontSize',12,'Color','k')
Ax(1).YColor = 'k';
Ax(2).YColor = 'k';
set(H1,'LineWidth',2,'Color','m')
set(H2,'LineWidth',2,'Color','r')
set(Ax(2),'FontName','Times','FontSize',12)
set(Ax(1),'FontName','Times','FontSize',12)
legend('Surface Temperature','Dewpoint Temperature','RH')

subplot(3,1,3)
plot(dt,sr,'k','LineWidth',2)
ylabel('Solar Radiation (Watt/m2)','FontName','Times','FontSize',12)
set(gca,'FontName','Times','FontSize',12)
xlabel('Time of a day','FontName','Times','FontSize',12)








