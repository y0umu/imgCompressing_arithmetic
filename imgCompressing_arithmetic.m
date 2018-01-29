% imgCompressing_arithmetic.m

function varargout = imgCompressing_arithmetic(varargin)
% IMGCOMPRESSING_ARITHMETIC MATLAB code for imgCompressing_arithmetic.fig
%      IMGCOMPRESSING_ARITHMETIC, by itself, creates a new IMGCOMPRESSING_ARITHMETIC or raises the existing
%      singleton*.
%
%      H = IMGCOMPRESSING_ARITHMETIC returns the handle to a new IMGCOMPRESSING_ARITHMETIC or the handle to
%      the existing singleton*.
%
%      IMGCOMPRESSING_ARITHMETIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMGCOMPRESSING_ARITHMETIC.M with the given input arguments.
%
%      IMGCOMPRESSING_ARITHMETIC('Property','Value',...) creates a new IMGCOMPRESSING_ARITHMETIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imgCompressing_arithmetic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imgCompressing_arithmetic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imgCompressing_arithmetic

% Last Modified by GUIDE v2.5 13-Apr-2017 13:26:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imgCompressing_arithmetic_OpeningFcn, ...
                   'gui_OutputFcn',  @imgCompressing_arithmetic_OutputFcn, ...
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


% --- Executes just before imgCompressing_arithmetic is made visible.
function imgCompressing_arithmetic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imgCompressing_arithmetic (see VARARGIN)

% �ѽ����ƶ�����Ļ����
movegui(hObject, 'center');

% ȫ�����ʵı���
global NEXT_BUTTON_ENTRY_CNT; % ��¼show_next_step_button�����ô���
       NEXT_BUTTON_ENTRY_CNT = 0;
global NUM2STR_DIGITS;     % ���ƺ���num2str�������ʾλ�������������ط����޸Ĵ˱���
NUM2STR_DIGITS = 15;
% ����������
set(handles.axes_demoArea,'Visible','off');

% ���������ж�
h_interruptible_list = findobj(hObject, '-property','Interruptible');
set(h_interruptible_list, 'Interruptible', 'off');
% ͳһ����String���ԵĿؼ���������ʽ��ע�⣡��������Ḳ��guide�н��е����ã�
% Ҳ����˵��������guide�и���ť����ʲô�������ƺʹ�С�����ᱻ���ӵ�
% ��Ӱ���GUI����text������axes�ϵ��Ǹ�text������edit��pushbutton��radiobutton
h_property_string_list = findobj(hObject, '-property','String');
set(h_property_string_list, 'FontSize',10.0);
set(h_property_string_list, 'FontName','΢���ź�');
% ͳһ���к���Title���ԵĿؼ���������ʽ
% ��Ӱ��GUI�Ķ���uipanel
h_property_title_list = findobj(hObject, '-property','Title');
set(h_property_title_list, 'FontSize',10.0);
set(h_property_title_list, 'FontName','΢���ź�');

% ���������ݵ���ʼ״̬��
guiResetAll(handles);

% Choose default command line output for imgCompressing_arithmetic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imgCompressing_arithmetic wait for user response (see UIRESUME)
% uiwait(handles.figure_imgCompressing_arithmetic);


% --- Outputs from this function are returned to the command line.
function varargout = imgCompressing_arithmetic_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%--------------------------------------------------------------------------
%                             �ǻص�����
%--------------------------------------------------------------------------
function guiSetEnable(handles)
% �ÿؼ�Ϊ����ʾ������̡�״̬
set(handles.button_next,'Enable','on');  %  ����һ������ťʹ��
set(handles.button_startDemo, 'Enable','off')  % �����ɹ�����������ť��ֹ
set(handles.button_decode,'Enable','off');             % �����롱��ť��ֹ
set(handles.edit_sourceProbability,'Enable','off');  % ��Դ������ֹ
set(handles.edit_sourceSymbol,'Enable','off');       % ��Դ����������ֹ
set(handles.edit_inSequence,'Enable','off');         % ����������ֹ
%--------------------------------------------------------------------------
function guiResetAll(handles)
%guiResetAll ����һ��
guiResetWidget(handles);
guiResetEnable(handles);
%--------------------------------------------------------------------------
function guiResetWidget(handles)
%guiResetWidget ��������Ϊ��ʼ״̬
global NEXT_BUTTON_ENTRY_CNT;

