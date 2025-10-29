function dout =  boxcox_mooc(din, lambda)

dout = zeros(size(din));

if lambda == 0
    for i = 1:size(din,1)
        dout(i,1) = log(din(i,1));
    end
elseif lambda ~= 0

    for i = 1:size(din,1)
        dout(i,1) = (din(i,1).^(lambda) - 1) / lambda;
    end
end

end