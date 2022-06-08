function varargout = SimpleIP(varargin)
% SIMPLEIP M-file for SimpleIP.fig
%      SIMPLEIP, by itself, creates a new SIMPLEIP or raises the existing
%      singleton*.
%
%      H = SIMPLEIP returns the handle to a new SIMPLEIP or the handle to
%      the existing singleton*.
%
%      SIMPLEIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLEIP.M with the given input arguments.
%
%      SIMPLEIP('Property','Value',...) creates a new SIMPLEIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SimpleIP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SimpleIP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SimpleIP

% Last Modified by GUIDE v2.5 30-Mar-2019 02:00:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SimpleIP_OpeningFcn, ...
                   'gui_OutputFcn',  @SimpleIP_OutputFcn, ...
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


% --- Executes just before SimpleIP is made visible.
function SimpleIP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SimpleIP (see VARARGIN)



% Choose default command line output for SimpleIP
handles.output = hObject;

handles.empty = 1;
handles.currentData = handles.empty;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SimpleIP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SimpleIP_OutputFcn(hObject, eventdata, handles) 
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
[a b] = uigetfile('*.*','All Files');
img = imread([b a]);
handles.currentData = img;
imshow(handles.currentData,'Parent',handles.axes1);

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

gambar=handles.currentData;
hasil = imadd(gambar,75);
handles.currentData = hasil;
imshow(hasil,'Parent',handles.axes2);

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar=handles.currentData;
hasil = imsubtract(gambar,75);
handles.currentData = hasil;
imshow(hasil,'Parent',handles.axes2);

% Update handles structure
guidata(hObject, handles);