axes(handles.axes_demoArea);
cla;
NEXT_BUTTON_ENTRY_CNT = 0;
set(handles.text_decodeResult,'String','');
set(handles.text_code,'string','');
set(handles.edit_sourceProbability,'string', '0.1, 0.4, 0.2, 0.3');
set(handles.edit_sourceSymbol,'string', '''Y'',''u'',''o'',''m''');
set(handles.edit_inSequence,'string', 'oYmYomu');
set(handles.edit_valueToDecode,'String', '0.05784');  % �趨һ����ʼ���Ŀ������ֵ
set(handles.edit_lengthToDecode, 'String', '5');   % �趨һ����ʼ�������볤��
%--------------------------------------------------------------------------
function guiResetEnable(handles)
%guiResetEnable ����GUI�ؼ�ʹ��Ϊ��ʼ״̬
set(handles.button_startDemo,'Enable','on');  % ʹ�ܡ���ʼ��ʾ����ť
set(handles.button_decode,'Enable','off');             % �����롱��ť��ֹ
set(handles.button_next, 'Enable', 'off');  % ������һ����ť
set(handles.edit_sourceProbability,'Enable','on');  % ����ʹ����Դ�����
set(handles.edit_sourceSymbol,'Enable','on');       % ʹ����Դ���������
set(handles.edit_inSequence,'Enable','on');         % ʹ�����������
%--------------------------------------------------------------------------
function [probability, count, symbol] = evalUserInput(input_prob, input_sym, input_seq)
%evalUserInput ����û�����
% input_prob   -  ��ʾ��Դ���ʵ��ַ���
% input_sym    -  ��ʾ��Դ���ŵ��ַ���
% input_seq    -  ��ʾ���������е��ַ���
% �����ȷ��status = true��probability��count�ֱ�ֵ��Դ���ʾ������Դ���Ÿ���
% ��������׳��쳣�� probability = count = NaN
try
    mat = eval(strcat('[', input_prob, ']'));
    symbol = eval(strcat('[',input_sym,']'));
catch exception
    errordlg('��������...��������','����','modal');
    error('��������...��������');
end
count = length(mat);
mat_sum = sum(mat);

% ��������Ƿ�Ϊ��
if isempty(input_prob) || isempty(input_sym) || isempty(input_seq)
    errordlg('���벻��Ϊ�հ�ͬѧ','����','modal');
    error('���벻��Ϊ�հ�ͬѧ');
end
% ���mat���Ƿ���<0��Ԫ��
if (any(mat <= 0))
%     probability = NaN;
%     count = NaN;
%     symbol = NaN;
    errordlg('�㲻������һ������/����Ϊ���ʡ�������Ϣ����Command Window���ֵĴ�����Ϣ','����');
    error('ERROR: You cannot give a negative number or zero as probability');
end
% ���mat���Ƿ���>=1��Ԫ��
if (any(mat >= 1))
%     probability = NaN;
%     count = NaN;
%     symbol = NaN;
    errordlg('�㲻��������ڵ���1������Ϊ���ʡ�������Ϣ����Command Window���ֵĴ�����Ϣ','����');
    error('ERROR: You cannot give a number greater equal than 1 as probability');
end
% ������֮���Ƿ�Ϊ1
if (abs(mat_sum - 1) >= 1e-5)  % mat_sum ~= 1.0�����������õ�������ǳ���eps�����ƺ���������ʺܶ��ʱ�򲻺�ʹ
    probability = NaN;
    count = NaN;
    symbol = NaN;
    errordlg('�������֮�Ͳ�����1��������Ϣ����Command Window���ֵĴ�����Ϣ','����');
    error('ERROR: Probabilities do not add up to 1');
end
% �����Դ������������Դ���������Ƿ�ȳ�
if (length(symbol) ~= length(mat))
%     probability = NaN;
%     count = NaN;
%     symbol = NaN;
    errordlg('��Դ���ʺ���Դ���Ų��ȳ���������Ϣ����Command Window���ֵĴ�����Ϣ','����');
    error('ERROR: The length of probabilty(%d) matrix and symbol vectors(%d) is not equal', ...
          length(mat), length(symbol));
end
probability = mat;

