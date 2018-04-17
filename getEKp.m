%% getEKp
% Get the Proportional Gain (Kp) in EEP of the Herkulex motor

%% Syntax
%   EKp = getEKp(sObject,pID)

%% Description
% EKp = getEKp(sObject,pID) gets the Proportional Gain (Kp) in the EEPROM. 
% 
% * EEP address for Kp: 0x35(53).
%
% Refer to Herkulex Manual pg28 for EEP map of gains.

%% Input Arguments 
% * sObject - serial port object
% * pID - integer

%% Output Arguments
% * EKp - integer

%% Function Codes
function EKp = getEKp(sObject, pID)
    packet = pkGen(pID,02,'1E02'); % EEP Addr: 0x1E(30), read 2 bytes data
    inHkx(sObject,packet);
    msg = outHkx(sObject);
    EKp = hex2dec(strcat(msg(21:22),msg(19:20))); % Bytes in reverse order by Little Endian Rule
end