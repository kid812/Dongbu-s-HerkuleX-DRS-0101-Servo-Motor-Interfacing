%% sOpen
% Establish and initalize connection with the serial port.

%% Syntax
%   sOpen()

%% Description
% sOpen() setups a seial port object 'sObject' for communications via the
% serial port.

%% Procedure Codes

% Create serial port object with the specified port
sObject = serial('COM3');

% Set baudrate
sObject.BaudRate = 57600;

% Establish the connection
fopen(sObject);

% Enable torque of all motors (broadcast) in the network
torqueOn(sObject,254);