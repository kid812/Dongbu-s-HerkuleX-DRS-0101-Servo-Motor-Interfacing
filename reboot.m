%% reboot
% Reboot the Herkulex motor 

%% Syntax
%   reboot(sObject,pID)
 
%% Description
% reboot(sObject,pID) is used to reboot the Herkulex motor for usage like resetting motor status/
% making changes to EEP

%% Input Arguments 
% * sObject - serial port object
% * pID - integer

%% Function Codes
function reboot(sObject, pID)
    packet = pkGen(pID,09,'');
    inHkx(sObject,packet);
end