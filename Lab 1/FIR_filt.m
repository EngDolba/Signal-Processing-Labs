function a = FIR_filt(x)
a = filter([1 -2*cos(-0.345) 1],1,x);
end