function img = createNote(row,col,color,text)
    mat = zeros(row,col);
    position = [floor(row/4) floor(row*3/4); floor(col/2) col];
    mat = mat + color;
    [mat,~] = gray2ind(mat);
    mat = ind2rgb(mat,jet(150));
    img = image(mat);
    img = insertText(img.CData,position,text,'AnchorPoint','LeftBottom','FontSize',20);
end

