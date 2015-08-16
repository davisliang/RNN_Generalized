function [out] = sigmoid(net)
    out = 1./(1+exp(-net));
end