function plotTotNutrient(cells)
% Type A = 0
% Type B = 1
    nutrientA = zeros(1,length(cells));
    nutrientB = zeros(1,length(cells));
    for i=1:length(cells)
        fprintf('Working on %d.\n',i)
        nutrientA(1,i) = sum(sum(cells{1,i}{3,1}));
        nutrientB(1,i) = sum(sum(cells{1,i}{2,1}));
    end
    time = 1:length(cells);
    figure
    hold on
    plot(time,nutrientA,'.-')
    plot(time,nutrientB,'.-')
    legend('Nutrient A','Nutrient B','Location','southeast' )
    title('Nutrient growth')
    hold off
end


