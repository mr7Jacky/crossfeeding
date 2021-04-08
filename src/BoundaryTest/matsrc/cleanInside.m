%%
c = dlmread('9.txt');
d = zeros(size(c));
b = zeros(size(c));
s = 745;
e = 760;
range = s:e;
d(range,range) = c(range,range);
b(s,:) = d(s,:);
b(e,:) = d(e,:);
b(:,e) = d(:,e);
b(:,s) = d(:,s);
figure(1)
imagesc(d)
figure(2)
imagesc(b)
dlmwrite('boundary.txt',b,'delimiter','\t')
dlmwrite('all.txt',d,'delimiter','\t')
%%
c = dlmread('9.txt');
d = zeros(size(c));
b = zeros(size(c));
s = 745;
e = 760;
range = s:e;
d(range,range) = c(range,range);
b(s:748,:) = d(s:748,:);
b(755:e,:) = d(755:e,:);
b(:,757:e) = d(:,757:e);
b(:,s:748) = d(:,s:748);
figure(1)
imagesc(d)
figure(2)
imagesc(b)
dlmwrite('boundary_Thickness_4.txt',b,'delimiter','\t')
dlmwrite('all.txt',d,'delimiter','\t')