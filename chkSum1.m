%% chkSum1
% Compute the CheckSum1 for the Herkulex command packet

%% Syntax
%   c1 = chkSum1(inString)

%% Description
% c1 = chkSum1(inString) returns the CheckSum1 of the input hex-string.
%
% * CheckSum1 formula: (PacketSize ^ pID ^ CMD ^ Data[0] ^ Data[1] ^ ... ^
% Data[n])&0xFE
% 

%% Input Arguments 
% * inString - string of the hexadecimal characters representing different
% elements of the command packet
%
% Hex string elements: PacketSize, pID, CMD, Data[0], ..., Data[n].

%% Output Arguments
% * c1 - string

%% Function Codes
function c1 = chkSum1(inString)
    col = [];
    for i = 1:2:(length(inString)-1)
        hex = strcat(inString(i), inString(i+1)); % Get first two characters for hex
        col = vertcat(col, hex2dec(hex));
    end
    temp = col(1);
    for j = 2:length(col)
        temp = bitxor(temp, col(j));
    end
    temp = bitand(temp, hex2dec('FE'));
    c1 = dec2hex(temp,2);
end