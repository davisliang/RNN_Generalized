%% RNN
function [] = RNNmain()
Err = 0;
Error = [];

input = [1,0,0,1,0,0,1,0,0,1];
target = [0,0,1,0,0,1,0,0,1,0];


numTimeSteps = 5;
dwold_oh = 0;
dwold_hi = 0;
dwold_hh = 0;


[whi, woh, whh] = initializeNetwork(input, target);

n = 0;


while(n <6000)
    E = 0;
    for i = 1:(size(input,2)-numTimeSteps)
        display('####################');
        inp = input(i:i+numTimeSteps-1);
        targ = target(i:i+numTimeSteps-1)
    
        [hout, out] = feedforward(whi, woh, whh, inp, numTimeSteps);
        [whi, woh, whh, delta_oh, delta_hi] = backpropthroughtime(whi, woh, whh, inp, hout, out, targ, numTimeSteps);
        [woh, whi, whh, dwold_oh, dwold_hi, dwold_hh] = weightupdate(inp, hout, woh, whi, whh, dwold_oh, dwold_hi, dwold_hh, delta_oh, delta_hi, numTimeSteps);
        
        out
        E = E + 0.5*sum(abs(targ-out))^2;       
        
        display('####################');
    end
    Error = [Error, E];
    n = n+1;
end

plot(Error);
    
    %% next, we begin our feed forward
