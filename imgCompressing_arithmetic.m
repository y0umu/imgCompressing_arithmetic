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

% 把界面移动到屏幕中央
movegui(hObject, 'center');

% 全局性质的变量
global NEXT_BUTTON_ENTRY_CNT; % 记录show_next_step_button被调用次数
       NEXT_BUTTON_ENTRY_CNT = 0;
global NUM2STR_DIGITS;     % 控制函数num2str的最大显示位数。程序其他地方不修改此变量
NUM2STR_DIGITS = 15;
% 隐藏坐标轴
set(handles.axes_demoArea,'Visible','off');

% 屏蔽所有中断
h_interruptible_list = findobj(hObject, '-property','Interruptible');
set(h_interruptible_list, 'Interruptible', 'off');
% 统一含有String属性的控件的字体样式。注意！下面的语句会覆盖guide中进行的设置！
% 也就是说不管你在guide中给按钮设置什么字体名称和大小，都会被无视掉
% 受影响的GUI对象：text（不是axes上的那个text！）、edit、pushbutton、radiobutton
h_property_string_list = findobj(hObject, '-property','String');
set(h_property_string_list, 'FontSize',10.0);
set(h_property_string_list, 'FontName','微软雅黑');
% 统一所有含有Title属性的控件的字体样式
% 受影响GUI的对象：uipanel
h_property_title_list = findobj(hObject, '-property','Title');
set(h_property_title_list, 'FontSize',10.0);
set(h_property_title_list, 'FontName','微软雅黑');

% 置所有数据到初始状态。
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
%                             非回调函数
%--------------------------------------------------------------------------
function guiSetEnable(handles)
% 置控件为“显示编码过程”状态
set(handles.button_next,'Enable','on');  %  “下一步”按钮使能
set(handles.button_startDemo, 'Enable','off')  % “生成哈夫曼树”按钮禁止
set(handles.button_decode,'Enable','off');             % “译码”按钮禁止
set(handles.edit_sourceProbability,'Enable','off');  % 信源输入框禁止
set(handles.edit_sourceSymbol,'Enable','off');       % 信源符号输入框禁止
set(handles.edit_inSequence,'Enable','off');         % 序列输入框禁止
%--------------------------------------------------------------------------
function guiResetAll(handles)
%guiResetAll 重置一切
guiResetWidget(handles);
guiResetEnable(handles);
%--------------------------------------------------------------------------
function guiResetWidget(handles)
%guiResetWidget 重置数据为初始状态
global NEXT_BUTTON_ENTRY_CNT;

axes(handles.axes_demoArea);
cla;
NEXT_BUTTON_ENTRY_CNT = 0;
set(handles.text_decodeResult,'String','');
set(handles.text_code,'string','');
set(handles.edit_sourceProbability,'string', '0.1, 0.4, 0.2, 0.3');
set(handles.edit_sourceSymbol,'string', '''Y'',''u'',''o'',''m''');
set(handles.edit_inSequence,'string', 'oYmYomu');
set(handles.edit_valueToDecode,'String', '0.05784');  % 设定一个初始化的可译码的值
set(handles.edit_lengthToDecode, 'String', '5');   % 设定一个初始化的译码长度
%--------------------------------------------------------------------------
function guiResetEnable(handles)
%guiResetEnable 重置GUI控件使能为初始状态
set(handles.button_startDemo,'Enable','on');  % 使能“开始演示”按钮
set(handles.button_decode,'Enable','off');             % “译码”按钮禁止
set(handles.button_next, 'Enable', 'off');  % 禁用下一步按钮
set(handles.edit_sourceProbability,'Enable','on');  % 重新使能信源输入框
set(handles.edit_sourceSymbol,'Enable','on');       % 使能信源符号输入框
set(handles.edit_inSequence,'Enable','on');         % 使能序列输入框
%--------------------------------------------------------------------------
function [probability, count, symbol] = evalUserInput(input_prob, input_sym, input_seq)
%evalUserInput 检查用户输入
% input_prob   -  表示信源概率的字符串
% input_sym    -  表示信源符号的字符串
% input_seq    -  表示待编码序列的字符串
% 如果正确，status = true，probability和count分别赋值信源概率矩阵和信源符号个数
% 如果错误，抛出异常， probability = count = NaN
try
    mat = eval(strcat('[', input_prob, ']'));
    symbol = eval(strcat('[',input_sym,']'));
