clc;
clear all;
close all;
 
%%%%%%%%%%% Getting different features %%%%%%%%%%%%%%%
year='2010'; W='2'; DATA=[];
load(['PWV_',year,'from_WS_',W,'_withGradient']);
DOY=[]; DOY=DATA(:,1);
Hour=[]; Hour=DATA(:,2);
T=[]; T=DATA(:,4);
SR=[]; SR=DATA(:,5);
RH=[]; RH=DATA(:,6);
DPT=[]; DPT=DATA(:,8);
PWV=[]; PWV=DATA(:,13);
Rain=[]; Rain=DATA(:,7);

f=[]; f=find(PWV<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
i=[]; i=isnan(PWV); f=[]; f=find(i>0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(T<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(DPT<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(RH<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];

Rain(Rain>0)=1;
DataM_10=[]; DataM_10=[DOY Hour T SR RH DPT PWV];
Group_10=[]; Group_10=Rain;

%%%%%%%%%%% Getting different features %%%%%%%%%%%%%%%
year='2011'; W='2'; DATA=[];
load(['PWV_',year,'from_WS_',W,'_withGradient']);
DOY=[]; DOY=DATA(:,1);
Hour=[]; Hour=DATA(:,2);
T=[]; T=DATA(:,4);
SR=[]; SR=DATA(:,5);
RH=[]; RH=DATA(:,6);
DPT=[]; DPT=DATA(:,8);
PWV=[]; PWV=DATA(:,13);
Rain=[]; Rain=DATA(:,7);

f=[]; f=find(PWV<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
i=[]; i=isnan(PWV); f=[]; f=find(i>0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(T<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(DPT<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(RH<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];

Rain(Rain>0)=1;
DataM_11=[]; DataM_11=[DOY Hour T SR RH DPT PWV];
Group_11=[]; Group_11=Rain;

%%%%%%%%%%% Getting different features %%%%%%%%%%%%%%%
year='2012'; W='3'; DATA=[];
load(['PWV_',year,'from_WS_',W,'_withGradient']);
DOY=[]; DOY=DATA(:,1);
Hour=[]; Hour=DATA(:,2);
T=[]; T=DATA(:,4);
SR=[]; SR=DATA(:,5);
RH=[]; RH=DATA(:,6);
DPT=[]; DPT=DATA(:,8);
PWV=[]; PWV=DATA(:,13);
Rain=[]; Rain=DATA(:,7);

f=[]; f=find(PWV<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
i=[]; i=isnan(PWV); f=[]; f=find(i>0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(T<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(DPT<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];
f=[]; f=find(RH<=0);
PWV(f)=[]; DOY(f)=[]; Hour(f)=[]; T(f)=[]; SR(f)=[]; RH(f)=[]; DPT(f)=[]; Rain(f)=[];

Rain(Rain>0)=1;
DataM_12=[]; DataM_12=[DOY Hour T SR RH DPT PWV];
TrainGroup_12=[]; TrainGroup_12=Rain;

%%%%%%%%%%%%%%%%%%%%%%%% Training with varying percentage of data %%%%%%%%%%%%%%%%%
DATA=[]; DATA=[DataM_10; DataM_11];
Group=[]; Group=[Group_10; Group_11];

for c=1:100
k=1;
disp(['Loop : ',num2str(c)]);
for kl=0.01:0.1:0.9; %%%%%% % of Training Data
indices_len=[]; indices_len=kl*length(DATA);
indices_len=floor(indices_len);
    
all_indices=[]; all_indices=1:length(DATA);
train_indices=[]; train_indices=datasample((1:length(DATA)),indices_len,'Replace',false);
test_indices=[]; test_indices=all_indices;
test_indices(train_indices)=[];

TrainMat=[]; TrainMat=DATA(train_indices,:);
TrainGr=[]; TrainGr=Group(train_indices);
TestMat=[]; TestMat=DATA(test_indices,:);
TestGr=[]; TestGr=Group(test_indices);

%%%%%%%%%%%%%%%%%%%%%%%% dividing into minor group and major group %%%%%%%%
f=[]; f=find(TrainGr==1);
MinorData=[]; MinorData=TrainMat(f,:);
MinorGroup=[]; MinorGroup=TrainGr(f,:);

f=[]; f=find(TrainGr==0);
MajorData=[]; MajorData=TrainMat(f,:);
MajorGroup=[]; MajorGroup=TrainGr(f,:);

%%%%%%%%%% Type I, 1:1 %%%%%%%%%%%%%%%%
indices=[]; indices=length(MinorData);
temp_indi=[]; temp_indi=datasample((1:length(MajorData)),indices,'Replace',false);
MajorDataI=[]; MajorDataI=MajorData(temp_indi,:);
MajorGrI=[]; MajorGrI=MajorGroup(temp_indi,:);

ResampledTrain=[]; ResampledTrain=[MajorDataI; MinorData];
ResampledGr=[]; ResampledGr=[MajorGrI; MinorGroup];

%%%%%%%%%%%%% Training the Model %%%%%%%%%%%%%%%%%%%%
disp('Trianing with the resampled data')
svmstruct=[]; svmstruct=svmtrain(ResampledTrain,ResampledGr,'kktviolationlevel',0.8);

%%%%%%%%%%%%% Testing the Model %%%%%%%%%%%%%%%%%%%%
disp('Testing on the test data')
species=[]; species=svmclassify(svmstruct,TestMat);
i=[]; i=isnan(species);
f=[]; f=find(i>0);
species(f)=[]; TestGr(f)=[];   
f=[]; f=find(species==1 & TestGr==1);
TP(c,k)=length(f);
f=[]; f=find(species==1 & TestGr==0);
FP(c,k)=length(f);
f=[]; f=find(species==0 & TestGr==1);
FN(c,k)=length(f);
f=[]; f=find(species==0 & TestGr==0);
TN(c,k)=length(f);    
f=[]; f=find(species~=TestGr);
Error(c,k)=length(f)/length(species);
    
FA(c,k)=FP(c,k)/(FP(c,k)+TN(c,k));
TD(c,k)=TP(c,k)/(TP(c,k)+FN(c,k));

%%%%%%%%%%%%% Testing the Model %%%%%%%%%%%%%%%%%%%%
disp('Testing on the validation data')
species=[]; species=svmclassify(svmstruct,DataM_12);
TestGr=[]; TestGr=TrainGroup_12;
i=[]; i=isnan(species);
f=[]; f=find(i>0);
species(f)=[]; TestGr(f)=[];   
f=[]; f=find(species==1 & TestGr==1);
TP_val(c,k)=length(f);
f=[]; f=find(species==1 & TestGr==0);
FP_val(c,k)=length(f);
f=[]; f=find(species==0 & TestGr==1);
FN_val(c,k)=length(f);
f=[]; f=find(species==0 & TestGr==0);
TN_val(c,k)=length(f);    
f=[]; f=find(species~=TestGr);
Error_val(c,k)=length(f)/length(species);
    
FA_val(c,k)=FP_val(c,k)/(FP_val(c,k)+TN_val(c,k));
TD_val(c,k)=TP_val(c,k)/(TP_val(c,k)+FN_val(c,k));

k=k+1;
end
end

%%%%%%%%% Plot the results %%%%%%%%%
x=0.01:0.1:0.9;
plot(x.*100,mean(TD).*100,'b','LineWidth',2);
hold on;
plot(x.*100,mean(FA).*100,'r','LineWidth',2);
hold on
plot(x.*100,mean(TD_val).*100,'--b','LineWidth',2);
hold on;
plot(x.*100,mean(FA_val).*100,'--r','LineWidth',2);
xlabel('Training Data (%)')
ylabel('True Detection and False Alarm Rate (%)')
legend('True Detection (Test Data)','False Alarm (Test Data)','True Detection (2012 Data)','False Alarm (2012 Data)')
set(gca,'FontName','Times','FontSize',12)






















