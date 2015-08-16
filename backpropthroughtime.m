function [whi, woh, whh, delta_oh, delta_hi] = backpropthroughtime(whi, woh, whh, input, hout, out, targ, numTimeSteps)

d_net_hid = hout.*(1-hout);
d_net_out = out.*(1-out);


%calculate the deltas from the top down
for t = 1:numTimeSteps;   
    time = numTimeSteps-t+1;
    
    delta_oh(:,time) = (targ(:,time)-out(:,time))*d_net_out(:,time)';
    
    if(time == numTimeSteps) %first iteration wherein you have no feedback
        delta_hi(:,time) = sum(delta_oh(time)*woh(:,1:(size(woh,2)-1)))*d_net_hid(:,time);
    else 
        delta_hi(:,time) = (sum(delta_oh(time)*woh(:,1:(size(woh,2)-1)))+sum(whh*delta_hi(:,time+1)))*d_net_hid(:,time);
    end
end
