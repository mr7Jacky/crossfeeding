%% Check current set
load('ns.mat');
load('ne.mat');

fprintf(['Total number of data: %d\n'...
    'Number of spiral pattern: %d\n' ...
    'Number of engulf pattern: %d\n'...
    'Ratio is (spiral / engulf): %d\n'], ...
    (num_spiral + num_engulf), num_spiral ,num_engulf, num_spiral/num_engulf)
%% Clear data
% num_spiral = 0;
% num_engulf = 0;
% save('ns.mat', 'num_spiral');
% save('ne.mat', 'num_engulf');
%% Dataset
data = dir('dataset/');
Patterns = cell(1,1);
count = 1;
for i = 1:numel(data)
    cur = data(i);
    if cur.isdir == 0
        fname = [cur.folder,'/',cur.name]
        load(fname);
        Patterns{1,count} = a;
        count = count + 1;
    end
end
save('Patterns_0_1028.mat', 'Patterns', '-v7.3');
%% Adjust
adj = 1;
num_engulf = num_engulf + adj;
num_spiral = num_spiral - adj;
save('ns.mat', 'num_spiral');
save('ne.mat', 'num_engulf');
%% Detect Spiral 

dataDir = 'data/';
files = dir(dataDir);
load('ns.mat');
load('ne.mat');
for i = 1:numel(files)
    cur = files(i);
    if cur.isdir == 0
        fname = [cur.folder,'/',cur.name];
        a = dlmread(fname);
        k = isSpiral(a);
        mfname = ['dataset/',num2str(num_spiral + num_engulf),'.mat'];
        save(mfname,'a');
%         fprintf('%s : %d\n', cur.name, isSpiral(a))
        if k
            num_spiral = num_spiral + 1;
            m = floor(i/9) + 1;
            figure(m)
            n = mod(i,9)+1;
            subplot(3,3,n)
            imagesc(a);
        else
            num_engulf = num_engulf + 1;
        end
    end
end
save('ns.mat', 'num_spiral');
save('ne.mat', 'num_engulf');


