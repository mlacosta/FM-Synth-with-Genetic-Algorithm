function y = stmon(x);
%convierte de stereo a mono.

y = (x(:,1)+x(:,2))/2;