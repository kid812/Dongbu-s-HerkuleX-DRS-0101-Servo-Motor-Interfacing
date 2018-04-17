%% torqueFree
% Disable torque for the Herkulex motor

%% Syntax
%   torqueFree(sObject,pID)

%% Description
% torqueFree(sObject,pID) frees the torque of the Herkulex motor.
% 
% * RAM address for torque: 0x34(52).

%% Input Arguments 
% * sObject - serial port object
% * pID - integer

%% Function Codes
function torqueFree(sObject,pID)
    packet = pkGen(pID,03,'340100'); % 0x00: Torque free
    inHkx(sObject,packet);
    
    % Verify torque status
    torqueStat(sObject, pID);
end