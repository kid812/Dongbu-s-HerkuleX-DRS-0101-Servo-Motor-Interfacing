%% torqueOn
% Enable torque for the Herkulex motor. 

%% Syntax
%   torqueOn(sObject,pID)

%% Description
% torqueOn(sObject,pID) turn on the torque for the Herkulex motor. Torque has to be enabled first to
% control the motor's position. 
%
% * RAM register for torque: 0x34(52).

%% Input Arguments
% * sObject - serial port object
% * pID - integer

%% Function Codes
function torqueOn(sObject,pID)
    packet = pkGen(pID,03,'340160'); % 0x60: Torque on
    inHkx(sObject,packet);
    
    % Verify torque status
    torqueStat(sObject, pID);
end