len_seq = length(input_seq);
for i=1:len_seq
    if isInStr( input_seq(i), symbol) == false
        errordlg('��������������Դ�����в����ڵķ��š���������Command Window',...
                 '���ʲô', 'modal');
        error('ERROR: Supplied sequence contains a symbol(''%c'') that does not exist in the source', ...
              input_seq(i));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����������� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------
function bool = isInStr(ch, str)
%isInDict �ж��ַ�ch�Ƿ�������str��
if any( str == ch )
    bool = true;
else
    bool = false;
end
%--------------------------------------------------------------------------
function deco = arithDecode(source_symbol, source_prob, codeword, seq_len)
%arithDecode �������뺯��
%   source_symbol       -    ��Դ��������
%   source_prob         -    ��Դ��������
%   codeword            -    �������ֵ
%   seq_len             -    ���볤��
%   deco                -    ����������������ʱ���˱�����Ϊ�ա�
% �������ο����������ͼ���������������3�棩5.2.3�ڵĴ���
len_ps = length(source_prob);
high_range = zeros(1, len_ps);    % ����洢�ռ�
for k=1:len_ps
    high_range(k) = sum( source_prob(1:k) );  % high_range = [high_range, sum(ps(1:k))];
end
low_range = [0, high_range(1:(len_ps-1))];
psmin = min(source_prob);
deco = char(zeros(1, seq_len));

for i=1:seq_len
    idx = find(low_range <= codeword, 1, 'last');  % idx = max( find(low_range <= codeword) );
    codeword = codeword - low_range(idx);
%%% ���if��ԭ������ϵġ������ڡ�������Դ[0.5, 0.5]������0.99999999999�����볤��1�����
%%% ���������лᵼ�º���Ĵ���source_symbol����Խ��
%     if abs(codeword - source_prob(idx) ) < 0.01 * psmin    % codeword == source_prob(idx) ?
%         idx = idx + 1;
%         codeword = 0;
%     end

    deco(i) = source_symbol(idx);
    codeword = codeword / source_prob(idx);
    
%%% ԭ�����ϵ����if�ƺ������ﲻ����������¡������������벻������������
%%% ����������ı�����
%%% ��һ���棬���������ֹͣ��������Ӧ������Դ���Ÿ��������仰˵�������ֹͣ���롱
%%% ���ŵ�ʱ�򷽲�ֹͣ��������������û��ʵ��ͨ����Դ������ֹͣ���롱���š���
%     if abs(codeword) < 0.01 * psmin    % codeword == 0 ? �����codeword��÷ǳ��ӽ�0�����в����������ɣ�
%         if i < seq_len   % �����������ַ�ʽȷ�ϡ������롱��
% %             disp('�������룿');
%             deco = [];
%         end
%         break;   % i = symlen + 1;    % �����˳�ѭ��
%     end
end
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ��ͼ��� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------
function drawFirstLine(h_axes, low_range, high_range ,source_prob, source_symbol, seq_index)
%drawFirstLine ���Ƶ�һ����
%   �˺�����button_start_Callback����
global LOW;    % ��ǰ�����ַ�������˵�
global HIGH;   % ��ǰ�����ַ������Ҷ˵�
global NUM2STR_DIGITS;
LOW = 0;
HIGH = 1;

n_range = HIGH - LOW;
HIGH = LOW + n_range * high_range(seq_index(1));
LOW = LOW + n_range * low_range(seq_index(1));
% global LOW_RANGE;    % ���еġ�������˵㡱��ɵ�����
% global HIGH_RANGE;   % ���еġ������Ҷ˵㡱��ɵ�����
axes(h_axes);

source_cnt = length(source_symbol);
seq_len = length(seq_index);

