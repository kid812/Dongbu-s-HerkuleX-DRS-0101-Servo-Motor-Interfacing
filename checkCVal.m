%% checkCVal
% Check for correct input values

%% Syntax
%   checkCVal(sObject,pID,CVal,varargin)

%% Description
% checkCVal(sObject,pID,CVal,varargin) checks the input values and retuens
% validity of the input values. Note: Middle motor have smaller input value
% range due to its bracket.
%

%% Input Arguments
% * sObject - serial port object
% * pID - integer
% * CVal - integer
% * varargin - integer

%% Function Codes
function checkCVal(sObject, pID, CVal, varargin)
    CDiff = getCDiff(sObject,pID);
    
    % Default: Normal range checking if only 3 arguments
    if nargin == 3    
        % Absolute value range (19~1002)
        minVal = 19-CDiff;
        maxVal = 1002-CDiff;
        
        %CVal+CDiff = Abs Value
        if (19>(CVal+CDiff) || (CVal+CDiff)>1002)   
           error('Value of %d out of operational range! Range:%d~%d',pID,minVal,maxVal);
        end
        
    % Special case: Check middle motor specifically due to smaller range (middle bracket)
    else
        % Absolute value range (105~834)
        minVal = 105-CDiff;
        maxVal = 834-CDiff;
        if (105>(CVal+CDiff) || (CVal+CDiff)>834)   
            error('Value of %d out of operational range! Range:%d~%d',pID,minVal,maxVal);
        end 
    end
end