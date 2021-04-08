
dirName = 'data/';
cells = readTxtMatrix(dirName,3);
save('c.mat','cells','cells', '-v7.3');

%%
fprintf('Reading data.\n')
filename = 'c.mat';
outname = strcat(filename,'.gif');
% load(filename);


fprintf('Create gif.\n')
for i = 1:length(cells)
    h = figure('visible','off');
    cur_data = cells{1,i};
    cur_data = cur_data{1};
    imagesc(cur_data);
    f = gcf;
    exportgraphics(f,strcat(num2str(i),'.png'),'Resolution',300);
%     frame = getframe(h); 
%     im = frame2im(frame); 
%     [imind,cm] = rgb2ind(im,256);
%     % Write to the GIF File 
%     if i == 1 
%         imwrite(imind,cm,outname,'gif', 'Loopcount',inf, 'Resolution',300); 
%     else 
%         imwrite(imind,cm,outname,'gif','WriteMode','append', 'Resolution',300); 
%     end 
end