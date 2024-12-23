function varargout = DIPproject(varargin)
% DIPproject MATLAB code for DIPproject.fig
%      DIPproject, by itself, creates a new DIPproject or raises the existing
%      singleton*.
%
%      H = DIPproject returns the handle to a new DIPproject or the handle to
%      the existing singleton*.
%
%      DIPproject('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIPproject.M with the given input arguments.
%
%      DIPproject('Property','Value',...) creates a new DIPproject or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIPproject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIPproject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIPproject

% Last Modified by GUIDE v2.5 14-Jan-2024 17:56:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIPproject_OpeningFcn, ...
                   'gui_OutputFcn',  @DIPproject_OutputFcn, ...
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


% --- Executes just before DIPproject is made visible.
function DIPproject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIPproject (see VARARGIN)

% Choose default command line output for DIPproject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIPproject wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIPproject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Load image
global im
im=imread("baby1.jpeg")
axes(handles.axes2);
imshow(im);


function pushbutton2_Callback(hObject, eventdata, handles)
% reset
global im
imshow(im);

function pushbutton3_Callback(hObject, eventdata, handles)
% Black and White
global im gs
avg = mean(gs(:));
[r c]=size(gs);
bw = zeros(r,c);
bw(gs<=avg)=0;
bw(gs>avg)=255;
axes(handles.axes4);
imshow(bw);

function pushbutton4_Callback(hObject, eventdata, handles)
% gray scale 
global im gs
gs=rgb2gray(im);
axes(handles.axes4);
imshow(gs);

% ---Histogram of RGB
function pushbutton5_Callback(hObject, eventdata, handles)
global im 
axes(handles.axes4);
imhist(im);


% ---Histogram of Grayscale image
function pushbutton6_Callback(hObject, eventdata, handles)
global gs 
axes(handles.axes4);
imhist(gs);

% --- Green to Violet
function pushbutton7_Callback(hObject, eventdata, handles)
global im

%%converting from RGB model to HSV model
IHSV=rgb2hsv(im);

Hue=IHSV(:,:,1);

Hue(Hue<=0.4583 & Hue>=0.2083)=0.75;  %for green to Violet
IHSV(:,:,1)=Hue;

imgproc=hsv2rgb(IHSV);
axes(handles.axes4);
imshow(imgproc);


% --- Red TO YELLOW color conversion
function pushbutton8_Callback(hObject, eventdata, handles)
global im 

%%converting from RGB model to HSV model
IHSV=rgb2hsv(im);

Hue=IHSV(:,:,1);

Hue(Hue<=0.166)=0.166; %for converting red part in yellow
IHSV(:,:,1)=Hue;

imgproc=hsv2rgb(IHSV);
axes(handles.axes4);
imshow(imgproc);

% --- Blue to Green color conversion
function pushbutton9_Callback(hObject, eventdata, handles)
global im

%%converting from RGB model to HSV model
IHSV=rgb2hsv(im);

Hue=IHSV(:,:,1);

Hue(Hue<=0.4583 & Hue>=0.2083)=0.75;  %for green to Violet
IHSV(:,:,1)=Hue;

imgproc=hsv2rgb(IHSV);
axes(handles.axes4);
imshow(imgproc);

% --- Blue image
function pushbutton10_Callback(hObject, eventdata, handles)
global im 

%%converting from RGB model to HSV model
IHSV=rgb2hsv(im);

Hue=IHSV(:,:,1);

Hue(Hue<=0.208 & Hue>=0.125)=0.5;  %for converting yellow part in cyan
IHSV(:,:,1)=Hue;

imgproc=hsv2rgb(IHSV);
axes(handles.axes4);
imshow(imgproc);

% --- Salt and Pepper noise
function pushbutton11_Callback(hObject, eventdata, handles)
global im
sp =imnoise(im,'salt & pepper');
axes(handles.axes4);
imshow(sp);


% --- Weightage average filtering
function pushbutton12_Callback(hObject, eventdata, handles)
global gs 

filt2=[1 8 1; 8 16 8; 1 8 1];
filt2=(1/52)*filt2;

img2=conv2(gs,filt2,'same');
img2=uint8(img2);

axes(handles.axes4);
imshow(img2);

% --- Gausian filter
function pushbutton13_Callback(hObject, eventdata, handles)
global im 
noise = imnoise(im , 'gaussian');
axes(handles.axes4);
imshow(noise);


% --- 3x3 filter
function pushbutton14_Callback(hObject, eventdata, handles)
global im 
h = fspecial('motion', 50, 45);
im2 = imfilter(im, h, 'conv', 'replicate');
axes(handles.axes4);
imshow(im2);


% --- Quantization
function pushbutton15_Callback(hObject, eventdata, handles)
global im gs 
quat = imresize(gs, [600 800]);
mn = mean(quat(:));

lev01=(mn/2);
lev02=mn;
lev03=lev02+lev01;
lev04=(2*mn);
[r c]=size(quat);
quat2=zeros(r,c);

quat2((quat>0) & (quat<lev01))=63;
quat2((quat>lev01)&(quat<lev02))=127;
quat2((quat>lev02)&(quat<lev03))=191;
quat2((quat>lev03)&(quat<lev04))=255;
quat2=uint8(quat2);
axes(handles.axes4);
imshow(quat2);

% --- Enhancement.
function pushbutton16_Callback(hObject, eventdata, handles)
global im gs 
quat = imresize(gs, [600 800]);

% Image Enhancement using Histogram Equalization
quat2 = histeq(quat);

axes(handles.axes4);
imshow(quat2);


% --- Exit
function pushbutton17_Callback(hObject, eventdata, handles)
msgbox('Thank you for using this tool!');
pause(1);
close();
close();


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
global im
im=imread("crayon.jpeg")
axes(handles.axes2);
imshow(im);


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