catch exception
    errordlg('输入有误啊...请重新输','错误','modal');
    error('输入有误啊...请重新输');
end
count = length(mat);
mat_sum = sum(mat);

% 检查输入是否为空
if isempty(input_prob) || isempty(input_sym) || isempty(input_seq)
    errordlg('输入不能为空啊同学','错误','modal');
    error('输入不能为空啊同学');
end
% 检查mat中是否有<0的元素
if (any(mat <= 0))
%     probability = NaN;
%     count = NaN;
%     symbol = NaN;
    errordlg('你不能输入一个负数/零作为概率。更多信息请检查Command Window出现的错误信息','错误');
    error('ERROR: You cannot give a negative number or zero as probability');
end
% 检查mat中是否有>=1的元素
if (any(mat >= 1))
%     probability = NaN;
%     count = NaN;
%     symbol = NaN;
    errordlg('你不能输入大于等于1的数作为概率。更多信息请检查Command Window出现的错误信息','错误');
    error('ERROR: You cannot give a number greater equal than 1 as probability');
end
% 检查概率之和是否为1
if (abs(mat_sum - 1) >= 1e-5)  % mat_sum ~= 1.0，本来这里用的误差限是常数eps，但似乎在输入概率很多的时候不好使
    probability = NaN;
    count = NaN;
    symbol = NaN;
    errordlg('输入概率之和不等于1。更多信息请检查Command Window出现的错误信息','错误');
    error('ERROR: Probabilities do not add up to 1');
end
% 检查信源符号向量和信源概率向量是否等长
if (length(symbol) ~= length(mat))
%     probability = NaN;
%     count = NaN;
%     symbol = NaN;
    errordlg('信源概率和信源符号不等长。更多信息请检查Command Window出现的错误信息','错误');
    error('ERROR: The length of probabilty(%d) matrix and symbol vectors(%d) is not equal', ...
          length(mat), length(symbol));
end
probability = mat;

len_seq = length(input_seq);
for i=1:len_seq
    if isInStr( input_seq(i), symbol) == false
        errordlg('输入序列中有信源符号中不存在的符号。详情请检查Command Window',...
                 '你搞什么', 'modal');
        error('ERROR: Supplied sequence contains a symbol(''%c'') that does not exist in the source', ...
              input_seq(i));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 算术编码相关 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------
function bool = isInStr(ch, str)
%isInDict 判断字符ch是否在向量str中
if any( str == ch )
    bool = true;
else
    bool = false;
end
%--------------------------------------------------------------------------
function deco = arithDecode(source_symbol, source_prob, codeword, seq_len)
%arithDecode 算术解码函数
%   source_symbol       -    信源符号向量
%   source_prob         -    信源概率向量
%   codeword            -    待解码的值
%   seq_len             -    解码长度
%   deco                -    解码结果。不可译码时，此变量置为空。
% 本函数参考了杨帆《数字图像处理与分析》（第3版）5.2.3节的代码
len_ps = length(source_prob);
high_range = zeros(1, len_ps);    % 分配存储空间
for k=1:len_ps
    high_range(k) = sum( source_prob(1:k) );  % high_range = [high_range, sum(ps(1:k))];
end
low_range = [0, high_range(1:(len_ps-1))];
psmin = min(source_prob);
deco = char(zeros(1, seq_len));

for i=1:seq_len
    idx = find(low_range <= codeword, 1, 'last');  % idx = max( find(low_range <= codeword) );
    codeword = codeword - low_range(idx);
%%% 这个if是原来杨帆书上的。但是在“输入信源[0.5, 0.5]，译码0.99999999999，译码长度1”这个
%%% 测试用例中会导致后面的代码source_symbol访问越界
%     if abs(codeword - source_prob(idx) ) < 0.01 * psmin    % codeword == source_prob(idx) ?
%         idx = idx + 1;
%         codeword = 0;
%     end

    deco(i) = source_symbol(idx);
    codeword = codeword / source_prob(idx);
    