line([1, 1], [0, 1]);    % ��������
% ���ָ��ߺͶ˵����
line(1+[-0.1, 0.1], [0, 0]);   % ��ʼ������˵�
str_low = num2str(0, NUM2STR_DIGITS);
text('Position',[1.1, 0],'String',str_low , ...
     'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
for i=1:source_cnt
    line(1+[-0.1,0.1], [1,1] * high_range(i));
    str_num = num2str(sum(source_prob(1:i)), NUM2STR_DIGITS);
    text('Position',[1.1, high_range(i)],'String',str_num, ...
         'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
end
% ����Դ����
for i=1:source_cnt
    y_pos = (low_range(i) + high_range(i) ) / 2;
%     if (seq_len > 1) && (seq_index(1) == i)    % ����Ǵ��������������ɫ���
    if seq_index(1) == i    % ����Ǵ��������������ɫ���
        text('Position',[0.8, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center', 'Color', 'red');
    else
        text('Position',[0.8, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center');
    end
end

%--------------------------------------------------------------------------
function drawNextLine(h_axes,current_level, low_range, high_range ,source_prob, source_symbol, seq_index)
%drawNext ���ڶ���һֱ�����һ����
%    ��button_next_Callback����
global LOW;
global HIGH;
global NUM2STR_DIGITS;

previous_low = LOW;
% previous_high = HIGH;

n_range = HIGH - LOW;
HIGH = LOW + n_range * high_range(seq_index(current_level));
LOW = LOW + n_range * low_range(seq_index(current_level));

% format long;
seq_len = length(seq_index);
axes(h_axes);

source_cnt = length(source_symbol);

line([current_level, current_level], [0, 1]);    % ��������
% ���ָ��ߺͶ˵����
% ������˵�
line(current_level+[-0.1, 0.1], [0, 0]);
str_low = num2str(previous_low, NUM2STR_DIGITS);
text('Position',[current_level+0.1, 0],'String',str_low , ...
     'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
for i=1:source_cnt
    str_y_mark = num2str(previous_low + high_range(i) * n_range, NUM2STR_DIGITS);
    % ��Ϊ�ǰ�����Դ���ʵı��ʷָ������ͼ�ε�ʱ�����ǰ�����������������y=0��y=1�����ϻ���
    line(current_level+[-0.1,0.1], [1,1] * high_range(i));
    text('Position',[current_level+0.1, high_range(i)],'String',str_y_mark, ...
         'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
end
% ����Դ����
for i=1:source_cnt
    y_pos = (low_range(i) + high_range(i) ) / 2;
    if seq_index(current_level) == i    % ����Ǵ��������������ɫ���
        text('Position',[current_level-0.2, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center', 'Color', 'red');
    else
        text('Position',[current_level-0.2, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center');
    end
end

%--------------------------------------------------------------------------
function drawConnectionLine(h_axes, current_level, previous_symbol_index, low_range, high_range)
%drawConnectionLine ����current_level���(current_level-1)��֮��ʾ���Ե�����
%   previous_symbol_index  -  ǰһ�����������Դ�����е��±�
axes(h_axes);
previous_level = current_level - 1;
line([previous_level + 0.1, current_level - 0.1], ...
     [low_range(previous_symbol_index), 0], ...
     'Color', 'red');
line([previous_level + 0.1, current_level - 0.1], ...
     [high_range(previous_symbol_index), 1], ...
     'Color', 'red');
%--------------------------------------------------------------------------

%----------------------------�ǻص����� end--------------------------------

%--------------------------------------------------------------------------
%                              �ص�����
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------

% --- Executes during object creation, after setting all properties.
function edit_sourceProbability_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sourceProbability (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in button_startDemo.
function button_startDemo_Callback(hObject, eventdata, handles)
global SOURCE_PROB;
global SOURCE_SYMBOL;
global SEQ_INDEX;    % �������ж�Ӧ��SOURCE_SYMBOL���±�
global LOW;    % ��ǰ������˵�
LOW = 0;
global HIGH;
HIGH = 1;      % ��ǰ�����Ҷ˵�
global LOW_RANGE;    % ��ʼ�ġ�������˵㡱��ɵ�����
global HIGH_RANGE;   % ��ʼ�ġ������Ҷ˵㡱��ɵ�����
% disp('����˿�ʼ��ʾ��ť');    % ������
set(handles.text_code,'string','');  % ���֮ǰ�ı�����
axes(handles.axes_demoArea);   % set(gcf,'CurrentAxes',handles.axes_demoArea);
cla;  % ���֮ǰ��������

input_prob = get(handles.edit_sourceProbability, 'String');
input_sym = get(handles.edit_sourceSymbol, 'String');
sequence = get(handles.edit_inSequence, 'String');
[SOURCE_PROB, source_cnt, SOURCE_SYMBOL] = evalUserInput(input_prob, input_sym, sequence);

% Ԥ�ȷ���洢�ռ�
seq_len = length(sequence);
HIGH_RANGE = zeros(1, source_cnt);

% ȷ����ͼ����
axis([0.5, seq_len+0.5, -0.1, 1.2]);

% ���б���ǰ��׼������������Դ��������[0,1)�Ͻ��л���
for k=1:source_cnt
    HIGH_RANGE(k) = sum(SOURCE_PROB(1:k));
end
LOW_RANGE = [0, HIGH_RANGE(1:(source_cnt-1))];

SEQ_INDEX=zeros(size(sequence));
for i=1:seq_len
    SEQ_INDEX(i)=find(SOURCE_SYMBOL == sequence(i));   % SEQ_INDEX���������и������Ŷ�Ӧ����Դ���ŵ��±�
end

% ����������
for i=1:seq_len
    text('Position',[i, 1.1],'String',sequence(i), ...
         'HorizontalAlignment', 'center');
end

% ����ʼ���Ǹ���
drawFirstLine(handles.axes_demoArea, LOW_RANGE, HIGH_RANGE ,SOURCE_PROB, ...
              SOURCE_SYMBOL, SEQ_INDEX);

guiSetEnable(handles);    % ��������ؼ��ϵ�ʹ��
%--------------------------------------------------------------------------
function button_next_Callback(hObject, eventdata, handles)
global SOURCE_PROB;
global SOURCE_SYMBOL;
global SEQ_INDEX;    % �������ж�Ӧ��SOURCE_SYMBOL���±�
global LOW;    % ��ǰ������˵�
% global HIGH;   % ��ǰ�����Ҷ˵�
global LOW_RANGE;    % ���еġ�������˵㡱��ɵ�����
global HIGH_RANGE;   % ���еġ������Ҷ˵㡱��ɵ�����
global NEXT_BUTTON_ENTRY_CNT;
global NUM2STR_DIGITS;

seq_len = length(SEQ_INDEX);

% disp('button_next');    % ������
NEXT_BUTTON_ENTRY_CNT = NEXT_BUTTON_ENTRY_CNT + 1;
current_level = NEXT_BUTTON_ENTRY_CNT + 1;
% disp(NEXT_BUTTON_ENTRY_CNT);    % ������
axes(handles.axes_demoArea);

if current_level <= seq_len
    drawNextLine(handles.axes_demoArea,current_level, LOW_RANGE, HIGH_RANGE, ...
                 SOURCE_PROB, SOURCE_SYMBOL, SEQ_INDEX);
    drawConnectionLine(handles.axes_demoArea, current_level, ...
                       SEQ_INDEX(current_level-1), LOW_RANGE, HIGH_RANGE);
end


% ���ƽ���
if current_level >= seq_len
%     % ����GUI�Ҳ����ʾ��
    set(handles.text_code,'string',num2str(LOW, NUM2STR_DIGITS));
    NEXT_BUTTON_ENTRY_CNT = 0;  % ��������λ
    set(handles.edit_sourceProbability,'Enable','on');  % ����ʹ����Դ�����
    set(handles.edit_sourceSymbol,'Enable','on');       % ʹ����Դ���������
    set(handles.edit_inSequence,'Enable','on');         % ʹ�����������
    set(handles.button_startDemo,'Enable','on');  % ����ʹ�ܡ�������������ť
    set(handles.button_decode,'Enable','on');     % �����롱��ťʹ��
    set(handles.button_next, 'Enable', 'off');  % ���á���һ������ť
end
%--------------------------------------------------------------------------


% --- Executes during object creation, after setting all properties.
function text_code_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------------------------------------------------------------

% --- Executes on button press in button_reset.
function button_reset_Callback(hObject, eventdata, handles)
guiResetAll(handles);
%--------------------------------------------------------------------------

% --- Executes during object creation, after setting all properties.
function button_startDemo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to button_startDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
function menuitem_file_Callback(hObject, eventdata, handles)
%--------------------------------------------------------------------------
function menuitem_edit_Callback(hObject, eventdata, handles)
%--------------------------------------------------------------------------
function menuitem_view_Callback(hObject, eventdata, handles)
%--------------------------------------------------------------------------
function menuitem_help_Callback(hObject, eventdata, handles)
%--------------------------------------------------------------------------
function menuitem_showDoc_Callback(hObject, eventdata, handles)
web 'https://zh.wikipedia.org/wiki/%E7%AE%97%E6%9C%AF%E7%BC%96%E7%A0%81' -browser
%--------------------------------------------------------------------------
function edit_sourceSymbol_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%--------------------------------------------------------------------------
function edit_inSequence_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%--------------------------------------------------------------------------
function edit_valueToDecode_Callback(hObject, eventdata, handles)

%--------------------------------------------------------------------------
function edit_valueToDecode_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%--------------------------------------------------------------------------
function button_decode_Callback(hObject, eventdata, handles)
global SOURCE_SYMBOL;
global SOURCE_PROB;
% disp('��������밴ť');

% ��ȡ���������ֵ
num_to_decode = str2double( get(handles.edit_valueToDecode,'String') );
seq_len = str2double( get(handles.edit_lengthToDecode,'String') );
if isnan(num_to_decode) || isnan(seq_len)
    errordlg('��Ӧ������һ������', '����', 'modal');
    return;
end
if (num_to_decode < 0) || (num_to_decode >= 1)
    errordlg('���ڴ������ֵ����Ӧ������һ������(0,1)�����ϵ���', '����', 'modal');
    return;
end

msg = arithDecode(SOURCE_SYMBOL, SOURCE_PROB, num_to_decode, seq_len);
if isempty(msg)
    errordlg('�޷��ҵ�ʹ������ֵ�����볤����ƥ������У�������������', ...
             '�޷�����', 'modal');
    msg = '�޷�����';
end
set(handles.text_decodeResult, 'String', msg);

%--------------------------------------------------------------------------
function edit_lengthToDecode_Callback(hObject, eventdata, handles)
%edit_lengthToDecode_Callback ��ֹ�û����������г�������ʱ����
str_seq_len = get(hObject, 'String');
if (~ isempty(str_seq_len) ) && (~ isnan(str2double(str_seq_len)) )
    seq_len = str2double(str_seq_len);
    seq_len = abs(seq_len);    % ��ֹ�и���
    if (seq_len < 1)
        seq_len = 1;    % ��ֹ��㼸
    end
    seq_len = floor(seq_len);    % ��С����ص�
    set(hObject, 'String', num2str(seq_len));
end

%--------------------------------------------------------------------------
function edit_lengthToDecode_CreateFcn(hObject, eventdata, handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%--------------------------------------------------------------------------
function menuitem_aboutYoumu_Callback(hObject, eventdata, handles)
% msgbox('�������������־���޸�','����');
h_fig = figure;
movegui(h_fig, 'center');
set(h_fig,'units','pixels','Windowstyle','normal','Menubar','none',...
            'Name', '����Youmu','NumberTitle','off','CloseRequestFcn','delete(gcf)');
h_axes = axes;
% axis off;

img = imread('Konpaku Youmu.jpg');
h_img = imshow(img, 'Parent', h_axes);

axes_position = get(h_axes, 'Position');

msg_str = ['�������Σ�Konpaku Youmu��ס��ڤ��İ���¥��',...
            char(10), '���������ߵĻ�����������������һ��ն���⡣'];
% h_text = uicontrol(h_fig,'Style','text','Units','Normalized',...
%                    'FontSize',9.0,'Position',[0.05 0.01 0.90 0.075],...
%                    'String',msg_str);
h_text = uicontrol(h_fig,'Style','text','Units','Normalized',...
                   'FontSize',9.0,'Position',[0.05, axes_position(2)-0.077, 0.90, 0.075],...
                   'String',msg_str);

%--------------------------------------------------------------------------
function figure_imgCompressing_arithmetic_CloseRequestFcn(hObject, eventdata, handles)
%%% ���֮ʱ���Ҫ�Ѵ���������д�ã�
clear global -regexp NEXT_BUTTON_ENTRY_CNT NUM2STR_DIGITS LOW HIGH SOURCE_PROB SOURCE_SYMBOL SEQ_INDEX LOW_RANGE HIGH_RANGE;
% disp('��ǵ�������������ı�д');
% Hint: delete(hObject) closes the figure
delete(hObject);
%--------------------------------------------------------------------------
%------------------------------�ص����� end--------------------------------
