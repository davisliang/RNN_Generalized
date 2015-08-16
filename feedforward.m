function [hout, out] = feedforward(whi, woh, whh, input, numTimeSteps)

numSamples = size(input,2);

targlen = size(woh,1);
numhid = size(whi,1);

hout = zeros(numhid, numTimeSteps);
out = zeros(targlen,numTimeSteps);

prevTime = 0;


for n = 1:numTimeSteps          
    if n>1
        prevTime =  whh*[hout(:,n-1)];
    end            
            
    net = whi*[input(:,n);1] + prevTime;
    hout(:,n) = sigmoid(net);
    out(:,n) = sigmoid(woh*[hout(:,n);1]);%each column is a time step

end



        
        
 