%%% 原来书上的这个if似乎是想表达不可译码这件事。但是算术编码不是无论怎样都
%%% 能译出东西的编码吗？
%%% 另一方面，算术编码的停止译码条件应该由信源符号给出。换句话说当译出“停止译码”
%%% 符号的时候方才停止。【不过本程序并没有实现通过信源给出“停止译码”符号。】
%     if abs(codeword) < 0.01 * psmin    % codeword == 0 ? （如果codeword变得非常接近0，则有不可译码嫌疑）
%         if i < seq_len   % 【不能用这种方式确认“不可译”】
% %             disp('不可译码？');
%             deco = [];
%         end
%         break;   % i = symlen + 1;    % 控制退出循环
%     end
end
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 画图相关 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------------------------------------------------------------------------
function drawFirstLine(h_axes, low_range, high_range ,source_prob, source_symbol, seq_index)
%drawFirstLine 绘制第一根线
%   此函数由button_start_Callback调用
global LOW;    % 当前编码字符区间左端点
global HIGH;   % 当前编码字符区间右端点
global NUM2STR_DIGITS;
LOW = 0;
HIGH = 1;

n_range = HIGH - LOW;
HIGH = LOW + n_range * high_range(seq_index(1));
LOW = LOW + n_range * low_range(seq_index(1));
% global LOW_RANGE;    % 所有的“区间左端点”组成的向量
% global HIGH_RANGE;   % 所有的“区间右端点”组成的向量
axes(h_axes);

source_cnt = length(source_symbol);
seq_len = length(seq_index);

