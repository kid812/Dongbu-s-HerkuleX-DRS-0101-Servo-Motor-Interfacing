%% movtoCAng
% Move the Herkulex motor to the desired angle

%% Syntax
%   movtoCAng(sObject,pID,CAng, varargin)

%% Description
% movtoCAng(sObject,pID,ang) moves the Herkulex motor to the desired
% angle. Note that the angle provided is the calibrated angle.
%
% * This function is intended for single motor control only.
% * Default playtime value: 60 (60*11.2ms = 672ms)
% * greenLED is on during process to show non-error status.

%% Input Arguments
% * sObject - serial port object
% * pID - integer
% * CAng - double
% * varargin - integer

%% Function Codes
function movtoCAng(sObject, pID, CAng, varargin)

    % Setting default playtime
    if nargin == 3
        playtime = 672/11.2;    % Default playtime value 672ms/11.2ms = 60
        pTime = dec2hex(int64(playtime),2); % Convert value to hex for packet
    elseif nargin == 4
        V = cell2mat(varargin);  % Convert varargin into number
        playtime = V/11.2;  % Convert into value
        pTime = dec2hex(int64(playtime),2);
    else
        error('Please input only 3 to 4 arguments!');
    end
    
    % Convert value into angle
    CVal = fix(512+(CAng/0.325)); 
    
    % Check input value
    checkCVal(sObject,pID,CVal);
    
    % Convert values into hex for packet
    % Byte in reverse order by Little Endian Order
    pos = dec2hex(CVal,4);
    pos = strcat(pos(3:4),pos(1:2));   
    
    % Construct packet
    data = strcat([pTime,pos,'04',dec2hex(pID,2)]); % 0x04 for green LED
    packet = pkGen(pID,06,data);    % CMD = 0x06 (S_Jog)
    inHkx(sObject, packet);
    
    % Wait for the operation to complete
    pause(1);   
    
    % Confirm end position
    CPos = getCPos(sObject,pID);
    CAng = fix((CPos-512)*0.325);
    fprintf('Moved to calibrated angle %d\n', CAng);
end