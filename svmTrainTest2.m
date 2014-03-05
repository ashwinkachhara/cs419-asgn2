trainInd = [155,56,63,144,104,93,117,8,181,67,84,139,90,97,169,138,83,59,106,79,142,188,5,48,179,177,108,53,29,21,25,52,185,109,37,64,31,49,178,27,183,110,61,88,50,87,26,43,124,94,189,161,19,102,44,130,15,73,1,125,173,36,116,82,71,23,141,126,137,65,158,153,2,132,114,4,18,85,75,191,24,95,167,154,39,168,13,9,66,20,57,122,10,12,118];
testInd = [123,99,174,32,40,22,175,34,152,92,170,91,146,119,190,112,127,165,35,6,121,160,55,148,3,96,166,136,68,16,140,135,69,115,11,101,54,105,176,30,133,186,149,45,184,77,60,113,171,147,150,163,74,78,72,62,70,129,107,134,51,33,7,86,182,103,38,100,157,58,76,143,81,172,187,159,89,42,162,28,128,145,164,151,17,131,41,120,47,111,180,98,80,14,156,46];

load('Ktrain05.mat');
load('Ktest05.mat');
load('labelAzole.mat');
load('labelFibrate.mat');
load('labelStatin.mat');
load('labelToxicant.mat');

% model = svmtrain(labelToxicant(trainInd), Ktrain05, '-t 4');
% [predClass, acc, decVals] = svmpredict(labelToxicant(testInd), Ktest05, model);
% 
% model = svmtrain(labelStatin(trainInd), Ktrain05, '-t 4');
% [predClass, acc, decVals] = svmpredict(labelStatin(testInd), Ktest05, model);
% 
% model = svmtrain(labelAzole(trainInd), Ktrain05, '-t 4');
% [predClass, acc, decVals] = svmpredict(labelAzole(testInd), Ktest05, model);
% 
% model = svmtrain(labelFibrate(trainInd), Ktrain05, '-t 4');
% [predClass, acc, decVals] = svmpredict(labelFibrate(testInd), Ktest05, model);

labelAzole1 = labelAzole;
labelAzole1 = double(labelAzole1==1);
labelFibrate1 = labelFibrate;
labelFibrate1 = double(labelFibrate1==1);
labelStatin1 = labelStatin;
labelStatin1 = double(labelStatin1==1);
labelToxicant1 = labelToxicant;
labelToxicant1 = double(labelToxicant1==1);
labels = labelAzole1+ labelFibrate1+ labelStatin1+ labelToxicant1;




model = svmtrain(labels(trainInd), Ktrain06, '-t 4');
[predClass, acc, decVals] = svmpredict(labels(testInd), Ktest06, model);