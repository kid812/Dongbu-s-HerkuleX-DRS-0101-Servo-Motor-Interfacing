%% setEKp
% Set the EEP proportional gain

%% Syntax
%   setEKp(pID,val)

%% Description
% setEKp(pID,val) sets the proportional gain of Herkulex motor in EEPROM. Changes will
% only takes into effect after a reboot command.
% 
% * EEP address for Kp: 0x1E(30), Kd: 0x20(32), Ki: 0x22(34)
% 
% Refer to Herkulex Manual pg28 for EEP map of gains.

%% Input Arguments
% * pID - string
% * val - integer

%% Function Codes
function setEKp(pID, val)
    addr = '1E'; % Addr of Kp: 0x1E(30)
    val = dec2hex(val,4);
    data = strcat(addr,'02',val(3:4),val(1:2)); % Byte input in reverse order by Little Endian rule
    packet = pkGen(pID,01,data);
    inHkx(sObject, packet);
    
    % Reboot to refresh EEP
    reboot(sObject, pID);   
    pause(1);   % Wait for reboot
    
    % Confirm changes by reading the value from the EEP
    EKp = getEKp(sObject, pID);
    fprintf('Proportional Gain = %d\n', EKp);
end