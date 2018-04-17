%% outHkx
% Read messages out from the Herkulex motor

%% Syntax
%   msg = outHkx(sObject)

%% Description
% msg = outHkx(sObject) returns messages from the Herkulex motor.
% Refer to Herkulex Manual pg44 for packet format and meanings.

%% Input Arguments
% * sObject - serial port object

%% Output Arguments
% * msg - string

%% Function Codes
function msg = outHkx(sObject)
    outArr = [];
    for (i=1:3)
        outArr(i) = fread(sObject,1);
    end
    for(i=4:outArr(3))  % outArr(3) gives the total length of messages returned by the Herkulex motor
        outArr(i) = fread(sObject,1);
    end
    msg = [];
    for (i=1:length(outArr))
        msg = strcat(msg,dec2hex(outArr(i),2));
end
