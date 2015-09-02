
function [slope, Rsquared] = powerwall(x)

if (nargin < 1)
   sprintf "Format - powerwall(x)";
end

x = sort(nonzeros(x));
[ux, freqx] = count_unique(x);

% Compute PDF
j = 0;
    for i = 1 : length(ux)    
        xaxis(i) = log(ux(i));
        pdfxmarginal(i) = freqx(i)/sum(freqx);
    end
    
% Compute CDF 
myCdfcnt = cumsum(pdfxmarginal);

% Compute Odds Ratio
total = myCdfcnt(length(myCdfcnt));
myCdf = myCdfcnt(1:length(myCdfcnt)-1);
myYaxis = -log(1./myCdf-1);
myXaxis = xaxis(1:length(xaxis)-1);

% Plot OddsRatio data
plot(myXaxis, myYaxis, 'r.', 'MarkerSize', 10);
hold on 

% Fit log-logistic OddsRatio
p = polyfit(myXaxis, myYaxis, 1);
fitted = polyval(p, myXaxis);
plot(myXaxis, fitted, 'b-', 'LineWidth', 2);

xlabel('log(x)');
ylabel('log(odds)');
title('Odds Ratio of x with Log-logistic fit');
hold off 

% computing R^2
rsq = rsquare(myXaxis, myYaxis, p);

mu = -p(2)/p(1);
s  = 1/p(1);

slope = 1/s;
Rsquared = rsq;
end 
