function varargout = trace(varargin)
% TRACE MATLAB code for trace.fig
%      TRACE, by itself, creates a new TRACE or raises the existing
%      singleton*.
%
%      H = TRACE returns the handle to a new TRACE or the handle to
%      the existing singleton*.
%
%      TRACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRACE.M with the given input arguments.
%
%      TRACE('Property','Value',...) creates a new TRACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trace_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trace_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trace

% Last Modified by GUIDE v2.5 27-Sep-2019 16:22:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trace_OpeningFcn, ...
                   'gui_OutputFcn',  @trace_OutputFcn, ...
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


% --- Executes just before trace is made visible.
function trace_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trace (see VARARGIN)

% Choose default command line output for trace
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trace wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trace_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function R_Callback(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R as text
%        str2double(get(hObject,'String')) returns contents of R as a double


% --- Executes during object creation, after setting all properties.
function R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_Callback(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L as text
%        str2double(get(hObject,'String')) returns contents of L as a double


% --- Executes during object creation, after setting all properties.
function L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_Callback(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C as text
%        str2double(get(hObject,'String')) returns contents of C as a double


% --- Executes during object creation, after setting all properties.
function C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in showState.
function showState_Callback(hObject, eventdata, handles)
% hObject    handle to showState (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

t = 0:0.1:100; 
%从界面上获取电路参数 
R = str2num(get(handles.R,'string')); 
L = str2num(get(handles.L,'string')); 
C = str2num(get(handles.C,'string')); 
%若系统以[iL(t),vC(t)]为响应，以e(t)为激励
%确定系统状态方程和输出方程中的 a,b,c,d 矩阵 
a = [-R/L -1/L;1/C 0]; 
b = [1/L;0]; 
c = [1 0;0 1]; 
d = [0];             

sys = ss(a,b,c,d);       %建立系统状态空间模型 
Response = step(sys,t);  %求系统的阶跃响应 
axes(handles.axes1); 
plot(t,Response(:,1),'b-','linewidth',2); %显示iL(t)
ylabel('iL(t)','fontsize',14) 
axes(handles.axes2); 
plot(t,Response(:,2),'r-','linewidth',2); %显示vC(t)
ylabel('vC(t)','fontsize',14) 
axes(handles.axes3); 
plot(Response(:,2),Response(:,1),'linewidth',2);  %显示状态轨迹 
xlabel('vC(t)','fontsize',14) 
ylabel('iL(t)','fontsize',14) 

%判断系统的阻尼状态 
alpha = R/(2*L);   
omega = 1/sqrt(L*C); 
if (R==0) 
    str = '无阻尼'; 
else     
    if(alpha>omega)         
        str = '过阻尼'; 
    end 
    if(alpha==omega) 
        str = '临界阻尼';    
    end 
    if(alpha<omega) 
        str = '欠阻尼'; 
    end 
end 
set(handles.textState,'string',str);
