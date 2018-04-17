%% getCDiff
% Get the calibrated position difference of the Herkulex motor

%% Syntax
%   CDiff = getCDiff(sObject,pID)

%% Description
% CDiff = getCDiff(sObject, pID) gets the absolute and calibrated position
% of the motor and compute calibrated difference.
% 
% * Formula: Calibrated Difference = Absolute Position - Calibrated Position
% * EEP address for calibrated difference: 0x35(53).

%% Input Arguments 
% * sObject - serial port object
% * pID - integer

%% Output Arguments
% * CDiff - integer

%% Function Codes
function CDiff = getCDiff(sObject, pID)
    % Get absolute position
    Pos = getPos(sObject,pID);
    
    % Get calibrated position
    CPos = getCPos(sObject,pID);
    
    CDiff = Pos - CPos;
end