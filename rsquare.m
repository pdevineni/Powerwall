function [ rsq ] = rsquare(x, y, p)
%% input: data (x, y) points
%%        row vector with the polynomial coefficients

    yfit = p(1) * x + p(2);
    yresid = y - yfit;
    SSresid = sum(yresid.^2);
    SStotal = (length(y)-1) * var(y);
    rsq = 1 - SSresid/SStotal
                
end
