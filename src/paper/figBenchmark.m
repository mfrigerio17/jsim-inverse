function h_f = figBenchmark(x, dur)

linestyle = 'o-';
fontsize = 12;

fsize = [560 300];
ar = fsize(1) / fsize(2);  % width / height

h_f = figure('position', [300 200 fsize(1,:)],...
             'paperunits','centimeters',...
             'papersize', [ar*5 5],...
             'paperposition', [0 0 ar*5 5]);


plot(x, dur.plain, linestyle, x, dur.LT, linestyle, x, dur.new, linestyle);
xlabel('DoFs'    , 'fontsize', fontsize);
ylabel('Time [s]', 'fontsize', fontsize);
grid on;


maximum = max([max(dur.plain), max(dur.LT), max(dur.new)]);
ylim([-0.05 maximum*1.05]);


h_leg = legend(gca, {'Plain', 'LTL', 'New'}, 'location', 'northwest');
set(h_leg, 'fontsize', 10);
% Manually fix the legend, which does not resize properly, in the PDF, according
% to the larger font size...
lpos = get(h_leg,'position');
h = lpos(4);
lpos(4) = h*1.6;
lpos(2) = lpos(2) - h*0.6;
lpos(1) = lpos(1)*1.05;
lpos(3) = lpos(3)*2;
set(h_leg,'position', lpos);

end


