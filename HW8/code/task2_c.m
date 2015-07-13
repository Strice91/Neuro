close all;

I_THR=0.25;
I_MCL=2.5;

comp_rate = [250, 500, 1000];

druck = logspace(-3.5,0, 1000);

for i = 1:3
    
    kennlinie = comp_dyn(druck,comp_rate(i))*1e+3;

    fig = figure;
    plot(druck,kennlinie);
    hold on;
    plot(druck,ones(size(druck))*I_THR,'g--');
    plot(druck,ones(size(druck))*I_MCL,'r--');
    text(0.15,I_THR+0.1,'I_{THR} = 0.25mA')
    text(0.15,I_MCL+0.1,'I_{MCL} = 2.5mA')
    title(sprintf('Linear c = %i', comp_rate(i)));
    xlabel('Druck in pa');
    ylabel('I in mA');
    grid on;
    xlim([0,0.25]);
    print(fig,'-dpng',sprintf('../tex/img/lin_%i.png', comp_rate(i)))
    

    fig = figure;
    semilogx(druck, kennlinie);
    hold on;
    plot(druck,ones(size(druck))*I_THR,'g--');
    plot(druck,ones(size(druck))*I_MCL,'r--');
    text(0.1,I_THR+0.1,'I_{THR} = 0.25mA')
    text(0.1,I_MCL+0.1,'I_{MCL} = 2.5mA')
    title(sprintf('Logarithmisch c = %i', comp_rate(i)));
    xlabel('Druck in pa');
    ylabel('I in mA');
    grid on;
    xlim([0,1])
    print(fig,'-dpng',sprintf('../tex/img/log_%i.png', comp_rate(i)))
    
end