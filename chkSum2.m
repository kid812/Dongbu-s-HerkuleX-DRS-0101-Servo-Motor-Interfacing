%% chkSum2
% Compute CheckSum2 for the Herkulex command packet

%% Syntax
%   c2 = chkSum2(c1)

%% Description
% c2 = chkSum2(c1) returns the CheckSum2 of the c1(CheckSum1).
%
% * CheckSum2 formula: (~CheckSum1)&0xFE

%% Input Arguments
% * c1 - string

%% Output Arguments
% * c2 - string

%% Function Code
function c2 = chkSum2(c1)
    temp = bitcmp(hex2dec(c1), 'uint8');   % Perform bitwise NOT operation '~'
    temp = bitand(temp, hex2dec('FE'));
    c2 = dec2hex(temp,2);
end