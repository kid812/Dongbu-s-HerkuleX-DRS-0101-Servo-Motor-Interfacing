%% sClose
% Disconnect the serial communication with the Herkulex motor

%% Syntax
%   sClose()

%% Description
% sClose closes the connection with the serial port and delete the
% serial port object 'sObject'.

%% Procedure Codes

% Free torque of all motors (broadcast) in the network
torqueFree(sObject, 254);

% Close the connection
fclose(sObject);

% Delete the serial port object
delete(sObject);
clear sObject;

