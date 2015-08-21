
function[whi, woh, whh] = initializeNetwork(input, targ)

inlen = size(input,1);
numhid = 20;
targlen = size(targ,1);

whi = 2*rand(numhid, inlen + 1)-1;  %input(t) to hidden(t)
woh = 2*rand(targlen, numhid + 1)-1; %hidden(t) to output(t)
whh = 2*rand(numhid, numhid)-1; %hidden(t) to hidden(t+1)

end