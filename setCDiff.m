%% Set CDiff
% Set the calibrated position difference of the Herkulex motor

%% Syntax
%   setCDiff(sObject,pID,val)

%% Description
% setCDiff(sObject, pID,val) sets the calibrated difference value in the EEP. 
% Changes will only takes into effect after a reboot command.
%
% * Formula: Calibrated Difference = Absolute Position - Calibrated Position
% * EEP address for calibrated difference: 0x35(53).

%% Input Arguments 
% * sObject - serial port object
% * pID - integer
% * val - integer

%% Function Codes
function setCDiff(sObject, pID, val)
    addr = '35'; % EEP Addr: 0x35(53)
    val = dec2hex(val,2);
    data = strcat(addr,'01',val);   % Write 1 byte data
    packet = pkGen(pID,01,data);
    inHkx(sObject, packet);
    
    % Reboot to refresh EEP
    reboot(sObject, pID);   
    pause(1);   % Wait for reboot
    
    % Confirm changes by reading the value from the EEP
    CDiff = getCDiff(sObject, pID);
    fprintf('Calibrated Difference = %d\n', CDiff);
end