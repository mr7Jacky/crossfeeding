function gifCreate(dataset,filename, isCell)
    % Goal: Create a gif with given dataset. There are color mode
    % and gray scale mode for gif
    % Input: 
    % dataset: the dataset to create gif
    % filename: the filename for the .fig file
    % isCell: determine whether output is cell or not
    % Output: two gif file stored in current directory with 
    % the given name, one for the placement, and one for concentration.
    set(gcf,'renderer','OpenGL');
    [~,col] = size(dataset);
    global_max = 2;
    if ~isCell
        global_max = 0;
        for n = 1:col
            cur_data = dataset{1,n};
            local_max = max(max(cur_data));
            if local_max > global_max
                global_max = local_max;
            end
        end
    end
    for n = 1:col
        h = figure('visible','off');
        cur_data = dataset{1,n};
        imagesc(cur_data,[0,global_max]);
        if isCell
            c = colorbar('Location','south','color','w','Ticks',[0,1,2], ...
                'TickLabels',{'None','Type 1','Type 2'});
            c.Label.String = 'Cell Colony';
        else
            c = colorbar('Location','south','color','w');
            c.Label.String = 'Nutrient Concentration';
        end
        frame = getframe(h); 
        im = frame2im(frame); 
        [imind,cm] = rgb2ind(im,256); 
        % Write to the GIF File 
        if n == 1 
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
        else 
            imwrite(imind,cm,filename,'gif','WriteMode','append'); 
        end 
    end
end