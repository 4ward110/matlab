% function [ output_args ] = fibonaci( n, v )
%     if nargin==1
%         v = fibonaci(n-1,[0,1]);
%     elseif n>1
%         v = fibonaci(n-1,[v,v(end-1)+v(end)]);
%     end
% end