line([1, 1], [0, 1]);    % 画主干线
% 画分隔线和端点概率
line(1+[-0.1, 0.1], [0, 0]);   % 初始区间左端点
str_low = num2str(0, NUM2STR_DIGITS);
text('Position',[1.1, 0],'String',str_low , ...
     'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
for i=1:source_cnt
    line(1+[-0.1,0.1], [1,1] * high_range(i));
    str_num = num2str(sum(source_prob(1:i)), NUM2STR_DIGITS);
    text('Position',[1.1, high_range(i)],'String',str_num, ...
         'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
end
% 画信源符号
for i=1:source_cnt
    y_pos = (low_range(i) + high_range(i) ) / 2;
%     if (seq_len > 1) && (seq_index(1) == i)    % 如果是待编码符号则用颜色标记
    if seq_index(1) == i    % 如果是待编码符号则用颜色标记
        text('Position',[0.8, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center', 'Color', 'red');
    else
        text('Position',[0.8, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center');
    end
end

%--------------------------------------------------------------------------
function drawNextLine(h_axes,current_level, low_range, high_range ,source_prob, source_symbol, seq_index)
%drawNext 画第二根一直到最后一根线
%    由button_next_Callback调用
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

line([current_level, current_level], [0, 1]);    % 画主干线
% 画分隔线和端点概率
% 区间左端点
line(current_level+[-0.1, 0.1], [0, 0]);
str_low = num2str(previous_low, NUM2STR_DIGITS);
text('Position',[current_level+0.1, 0],'String',str_low , ...
     'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
for i=1:source_cnt
    str_y_mark = num2str(previous_low + high_range(i) * n_range, NUM2STR_DIGITS);
    % 因为是按照信源概率的比率分割。而绘制图形的时候总是按这个概率再坐标轴的y=0和y=1区间上划分
    line(current_level+[-0.1,0.1], [1,1] * high_range(i));
    text('Position',[current_level+0.1, high_range(i)],'String',str_y_mark, ...
         'HorizontalAlignment', 'left', 'VerticalAlignment', 'baseline');
end
% 画信源符号
for i=1:source_cnt
    y_pos = (low_range(i) + high_range(i) ) / 2;
    if seq_index(current_level) == i    % 如果是待编码符号则用颜色标记
        text('Position',[current_level-0.2, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center', 'Color', 'red');
    else
        text('Position',[current_level-0.2, y_pos],'String',source_symbol(i), ...
             'HorizontalAlignment', 'center');
    end
end

%--------------------------------------------------------------------------
function drawConnectionLine(h_axes, current_level, previous_symbol_index, low_range, high_range)
%drawConnectionLine 绘制current_level层和(current_level-1)层之间示意性的连线
%   previous_symbol_index  -  前一编码符号在信源向量中的下标
axes(h_axes);
previous_level = current_level - 1;
line([previous_level + 0.1, current_level - 0.1], ...
     [low_range(previous_symbol_index), 0], ...
     'Color', 'red');
line([previous_level + 0.1, current_level - 0.1], ...
     [high_range(previous_symbol_index), 1], ...
     'Color', 'red');
%--------------------------------------------------------------------------

%----------------------------非回调函数 end--------------------------------

%--------------------------------------------------------------------------
%                              回调函数
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
global SEQ_INDEX;    % 输入序列对应于SOURCE_SYMBOL的下标
global LOW;    % 当前区间左端点
LOW = 0;
global HIGH;
HIGH = 1;      % 当前区间右端点
global LOW_RANGE;    % 初始的“区间左端点”组成的向量
global HIGH_RANGE;   % 初始的“区间右端点”组成的向量
% disp('点击了开始演示按钮');    % 调试用
set(handles.text_code,'string','');  % 清除之前的编码结果
axes(handles.axes_demoArea);   % set(gcf,'CurrentAxes',handles.axes_demoArea);
cla;  % 清除之前画的内容

input_prob = get(handles.edit_sourceProbability, 'String');
input_sym = get(handles.edit_sourceSymbol, 'String');
sequence = get(handles.edit_inSequence, 'String');
[SOURCE_PROB, source_cnt, SOURCE_SYMBOL] = evalUserInput(input_prob, input_sym, sequence);

% 预先分配存储空间
seq_len = length(sequence);
HIGH_RANGE = zeros(1, source_cnt);

% 确定绘图区域
axis([0.5, seq_len+0.5, -0.1, 1.2]);

% 进行编码前的准备工作，把信源按概率在[0,1)上进行划分
for k=1:source_cnt
    HIGH_RANGE(k) = sum(SOURCE_PROB(1:k));
end
LOW_RANGE = [0, HIGH_RANGE(1:(source_cnt-1))];

SEQ_INDEX=zeros(size(sequence));
for i=1:seq_len
    SEQ_INDEX(i)=find(SOURCE_SYMBOL == sequence(i));   % SEQ_INDEX：输入序列各个符号对应的信源符号的下标
end

% 画编码序列
for i=1:seq_len
    text('Position',[i, 1.1],'String',sequence(i), ...
         'HorizontalAlignment', 'center');
end

% 画起始的那根线
drawFirstLine(handles.axes_demoArea, LOW_RANGE, HIGH_RANGE ,SOURCE_PROB, ...
              SOURCE_SYMBOL, SEQ_INDEX);

guiSetEnable(handles);    % 调整界面控件上的使能
%--------------------------------------------------------------------------
function button_next_Callback(hObject, eventdata, handles)
global SOURCE_PROB;
global SOURCE_SYMBOL;
global SEQ_INDEX;    % 输入序列对应于SOURCE_SYMBOL的下标
global LOW;    % 当前区间左端点
% global HIGH;   % 当前区间右端点
global LOW_RANGE;    % 所有的“区间左端点”组成的向量
global HIGH_RANGE;   % 所有的“区间右端点”组成的向量
global NEXT_BUTTON_ENTRY_CNT;
global NUM2STR_DIGITS;

seq_len = length(SEQ_INDEX);

% disp('button_next');    % 调试用
NEXT_BUTTON_ENTRY_CNT = NEXT_BUTTON_ENTRY_CNT + 1;
current_level = NEXT_BUTTON_ENTRY_CNT + 1;
% disp(NEXT_BUTTON_ENTRY_CNT);    % 调试用
axes(handles.axes_demoArea);

if current_level <= seq_len
    drawNextLine(handles.axes_demoArea,current_level, LOW_RANGE, HIGH_RANGE, ...
                 SOURCE_PROB, SOURCE_SYMBOL, SEQ_INDEX);
    drawConnectionLine(handles.axes_demoArea, current_level, ...
                       SEQ_INDEX(current_level-1), LOW_RANGE, HIGH_RANGE);
end


% 绘制结束
if current_level >= seq_len
%     % 填入GUI右侧的显示区
    set(handles.text_code,'string',num2str(LOW, NUM2STR_DIGITS));
    NEXT_BUTTON_ENTRY_CNT = 0;  % 计数器复位
    set(handles.edit_sourceProbability,'Enable','on');  % 重新使能信源输入框
    set(handles.edit_sourceSymbol,'Enable','on');       % 使能信源符号输入框
    set(handles.edit_inSequence,'Enable','on');         % 使能序列输入框
    set(handles.button_startDemo,'Enable','on');  % 重新使能“生成码树”按钮
    set(handles.button_decode,'Enable','on');     % “译码”按钮使能
    set(handles.button_next, 'Enable', 'off');  % 禁用“下一步”按钮
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
% disp('点击了译码按钮');

% 获取待解码的数值
num_to_decode = str2double( get(handles.edit_valueToDecode,'String') );
seq_len = str2double( get(handles.edit_lengthToDecode,'String') );
if isnan(num_to_decode) || isnan(seq_len)
    errordlg('您应该输入一个数字', '错误', 'modal');
    return;
end
if (num_to_decode < 0) || (num_to_decode >= 1)
    errordlg('对于待译码的值，您应该输入一个落在(0,1)区间上的数', '错误', 'modal');
    return;
end

msg = arithDecode(SOURCE_SYMBOL, SOURCE_PROB, num_to_decode, seq_len);
if isempty(msg)
    errordlg('无法找到使待译码值和译码长度相匹配的序列，请检查您的输入', ...
             '无法译码', 'modal');
    msg = '无法译码';
end
set(handles.text_decodeResult, 'String', msg);

%--------------------------------------------------------------------------
function edit_lengthToDecode_Callback(hObject, eventdata, handles)
%edit_lengthToDecode_Callback 防止用户在译码序列长度输入时捣蛋
str_seq_len = get(hObject, 'String');
if (~ isempty(str_seq_len) ) && (~ isnan(str2double(str_seq_len)) )
    seq_len = str2double(str_seq_len);
    seq_len = abs(seq_len);    % 防止有负数
    if (seq_len < 1)
        seq_len = 1;    % 防止零点几
    end
    seq_len = floor(seq_len);    % 把小数点截掉
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
% msgbox('本程序最后由徐志超修改','关于');
h_fig = figure;
movegui(h_fig, 'center');
set(h_fig,'units','pixels','Windowstyle','normal','Menubar','none',...
            'Name', '关于Youmu','NumberTitle','off','CloseRequestFcn','delete(gcf)');
h_axes = axes;
% axis off;

img = imread('Konpaku Youmu.jpg');
h_img = imshow(img, 'Parent', h_axes);

axes_position = get(h_axes, 'Position');

msg_str = ['魂魄妖梦（Konpaku Youmu）住在冥界的白玉楼。',...
            char(10), '发现入侵者的话，无论是人是妖，一律斩无赦。'];
% h_text = uicontrol(h_fig,'Style','text','Units','Normalized',...
%                    'FontSize',9.0,'Position',[0.05 0.01 0.90 0.075],...
%                    'String',msg_str);
h_text = uicontrol(h_fig,'Style','text','Units','Normalized',...
                   'FontSize',9.0,'Position',[0.05, axes_position(2)-0.077, 0.90, 0.075],...
                   'String',msg_str);

%--------------------------------------------------------------------------
function figure_imgCompressing_arithmetic_CloseRequestFcn(hObject, eventdata, handles)
%%% 完成之时务必要把此析构函数写好！
clear global -regexp NEXT_BUTTON_ENTRY_CNT NUM2STR_DIGITS LOW HIGH SOURCE_PROB SOURCE_SYMBOL SEQ_INDEX LOW_RANGE HIGH_RANGE;
% disp('请记得完成析构函数的编写');
% Hint: delete(hObject) closes the figure
delete(hObject);
%--------------------------------------------------------------------------
%------------------------------回调函数 end--------------------------------
