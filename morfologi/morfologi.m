function varargout = morfologi(varargin)
% MORFOLOGI MATLAB code for morfologi.fig
%      MORFOLOGI, by itself, creates a new MORFOLOGI or raises the existing
%      singleton*.
%
%      H = MORFOLOGI returns the handle to a new MORFOLOGI or the handle to
%      the existing singleton*.
%
%      MORFOLOGI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORFOLOGI.M with the given input arguments.
%
%      MORFOLOGI('Property','Value',...) creates a new MORFOLOGI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before morfologi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to morfologi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help morfologi

% Last Modified by GUIDE v2.5 17-Jun-2023 14:24:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @morfologi_OpeningFcn, ...
                   'gui_OutputFcn',  @morfologi_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before morfologi is made visible.
function morfologi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to morfologi (see VARARGIN)

% Choose default command line output for morfologi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes morfologi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = morfologi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global gambar;
[filename,pathname]=uigetfile({'*.png'});
if ~isequal(filename, 0)
    gambar = imread(fullfile(pathname,filename));
    guidata(hObject,handles);
    axes(handles.axes1);
    imshow(gambar);
    
else
    return;
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- fungsi grayscale
global gambar;
global gray;
gray = rgb2gray(gambar);
axes(handles.axes2);
imshow(gray);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- fungsi closing
global gray;
se=strel('disk',10);
close=imclose(gray,se);
axes(handles.axes3);
imshow(close);
