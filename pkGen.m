%% pkGen
% Generate a formatted command packet for the Herkulex motor input

%% Syntax
%   packet = pkGen(pID,CMD,data)

%% Description
% packet = pkGen(pID,CMD,data) returns the preferable formatted commmand
% packet.
%
% * pID: motor ID
% * CMD: '0X' (EEPW 01, EEPR 02, RAMW 03, RAMR 04, IJOG 05, SJOG 06, 
%             STAT 07, ROLLBACK 08, REBOOT 09)
% * Data in "Address-Length-Arguments" format, data: Data[0], Data[1], ..., Data[n]. Eg, '350101'
%
% Refer to Herkulex Manual pg44 for packet format.

%% Input Arguments
% * pID - integer
% * CMD - string
% * data - string

%% Output Arguments
% * packet - string

%% Function Codes
function packet = pkGen(pID,CMD,data)
    header = 'FFFF';
    packetSize = dec2hex(length(data)/2+7, 2);  % (Length of data) adding to default 7 bytes of packet elements  
    inString = strcat(packetSize,dec2hex(pID,2),num2str(CMD,'%.2x'),data);
    c1 = chkSum1(inString);
    c2 = chkSum2(c1);
    packet = strcat(header,inString(1:6),c1,c2,inString(7:end));
end