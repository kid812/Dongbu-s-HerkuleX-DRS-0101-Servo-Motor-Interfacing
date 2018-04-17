%% inHkx
% Send the command packet into the Herkulex motor

%% Syntax
%   inHkx(sObject,packet)

%% Description
% inHkx(sObject,packet) sends the command packet to the serial object in
% binary format. 
% 
% 
% * Data Format: A column (rows of depkGen(253, 03, ‘350101’)cimal data), then send to motor using fwrite()
% function

%% Input Arguments
% * sObject - serial port object
% * packet - string

%% Function Codes
function inHkx(sObject,packet)
    col = [];

    % Get two characters each iteration for hex to decimal conversion
    for i = 1:2:(length(packet)-1)  
        hex = strcat(packet(i), packet(i+1));   
        col = vertcat(col, hex2dec(hex));
    end
    
    % Convert the column of decimals into binary and send to the motor
    fwrite(sObject, col);
end