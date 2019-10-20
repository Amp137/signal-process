%%%%%%%%%
% ʵ���� tul.m ������GUI���绰���ϳ�
% ���ߣ���� 2017301200060
% ���ڣ�2019/9/28
%%%%%%%%%

function varargout = tul(varargin)
% TUL MATLAB code for tul.fig
%      TUL, by itself, creates a new TUL or raises the existing
%      singleton*.

%      H = TUL returns the handle to a new TUL or the handle to
%      the existing singleton*.
%
%      TUL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUL.M with the given input arguments.
%
%      TUL('Property','Value',...) creates a new TUL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tul_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tul_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tul

% Last Modified by GUIDE v2.5 29-Sep-2019 15:32:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tul_OpeningFcn, ...
                   'gui_OutputFcn',  @tul_OutputFcn, ...
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


% --- Executes just before tul is made visible.
function tul_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tul (see VARARGIN)

% Choose default command line output for tul
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global NUM;
NUM = [];

% UIWAIT makes tul wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tul_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button1. 
% ����������1���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '1');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(1)*t) + sin(2*pi*hf(1)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button2.
% ����������2���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button2_Callback(hObject, eventdata, handles)
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '2');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(1)*t) + sin(2*pi*hf(2)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button3.
% ����������3���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button3_Callback(hObject, eventdata, handles)
% hObject    handle to button3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '3');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(1)*t) + sin(2*pi*hf(3)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button4.
% ����������4���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button4_Callback(hObject, eventdata, handles)
% hObject    handle to button4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '4');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(2)*t) + sin(2*pi*hf(1)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button5.
% ����������5���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button5_Callback(hObject, eventdata, handles)
% hObject    handle to button5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '5');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(2)*t) + sin(2*pi*hf(2)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button6.
% ����������6���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button6_Callback(hObject, eventdata, handles)
% hObject    handle to button6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '6');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(2)*t) + sin(2*pi*hf(3)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button7.
% ����������7���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button7_Callback(hObject, eventdata, handles)
% hObject    handle to button7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '7');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(3)*t) + sin(2*pi*hf(1)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button8.
% ����������8���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button8_Callback(hObject, eventdata, handles)
% hObject    handle to button8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '8');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(3)*t) + sin(2*pi*hf(2)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in button9.
% ����������9���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button9_Callback(hObject, eventdata, handles)
% hObject    handle to button9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '9');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(3)*t) + sin(2*pi*hf(3)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in buttonStar.
% ������*������ɾ����ĩһλ���룬������Ӧ��DTMF�źŲ�����
function buttonStar_Callback(hObject, eventdata, handles)
% hObject    handle to buttonStar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = get(handles.edit1, 'string');
n = n(1:length(n)-1);
set(handles.edit1, 'string', n);

global NUM;
NUM = NUM(1:length(NUM)-1100);

d = sin(2*pi*lf(4)*t) + sin(2*pi*hf(1)*t);
sound(d, Fs);

% --- Executes on button press in button0.
% ����������0���ڵ绰������ʾ����������֣�������Ӧ��DTMF�źŲ�����
function button0_Callback(hObject, eventdata, handles)
% hObject    handle to button0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

n = strcat(get(handles.edit1, 'string'), '0');
set(handles.edit1, 'string', n);

d = sin(2*pi*lf(4)*t) + sin(2*pi*hf(2)*t);
space = zeros(1, 100);
global NUM;
phone = [NUM, d];
NUM = [phone, space];
sound(d, Fs);

% --- Executes on button press in buttonSharp.
% ������#������������Ӧ��DTMF�źŲ�������֮������������绰�����DTMF��Ƶ����һ�飬ģ�Ⲧ��绰�Ĺ���
% �����ĵ绰������Ƶ������'dialtone.wav'�ļ���
function buttonSharp_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

% n = strcat(get(handles.edit1, 'string'), '#');
% set(handles.edit1, 'string', n);

global NUM;

d = sin(2*pi*lf(4)*t) + sin(2*pi*hf(3)*t);
sound(d, Fs);
pause(1);
sound(NUM, Fs);
audiowrite('dialtone.wav', NUM, Fs);

% --- Executes on button press in buttonA.
% ������A������������Ӧ��DTMF�źŲ�����
% Save��������ʱ������ǰ����ĵ绰����Ͷ�Ӧ�Ĳ��������浽numberA.mat�ļ���
% Save����δ����ʱ����numberA.mat�б���ĵ绰����Ͷ�Ӧ�Ĳ�����ȡ��
function buttonA_Callback(hObject, eventdata, handles)
% hObject    handle to buttonA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

global NUM;
global saveOn;

d = sin(2*pi*lf(1)*t) + sin(2*pi*hf(4)*t);
sound(d, Fs);
if saveOn == 1
    num = get(handles.edit1, 'string');
    dial = NUM;
    save('numberA', 'num', 'dial');
else
    if exist('numberA.mat', 'file')
        load('numberA.mat', 'num', 'dial');
        set(handles.edit1, 'string', num);
        NUM = dial;
    end
end

% --- Executes on button press in buttonB.
% ������B������������Ӧ��DTMF�źŲ�����
% Save��������ʱ������ǰ����ĵ绰����Ͷ�Ӧ�Ĳ��������浽numberB.mat�ļ���
% Save����δ����ʱ����numberB.mat�б���ĵ绰����Ͷ�Ӧ�Ĳ�����ȡ��
function buttonB_Callback(hObject, eventdata, handles)
% hObject    handle to buttonB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

global NUM;
global saveOn;

d = sin(2*pi*lf(2)*t) + sin(2*pi*hf(4)*t);
sound(d, Fs);
if saveOn == 1
    num = get(handles.edit1, 'string');
    dial = NUM;
    save('numberB', 'num', 'dial');
else
    if exist('numberB.mat', 'file')
        load('numberB', 'num', 'dial');
        set(handles.edit1, 'string', num);
        NUM = dial;
    end
end

% --- Executes on button press in buttonC.
% ������C������������Ӧ��DTMF�źŲ�����
% Save��������ʱ������ǰ����ĵ绰����Ͷ�Ӧ�Ĳ��������浽numberC.mat�ļ���
% Save����δ����ʱ����numberC.mat�б���ĵ绰����Ͷ�Ӧ�Ĳ�����ȡ��
function buttonC_Callback(hObject, eventdata, handles)
% hObject    handle to buttonC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

global NUM;
global saveOn;

d = sin(2*pi*lf(3)*t) + sin(2*pi*hf(4)*t);
sound(d, Fs);
if saveOn == 1
    num = get(handles.edit1, 'string');
    dial = NUM;
    save('numberC', 'num', 'dial');
else
    if exist('numberC.mat', 'file')
        load('numberC', 'num', 'dial');
        set(handles.edit1, 'string', num);
        NUM = dial;
    end
end

% --- Executes on button press in buttonD.
% ������D������������Ӧ��DTMF�źŲ�����
% Save��������ʱ������ǰ����ĵ绰����Ͷ�Ӧ�Ĳ��������浽numberD.mat�ļ���
% Save����δ����ʱ����numberD.mat�б���ĵ绰����Ͷ�Ӧ�Ĳ�����ȡ��
function buttonD_Callback(hObject, eventdata, handles)
% hObject    handle to buttonD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs = 8192;
Ts = 1 / Fs;
t = (1:1000) * Ts;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

global NUM;
global saveOn;

d = sin(2*pi*lf(4)*t) + sin(2*pi*hf(4)*t);
sound(d, Fs);
if saveOn == 1
    num = get(handles.edit1, 'string');
    dial = NUM;
    save('numberD', 'num', 'dial');
else
    if exist('numberD.mat', 'file')
        load('numberD', 'num', 'dial');
        set(handles.edit1, 'string', num);
        NUM = dial;
    end
end

% --- Executes on button press in buttonCLR.
% CLR�������������ĵ绰����Ͳ�����
function buttonCLR_Callback(hObject, eventdata, handles)
% hObject    handle to buttonCLR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit1, 'string', '');
global NUM;
NUM = [];

