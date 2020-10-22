b = zeros(1500,1500);
[b,~] = gray2ind(b);
b = ind2rgb(b,jet(150));
image(b)
hold on
type1 = [1 1; 1 1];
[type1,~] = gray2ind(type1);
type1 = ind2rgb(type1,jet(150));
image([50 100], [75 100], type1)

type2 = [2 2; 2 2];
[type2,~] = gray2ind(type2);
type2 = ind2rgb(type2,jet(150));
im = image([50 100], [150 175], type2);

insertText(im, [100 315 ], 'Peppers are good for you!');
insertText(im, [100 315 ], 'Peppers are good for you!');
hold off