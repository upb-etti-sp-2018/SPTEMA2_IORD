P=40;
f=1/P;
t=-2*P:0.002:2*P;
D=0.2;
N=50;
xi=(1+sawtooth(2*pi*f*t,D))/2;
f0=@(t)(1+sawtooth(2*pi*f*t,D))/2;
cc=1/P*integral(f0,0,P);
Ck=zeros(1,N);
Ak=zeros(1,N);
xr=0;
for (k=1:1:N)
   f1=@(t)(1+sawtooth(2*pi*f*t,D))/2.*exp(-2*pi*f*t*1j*(k-25));
   Ck(k)=1/P*integral(f1,0,P);
   Ak(k+1)=2*abs(Ck(k));
   xr=xr+Ck(k)*exp(2*pi*f*t*1j*(k-25));
end
figure(1);
plot(t,xr,t,xi);
figure(2);
Ak(26)=abs(cc);
Ak(1)=Ak(51);
stem([0:N],Ak);
% am ales un D conform cerintei, numarul meu din tabel fiind 8 =>
% 8/40=0.2 ; am numar par si am ales semnal triunghilar; conceptual, ce se
% intampla in program este generarea unui semnal propriu-zis, definirea
% unei functii cu ajutorul careia aflu componenta continua, acest proces
% fiind urmat de o structura iterativa in care redefinesc functia pentru
% fiecare valoarea a lui k (1-50) si adun valoarea coeficientului calculat
% inmultit cu exponentiala din formula SFC.