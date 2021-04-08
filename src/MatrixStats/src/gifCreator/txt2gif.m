function txt2gif(cells,outputName)
% Goal: Create a gif from given directory, where 
% matrix contains in txt file. Each matrix is a 3000-by-1500.
% The upper half matrix records placement of bacteria
% The lower half matrix records the concentration of neutrient
% Output: two gif file stored in current directory with 
% the given name, one for the placement, and one for concentration.
    fprintf('Reading data.\n')
    concen_A = cell(1,length(cells));
    concen_B = cell(1,length(cells));
    types = cell(1,length(cells));
    for i=1:length(cells)
        cur_mat = cells{1,i};
        types{1,i} = cur_mat{1};
        concen_B{1,i} = cur_mat{2};
        concen_A{1,i} = cur_mat{length(cur_mat)};
    end
    fprintf('Creating gif for bacteria.\n')
    gifCreate(types,strcat(outputName,'cells.gif'),1);
    fprintf('Creating gif for concentration A.\n')
    gifCreate(concen_A,strcat(outputName,'concen_A.gif'),0);
    fprintf('Creating gif for concentration B.\n')
    gifCreate(concen_B,strcat(outputName,'concen_B.gif'),0);
end

