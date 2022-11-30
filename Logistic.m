function [P]=Logistic(t,M,M0,P0) 
K=1;
tau=-(log(((K/M0)-1)/((1/P0)-1)))/M;
P=K./(1+((K/P0)-1)*exp(-tau*t));



