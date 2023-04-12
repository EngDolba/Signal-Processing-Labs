function a = IIR_filt(x)
a = filter([1-0.995],[1 -2*0.995*cos(-2.4709) 0.995*0.995],x);