function varargout = FIterGaussian(varargin)
% FITERGAUSSIAN MATLAB code for FIterGaussian.fig
%      FITERGAUSSIAN, by itself, creates a new FITERGAUSSIAN or raises the existing
%      singleton*.
%
%      H = FITERGAUSSIAN returns the handle to a new FITERGAUSSIAN or the handle to
%      the existing singleton*.
%
%      FITERGAUSSIAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FITERGAUSSIAN.M with the given input arguments.
%
%      FITERGAUSSIAN('Property','Value',...) creates a new FITERGAUSSIAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIterGaussian_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIterGaussian_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIterGaussian

% Last Modified by GUIDE v2.5 08-Jun-2023 21:57:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIterGaussian_OpeningFcn, ...
                   'gui_OutputFcn',  @FIterGaussian_OutputFcn, ...
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


% --- Executes just before FIterGaussian is made visible.
function FIterGaussian_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIterGaussian (see VARARGIN)

% Choose default command line output for FIterGaussian
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIterGaussian wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIterGaussian_OutputFcn(hObject, eventdata, handles) 
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

[filename path] = uigetfile({'*.jpg';}, 'buka gambar');
if isequal(filename,0)
    return;
end
str=strcat(path,filename);

eval('im_input=imread(str);')
axes(handles.axes1);
imshow(im_input);

handles.Img=im_input;

guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img=handles.Img;
gray=rgb2gray(img);


handles.Img=gray;


axes(handles.axes2), imshow(gray)
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.Img;

gaussian = imgaussfilt(img,2);

axes(handles.axes3), imshow(gaussian)
