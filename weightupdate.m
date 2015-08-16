function[woh, whi, whh, dwold_oh, dwold_hi, dwold_hh] = weightupdate(input, hout, woh, whi, whh, dwold_oh, dwold_hi, dwold_hh, delta_oh, delta_hi, numTimeSteps)

a = 0.9; %momentum
learn_hi = 0.001;
learn_oh = 0.05;
learn_hh = 0.001;

dw_hi = 0;
dw_oh = 0;
dw_hh = 0;

for t = 1:numTimeSteps
    
    dw_oh = dw_oh + learn_oh*(delta_oh(:,t))*[hout(:,t);1];
    dw_hi = dw_hi + learn_hi*(delta_hi(:,t))*[input(:,t);1]';
    
    if(t == numTimeSteps)
        dw_hh = 0;
    else
    
        dw_hh = dw_hh + learn_hh*(delta_hi(:,t+1) + delta_oh(:,t))*hout(:,t)';
    end
    
end

dw_oh = dw_oh';
dw_hi = dw_hi;
dw_hh = dw_hh;

woh = woh + dw_oh + a*dwold_oh;
whi = whi + dw_hi + a*dwold_hi;
whh = whh + dw_hh + a*dwold_hh;

dwold_oh = dw_oh;
dwold_hi = dw_hi;
dwold_hh = dw_hh;


end