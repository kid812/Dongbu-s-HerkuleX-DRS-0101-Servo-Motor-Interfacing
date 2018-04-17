%% torqueStat
% Display the torque status of Herkulex motor

%% Syntax
%   torqueStat(sObject,pID)

%% Description
% Display the torque status of the specified Herkulex motor.
% 
% * RAM address for torque: 0x34(52).
% * Torque status: Torque on(0x60), Break on(0x40), Torque free (0x00).

%% Input Arguments
% * sObject - serial port object

%% Output Arguments
% * pID - integer

%% Function Codes
function torqueStat(sObject,pID)
    packet = pkGen(pID,04,'3401'); % Addr: 0x34(52), read 1 byte data
    inHkx(sObject,packet);
    msg = outHkx(sObject); 
    
    % Interpret torque status
    if strcmp(msg(19:20),'60')
        fprintf('Torque status: Torque on for motor %d\n', pID);
    elseif strcmp(msg(19:20),'40')
        fprintf('Torque status: Break on for motor %d\n', pID);
    else
        fprintf('Torque status: Torque free for motor %d\n', pID);
    end
end
