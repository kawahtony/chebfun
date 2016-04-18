function varargout = ctranspose(varargin)
%'	 Complex conjugate transpose of a SPHEREFUN.
%   F' is the complex conjugate transpose of F.
%   G = CTRANSPOSE(F) is called for the syntax F'.  
%
% See also CONJ, TRANSPOSE.

% Copyright 2015 by The University of Oxford and The Chebfun Developers.
% See http://www.chebfun.org/ for Chebfun information.

    [varargout{1:nargout}] = ctranspose@separableApprox(varargin{:});
end
