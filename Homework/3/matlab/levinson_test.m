a = [1 0.1 -0.8 -0.27];

v = 0.4;
w = sqrt(v)*randn(15000,1);
x = filter(1,a,w);

[r,lg] = xcorr(x,'biased');
r(lg<0) = [];

% [ar,e] = levinson(r,numel(a)-1)

[~,~,k] = levinson(r,16);
stem(k,'filled')

conf = sqrt(2)*erfinv(0.95)/sqrt(15000);
hold on
[X,Y] = ndgrid(xlim,conf*[-1 1]);
plot(X,Y,'--r')
hold off