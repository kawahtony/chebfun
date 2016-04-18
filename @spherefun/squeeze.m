function varargout = squeeze(varargin)
%SQUEEZE   Squeeze a SPHEREFUN to one variable, if possible.
%   G = squeeze(F) returns a SPHEREFUN if F depends on x and y. If F 
%   depends only on the x-variable a row CHEBFUN is returned and if it 
%   depends on just the y-variable a column CHEBFUN is returned.

% Copyright 2015 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

    [varargout{1:nargout}] = squeeze@separableApprox(varargin{:});
end
