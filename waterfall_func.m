function h = waterfall_func(varargin)


if nargin < 1
    error('Not enough input arguments.');
elseif nargin > 4
    error('Too many input arguments.');
end

if nargin == 1
    z = varargin{1};
    c = z;
    x = 1:size(z,2);
    y = 1:size(z,1);
elseif nargin == 2
    z = varargin{1};
    c = varargin{2};
    x = 1:size(z,2);
    y = 1:size(z,1);
elseif nargin == 3
    [x,y,z] = varargin{1:3};
    c = z;
elseif nargin == 4
    [x,y,z,c] = varargin{1:4};
end
if min(size(x)) == 1 || min(size(y)) == 1
    [x,y] = meshgrid(x,y);
end

% Center traces around zero
z_centered = z-nanmean(z,2);

% Offset traces from zero based on y
z_offset = z_centered+y;

% Create the plot
hp = plot(x(1,:),z_offset, 'color', 'b', 'linewidth', 2);
yticks(y(:,1))

% Return handles, if requested
if nargout > 0
    h = hp;
end
end