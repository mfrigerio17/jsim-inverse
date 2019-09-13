function handles = figAccuracy(x, err)

% Figure size
fsize = [560 250];
ar    = fsize(1) / fsize(2);  % width / height Aspect Ratio

% Paper size, for PDF export
pHeight = 4;
pWidth  = pHeight * ar;
pSize   = [pWidth pHeight];


linestyle = 'o-';
fontsize  = 12;

for i = [1,2]
    handles(i) = figure('position', [300 200 fsize(1,:)],...
                 'paperunits','centimeters',...
                 'papersize', pSize,...
                 'paperposition', [0 0 pSize]  );

    plot(x, err(i).plain, linestyle, ...
         x, err(i).LT   , linestyle, ...
         x, err(i).new  , linestyle  );

    yt = yticks;
    text(24, (yt(end)+yt(end-1))/2, ['Tapering=' num2str(err(i).taper)], 'fontsize', 10);
    ylabel('Error', 'fontsize', fontsize);
    grid on;
end


xlabel('DoFs' , 'fontsize', fontsize);
h_leg = legend(gca, {'Plain', 'LTL', 'New'}, 'location', 'northwest');
set(h_leg, 'fontsize', 10);

% Manually fix the legend, which does not resize properly, in the PDF, according
% to the larger font size...
lpos = get(h_leg,'position');
h = lpos(4);
lpos(4) = h*1.6;
lpos(2) = lpos(2) - h*0.6;
lpos(1) = lpos(1)*1.5;
lpos(3) = lpos(3)*2;
set(h_leg,'position', lpos);

end


