function branches = getNumBranches(a)
    % Find colony coordinates
    [x,y] = find(a~=0);
    % Check boundary
    k = boundary(x,y,1);
    % Display matrix
%     figure(2)
%     hold on
%     imagesc(a)
%     plot(y(k),x(k),'r','LineWidth',3)
%     hold off
    % Obtain the value of boundary points
    x = x(k);
    y = y(k);
    idx = sub2ind(size(a),x,y);
    b = a(idx);
    % Treat boundary value as signal
    % Plot the signal
%     x = 1:numel(b);
%     figure(1)
%     plot(x,b, 'LineWidth',3)
    % Find the change in signal
    bdyGrad = nonzeros(gradient(b));
    numIncrease = numel(bdyGrad(bdyGrad > 0)) / 2;
    numDecrease = numel(bdyGrad(bdyGrad < 0)) / 2;
    branches = numDecrease + numIncrease;
end

