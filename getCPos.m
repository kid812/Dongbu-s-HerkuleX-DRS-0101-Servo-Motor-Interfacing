%% getCPos
% Get the calibrated position of the Herkulex motor

%% Syntax
%   CPos = getCPos(sObject,pID)

%% Description
% CPos = getCPos(sObject,pID) gets the calibrated position of the Herkulex
% motor.
% 
% * Formula: Calibrated Position = Absolute Position - Calibrated
% Difference
% * RAM register for calibrated position: 0x3A(58)

%% Input Arguments
% * sObject - serial port object
% * pID - integer 

%% Output Arguments
% * CPos - integer

%% Function Codes
function CPos = getCPos(sObject,pID)  
    packet = pkGen(pID,04,'3A02'); % Calibrated position addr: 0x3A(58), read 2 bytes data
    inHkx(sObject,packet);
    msg = outHkx(sObject);
    
    % Byte in reverse order by Little Endian Order
    % Position details are in 10 bits (refer to Herkulex Manual pg25)
    tempPos = hexToBinaryVector(strcat(msg(21:22),msg(19:20)),16);  
    CPos = bi2de(tempPos(7:16),'left-msb');  
end