% --- Executes on button press in buttonReco.
% Reco����������detect.m�еĲ�����ʶ����ʶ���Ӧ�ĵ绰���룬��ʾ�ڵ绰������ʾ����
function buttonReco_Callback(hObject, eventdata, handles)
% hObject    handle to buttonReco (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[num, audio] = detect();
set(handles.edit1, 'string', num);
global NUM;
NUM = audio;

% --- Executes on button press in buttonPlot.
% Plot������������ĩһλ����Ĺ�һ������Ƶ��ͼ
function buttonPlot_Callback(hObject, eventdata, handles)
% hObject    handle to buttonPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N = 2048;
Fs = 8192;

global NUM;
if length(NUM) > 0
    num = get(handles.edit1, 'string');
    digit = num(end);
    lastNUM = NUM(end-1099:end-100);
    
    f = fft(lastNUM, N);
    f = abs(f / N);
    fs = f(1: (N/2 + 1)); % ȡ���ߣ��õ�����Ƶ��
    fs(2:end-1) = 2 * fs(2:end-1); % ��ȥֱ�������⣬����Ƶ�ʷ�ֵ��2���Է��Ϸ�ֵ��һ����Ҫ��
    freq = Fs * (0: (N/2)) / N; % ����Ƶ��ͼ�ĺ�����
    axes(handles.axes1); % Ƶ��ͼ����������е�ͼ��
    % figure(1); % Ƶ��ͼ����������Ĵ���
    freqRange = 500;
    plot(freq(1:freqRange), fs(1:freqRange));
    xlabel('f(Hz)');
    ylabel('|P1(t)|');
    text(1500, 0.35, digit, 'Color', 'red', 'FontSize', 28); % ��Ƶ��ͼ�м��ϱ�ǩ
    title('��ĩλ����������Ƶ��ͼ');
    grid;
end

% --- Executes on button press in toggleSave.
% Save���أ�����A,B,C,D��ť��ģʽ
% ���幦�ܼ�A,B,C,D��ť
function toggleSave_Callback(hObject, eventdata, handles)
% hObject    handle to toggleSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toggleSave

global saveOn;
saveOn = get(hObject, 'Value');
