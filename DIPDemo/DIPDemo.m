function varargout = DIPDemo(varargin)
% DIPDEMO MATLAB code for DIPDemo.fig
%      DIPDEMO, by itself, creates a new DIPDEMO or raises the existing
%      singleton*.
%
%      H = DIPDEMO returns the handle to a new DIPDEMO or the handle to
%      the existing singleton*.
%
%      DIPDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIPDEMO.M with the given input arguments.
%
%      DIPDEMO('Property','Value',...) creates a new DIPDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIPDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIPDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIPDemo

% Last Modified by GUIDE v2.5 27-May-2018 22:25:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIPDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @DIPDemo_OutputFcn, ...
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


% --- Executes just before DIPDemo is made visible.
function DIPDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIPDemo (see VARARGIN)

% initial flag
handles.getflag = 0;
handles.putflag = 0;
handles.freqflag = 0;
handles.lock = 0;
handles.srcimg = [];
handles.grayimg = [];
handles.rstimg = [];
handles.freqimg = [];
handles.versioninfo = 'DIPDemo v1.0 @2018.5.27';
%handles.lock = 0;
% initial image
flag = 0;
if rand < 0.3
	axes(handles.axes1);
	imshow(ones(256)*0.94);
    text(30,50,'For you,','FontSize',14);
    text(30,100,'a thousand times over.','FontSize',14);
    text(80,150,'¡ª¡ª  The Kite Runner','FontSize',12);
	text(80,180,handles.versioninfo,'FontSize',12);

	try load('../data/boyanddog.mat')
	catch
		warning('Data Missing: ../data/boyanddog.mat.');
		flag = 1;
		axes(handles.axes2);
		spy;
		axis off;
	end
	if ~flag
		axes(handles.axes2);
		imshow(boyanddog-floor(boyanddog));
		axis off;
	end
else
	axes(handles.axes1);
	spy;
	axis off;
	axes(handles.axes2);
	imshow(ones(256)*0.94);
    text(40,50,'For you,','FontSize',14);
    text(40,100,'a thousand times over.','FontSize',14);
    text(100,150,'¡ª¡ª  The Kite Runner','FontSize',12);
	text(100,180,handles.versioninfo,'FontSize',12);
end

% Choose default command line output for DIPDemo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIPDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIPDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->´ò¿ªÎÄ¼þ
	%if handles.lock
	%	errordlg('Error£ºÍ¼Ïñ±»Ëø¶¨£¡','´íÎó');
	%	return;
	%end
	%handles.lock = 1;
	if handles.getflag | handles.putflag
		choice = questdlg('ÖØÐÂ´ò¿ª½«»á¸²¸ÇÖ®Ç°ÎÄ¼þ£¬ÊÇ·ñ¼ÌÐø£¿',...
					'´ò¿ªÎÄ¼þ','ÊÇ(Y)','·ñ(N)',...
					'ÊÇ(Y)');
		if isempty(choice)
			warndlg('Ô­ÎÄ¼þ±»¸²¸Ç!','¾¯¸æ');
		elseif strcmp(choice,'·ñ(N)')
			return;
		end
	end
	[filename, pathname] = uigetfile(...
		{'*.bmp';'*.jpg';'*.png';'*.tif';'*.*'},...
		'´ò¿ªÎÄ¼þ',...
		'../data/Lena_color.bmp',...
		'MultiSelect','off');
	if isequal(filename,0)
		warndlg('Warning£ºÍ¼ÏñÎ´´ò¿ª£¡','¾¯¸æ');
		return;
	end
	file = fullfile(pathname,filename);
	handles.srcimg = imread(file);
	handles.rstimg = handles.srcimg;
	handles.getflag = 1;
	handles.putflag = 1;
	handles.srcimgD = size(handles.srcimg,3);
	if handles.srcimgD == 3
		handles.grayimg = rgb2gray(handles.srcimg);
	else
		handles.grayimg = handles.srcimg;
	end
	axes(handles.axes1);
	imshow(handles.srcimg);
	title('¶ÁÈëÍ¼Ïñ');
	
	axes(handles.axes2);
	imshow(ones(256)*0.94);
	%handles.lock = 0;
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->±£´æÍ¼Ïñ


% --------------------------------------------------------------------
function Untitled_83_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->±£´æÍ¼Ïñ->±£´æ×óÍ¼
	if ~handles.putflag
		h = warndlg('Warning£ºÉÐÎ´´ò¿ªÍ¼Ïñ£¡','¾¯¸æ');
		while ishandle(h)
			pause(1);
		end
	end
	[filename, pathname] = uiputfile(...
		{'*.bmp';'*.jpg';'*.png';'*.tif';'*.*'},...
		'±£´æ×óÍ¼',...
		'../data/newfile.bmp');
	if isequal(filename,0)
		warndlg('Warning£ºÍ¼ÏñÎ´±£´æ£¡','¾¯¸æ');
	else
		file = fullfile(pathname,filename);
		h = getframe(handles.axes1);
		imwrite(h.cdata,file);
	end
	%guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_84_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->±£´æÍ¼Ïñ->±£´æÓÒÍ¼
	if ~handles.putflag
		h = warndlg('Warning£ºÉÐÎ´´ò¿ªÍ¼Ïñ£¡','¾¯¸æ');
		while ishandle(h)
			pause(1);
		end
	end
	[filename, pathname] = uiputfile(...
		{'*.bmp';'*.jpg';'*.png';'*.tif';'*.*'},...
		'±£´æÓÒÍ¼',...
		'../data/newfile.png');
	if isequal(filename,0)
		warndlg('Warning£ºÍ¼ÏñÎ´±£´æ£¡','¾¯¸æ');
	else
		file = fullfile(pathname,filename);
		h = getframe(handles.axes2);
		imwrite(h.cdata,file);
	end
	%guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->¹Ø±Õ
	handles.getflag = 0;
	handles.putflag = 0;
	handles.srcimgD = 0;
	handles.freqflag = 0;
	handles.lock = 0;
	handles.srcimg = [];
	handles.grayimg = [];
	handles.rstimg = [];
	handles.freqimg = [];
	guidata(hObject, handles);
	axes(handles.axes1);
	spy
	axis off;
	axes(handles.axes2);
	imshow(ones(256)*0.94);
	text(2,20,'ÊÀ½çÓÚÄã¶øÑÔ£¬ÎÞÒâÒåÎÞÄ¿µÄ£¬','FontSize',13);
	text(2,40,'È´ÓÖ³äÂúËæÐÄËùÓûµÄ»ÃÏë£¬','FontSize',13);
	text(2,60,'µ«ÓÖÓÐË­ÖªµÀ£¬','FontSize',13);
	text(2,80,'Ò²Ðí¾ÍÔÚÕâ¸öÃÆÈÈÁîÈËÆ£¾ëµÄÕýÎç£¬','FontSize',13);
	text(2,100,'ÄÇ¸öÄ°ÉúÈË£¬','FontSize',13);
	text(2,120,'Ìá×ÅÂúÀºÆæÃîµÄ»õÎï£¬Â·¹ýÄãµÄÃÅÇ°£¬','FontSize',13);
	text(2,140,'ËûÏìÁÁµØ½ÐÂô×Å£¬','FontSize',13);
	text(2,160,'Äã¾Í»á´ÓëüëÊÖÐ¾ªÐÑ£¬','FontSize',13);
	text(2,180,'×ß³ö·¿ÃÅ£¬','FontSize',13);
	text(2,200,'Ó­½ÓÃüÔËµÄ°²ÅÅ¡£','FontSize',13);
	text(80,230,'¡ª¡ª Ì©¸ê¶û¡¤¡¶°®ÕßÖ®êÝ¡·','FontSize',12);
	text(80,250,handles.versioninfo,'FontSize',12);
	


% --------------------------------------------------------------------
function Untitled_88_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->½á¹ûÖØÖÃ
	handles.rstimg = handles.srcimg;
	handles.lock = 0;
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_94_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->°æ±¾ÐÅÏ¢
	axes(handles.axes2);
	spy
	axis off;
	axes(handles.axes1);
	imshow(ones(256)*0.94);
    text(20,50,'³¤¾±Â¹ÊÇÒ»Í·','FontSize',14);
    text(60,100,'ÒòÎªºÃÆæ¶øÉì³¤²±×ÓµÄÂí¡£','FontSize',14);
    text(90,150,'¡ª¡ª  ¸êÂóË¹ ¡¶ÇòÍÙ¼¯¡·','FontSize',12);
	text(90,180,handles.versioninfo,'FontSize',12);


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
	% ÎÄ¼þ->ÍË³ö
	handles.getflag = 0;
	handles.putflag = 0;
	handles.srcimgD = 0;
	handles.lock = 0;
	handles.srcimg = [];
	handles.grayimg = [];
	handles.rstimg = [];
	handles.freqimg = [];
	guidata(hObject, handles);
	close all, clc;


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼->»Ò¶ÈÖ±·½Í¼
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');

	axes(handles.axes2);
	h = imhist(handles.grayimg);
	horz = linspace(0,255,256);
	bar(horz,h);
	axis([0,255,0,1.1*max(h)]);
	title('»Ò¶ÈÖ±·½Í¼');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼->Ö±·½Í¼¾ùºâ»¯


% --------------------------------------------------------------------
function Untitled_25_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼->Ö±·½Í¼¾ùºâ»¯->È«¾Ö¾ùºâ»¯
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	handles.rstimg = histeq(handles.grayimg,256);
	axes(handles.axes1);
	imshow(handles.rstimg);
	title('È«¾Ö¾ùºâ»¯ºó»Ò¶ÈÍ¼');

	axes(handles.axes2);
	h = imhist(handles.rstimg);
	horz = linspace(0,255,256);
	bar(horz,h);
	axis([0,255,0,1.1*max(h)]);
	title('È«¾Ö¾ùºâ»¯ºóÖ±·½Í¼');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼->Ö±·½Í¼¾ùºâ»¯->¾Ö²¿¾ùºâ»¯
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'ÇëÊäÈë¾Ö²¿±ÈÀýn£¨2<=n<=min(H,W)/2£©£º';...
			'ÇøÓòÖØµþflag£¨''ÊÇ''Ìî1,''·ñ''Ìî0£©£º'};
	defaultans = {'6','0'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	N = str2num(answer{1});
	flag = str2num(answer{2});
	[H,W] = size(handles.grayimg);
	if flag~=1 && flag ~= 0
		errordlg('Error£º·Ç·¨È¡Öµ£º²ÎÊýflag£¡','´íÎó');
		return;
	elseif N < 1 || N > floor(min(H,W)/2)
		errordlg('Error£º·Ç·¨È¡Öµ£º¾Ö²¿±ÈÀýn£¡','´íÎó');
		return;
	elseif N==1 && flag == 1
		flag = 0;
		warndlg('Warning£ºÇøÓòÖØµþflagÒÑÖØÖÃÎª0£¡','¾¯¸æ');
	end

	HL = floor(H/N);
	WL =  floor(W/N);
	if ~flag
		L = N;
		ishift = HL;
		jshift = WL;
	else
		L = 2*N-1;
		ishift = floor(HL/2);
		jshift = floor(WL/2);
	end
	indi = 1:HL;
	for ki = 1:L
		if ki > 1
			indi = indi + ishift;
		end
		if ki == L
			indi = indi(1):H;
		end
		indj = 1:WL;
		for kj = 1:L
			if kj > 1
				indj = indj + jshift;
			end
			if kj == L
				indj = indj(1):W;
			end
			
			tmpblock = handles.grayimg(indi,indj);
			maxv = max(tmpblock(:));
			minv = min(tmpblock(:));
			nlevl = min(ceil(1.5*double(maxv-minv)),256);
			handles.rstimg(indi,indj) = histeq(tmpblock,nlevl);
		end
	end
	
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('¾Ö²¿¾ùºâ»¯ºó»Ò¶ÈÍ¼');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_85_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼->Ö±·½Í¼¾ùºâ»¯->×ÔÊÊÓ¦¾ùºâ»¯
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'ÐÐÐ¡Æ¬Êýr£¨r>=2£©£º';...
			  'ÁÐÐ¡Æ¬Êýc£¨c>=2£©£º';...
			  '¶Ô±È¶ÈÔöÇ¿ÏÞÖÆa£¨0<a<1£©£º'};
	defaultans = {'8','8','0.01'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	r = str2num(answer{1});
	c = str2num(answer{2});
	a = str2num(answer{3});
	handles.rstimg = adapthisteq(handles.grayimg,...
				'NumTiles',[r c],'ClipLimit',a);
	axes(handles.axes1);
	imshow(handles.rstimg);
	title('×ÔÊÊÓ¦¾ùºâ»¯ºó»Ò¶ÈÍ¼');

	axes(handles.axes2);
	h = imhist(handles.rstimg);
	horz = linspace(0,255,256);
	bar(horz,h);
	axis([0,255,0,1.1*max(h)]);
	title('×ÔÊÊÓ¦¾ùºâ»¯ºóÖ±·½Í¼');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼->SML¹æ¶¨»¯



% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
	% Ö±·½Í¼->GML¹æ¶¨»¯


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
	% »Ò¶ÈÓ³Éä


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
	% »Ò¶ÈÓ³Éä->Í¼ÏñÇó·´


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
	% »Ò¶ÈÓ³Éä->¶Ô±È¶ÈÔöÇ¿


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
	% »Ò¶ÈÓ³Éä->¶¯Ì¬·¶Î§Ñ¹Ëõ

% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
	% »Ò¶ÈÓ³Éä->Ù¤ÂíÐ£Õý

% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷


% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->À­ÆÕÀ­Ë¹Ëã×Ó
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	choice = questdlg('ÄúÒªÑ¡ÔñÄÄÖÖÀ­ÆÕÀ­Ë¹Ä£°å£¿',...
		'Ñ¡ÔñÄ£°å','Èñ»¯','¼âÈñ',...
		'Èñ»¯');
	if isempty(choice)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	switch choice
		case 'Èñ»¯'
			w = [0 -1 0;-1 4 -1;0 -1 0];
		case '¼âÈñ'
			w = [-1 -1 -1;-1 8 -1;-1 -1 -1];
	end
	tmpimg = im2double(handles.grayimg);
	lapimg = imfilter(tmpimg, w, 'symmetric');
	handles.rstimg = im2uint8(tmpimg+lapimg);
	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('À­ÆÕÀ­Ë¹Èñ»¯Ð§¹û');
	figure; imshow(lapimg);
	title('À­ÆÕÀ­Ë¹ÂË²¨½á¹û');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->¸ßÆµÌáÉýÈñ»¯
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	w = ones(3)./9;
	tmpimg = im2double(handles.grayimg);
	avgimg = imfilter(tmpimg, w, 'symmetric');
	handles.rstimg = im2uint8(2*tmpimg-avgimg);
	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('¸ßÆµÌáÉýÈñ»¯Ð§¹û');
	figure; imshow(avgimg);
	title('Æ½»¬½á¹û');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->»ùÓÚÌÝ¶ÈÈñ»¯
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	choice = questdlg('ÄúÒªÑ¡ÔñµÄÌÝ¶ÈÄ£°å·½Ïò£¿',...
		'Ñ¡ÔñÄ£°å','Y·½Ïò','X·½Ïò','×ÛºÏ',...
		'×ÛºÏ');
	if isempty(choice)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	tmpimg = im2double(handles.grayimg);
	switch choice
		case 'Y·½Ïò'
			w = [1 1 1;0 0 0;-1 -1 -1];
			gradimg = imfilter(tmpimg, w, 'symmetric');
		case 'X·½Ïò'
			w = [-1 0 1;-1 0 1;-1 0 1];
			gradimg = imfilter(tmpimg, w, 'symmetric');
		case '×ÛºÏ'
			w = [1 1 1;0 0 0;-1 -1 -1];
			gradimg1 = imfilter(tmpimg, w, 'symmetric');
			gradimg2 = imfilter(tmpimg, -w.', 'symmetric');
			gradimg = sqrt(gradimg1.^2+gradimg2.^2);
	end
	
	handles.rstimg = im2uint8(tmpimg+0.2*gradimg);
	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('»ùÓÚÌÝ¶ÈÈñ»¯Ð§¹û');
	figure; imshow(gradimg);
	title(['Í¼Ïñ',choice,'ÌÝ¶È']);
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->×î´ó-×îÐ¡Èñ»¯
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'ÁÚÓòÐÐÊým£¨m>=2£©£º';...
			  'ÁÚÓòÁÐÊýn£¨n>=2£©£º'};
	defaultans = {'3','3'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	m = floor(str2num(answer{1}));
	n = floor(str2num(answer{2}));
	
	tmpimg = handles.grayimg;
	imgmax = ordfilt2(tmpimg, m*n, ones(m,n));
	imgminmax = ordfilt2(tmpimg, 1, ones(m,n));
	ind = imgmax-tmpimg<tmpimg-imgminmax;
	tmpimg = imgminmax;
	imgminmax(ind) = imgmax(ind);
	handles.rstimg = imgminmax;

	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('×îÐ¡-×î´óÈñ»¯Ð§¹û');
	figure; 
	subplot(1,2,1);imshow(tmpimg);title(['×îÐ¡ÖµÂË²¨Ð§¹û']);
	subplot(1,2,2);imshow(imgmax);title(['×î´óÖµÂË²¨Ð§¹û']);
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->ÁÚÓòÆ½¾ùÆ½»¬
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'ÁÚÓòÐÐÊým£¨m>=2£©£º';...
			  'ÁÚÓòÁÐÊýn£¨n>=2£©£º'};
	defaultans = {'3','3'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	m = floor(str2num(answer{1}));
	n = floor(str2num(answer{2}));
	w = ones(m,n)./(m*n);
	tmpimg = im2double(handles.grayimg);
	avgimg = imfilter(tmpimg, w, 'symmetric');
	handles.rstimg = im2uint8(avgimg);

	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('ÁÚÓòÆ½¾ùÆ½»¬Ð§¹û');
	guidata(hObject, handles);



% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->¸ßË¹Æ½¾ùÆ½»¬
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'ÁÚÓòÐÐÊým£¨m>=2£©£º';...
			  'ÁÚÓòÁÐÊýn£¨n>=2£©£º';...
			  '±ê×¼Æ«ÒÆsig (sig>0)£º'};
	defaultans = {'3','3','0.5'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	m = floor(str2num(answer{1}));
	n = floor(str2num(answer{2}));
	sig = str2num(answer{3});
	w = fspecial('gaussian',[m n],sig);
	tmpimg = im2double(handles.grayimg);
	gausimg = imfilter(tmpimg, w, 'symmetric');
	handles.rstimg = im2uint8(gausimg);

	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('¸ßË¹Æ½¾ùÆ½»¬Ð§¹û');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->2-DÖÐÖµÂË²¨
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'ÁÚÓòÐÐÊým£¨m>=2£©£º';...
			  'ÁÚÓòÁÐÊýn£¨n>=2£©£º'};
	defaultans = {'3','3'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	m = floor(str2num(answer{1}));
	n = floor(str2num(answer{2}));
	medianimg = medfilt2(handles.grayimg,[m n],'symmetric');
	handles.rstimg = medianimg;

	axes(handles.axes1);
	imshow(handles.grayimg);
	title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);
	title('2-DÖÐÖµÂË²¨Ð§¹û');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_24_Callback(hObject, eventdata, handles)
	% Ä£°å²Ù×÷->»ìºÏÂË²¨


% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿


% --------------------------------------------------------------------
function Untitled_28_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->¸µÀïÒ¶ÆµÆ×Í¼
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = fft2(handles.grayimg);
	handles.freqimg = tmpimg;
	handles.freqflag = 1;
	tmpimg = log(1+abs(fftshift(tmpimg)));
	axes(handles.axes1)
	imshow(handles.grayimg);title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2)
	imshow(tmpimg,[]);title('¸µÀïÒ¶ÆµÆ×Í¼');


% --------------------------------------------------------------------
function Untitled_29_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->µÍÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_30_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->µÍÍ¨ÂË²¨->ÀíÏëµÍÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_31_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->µÍÍ¨ÂË²¨->°ÍÌØÎÖË¹µÍÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_32_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->µÍÍ¨ÂË²¨->ÌÝÐÎµÍÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_33_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->µÍÍ¨ÂË²¨->Ö¸ÊýµÍÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_34_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->¸ßÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_35_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->¸ßÍ¨ÂË²¨->ÀíÏë¸ßÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_36_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->¸ßÍ¨ÂË²¨->°ÍÌØÎÖË¹¸ßÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_37_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->¸ßÍ¨ÂË²¨->¸ßÆµÔöÇ¿ÂË²¨


% --------------------------------------------------------------------
function Untitled_38_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->¸ßÍ¨ÂË²¨->ÌÝÐÎ¸ßÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_39_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->¸ßÍ¨ÂË²¨->Ö¸Êý¸ßÍ¨ÂË²¨


% --------------------------------------------------------------------
function Untitled_40_Callback(hObject, eventdata, handles)
	% ÆµÓòÔöÇ¿->Í¬Ì¬ÂË²¨


% --------------------------------------------------------------------
function Untitled_41_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´


% --------------------------------------------------------------------
function Untitled_42_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´->Ôö¼ÓÔëÉù


% --------------------------------------------------------------------
function Untitled_43_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´->Ôö¼ÓÔëÉù->¸ßË¹ÔëÉù


% --------------------------------------------------------------------
function Untitled_44_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´->Ôö¼ÓÔëÉù->½·ÑÎÔëÉù


% --------------------------------------------------------------------
function Untitled_45_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´->Ôö¼ÓÔëÉù->¾ùÔÈÔëÉù


% --------------------------------------------------------------------
function Untitled_46_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´->¼ôÇÐ¾ùÖµÂË²¨


% --------------------------------------------------------------------
function Untitled_47_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´->Î¬ÄÉÂË²¨


% --------------------------------------------------------------------
function Untitled_48_Callback(hObject, eventdata, handles)
	% ÏûÔë»Ö¸´->ÓÐÔ¼Êø×îÐ¡Æ½·½


% --------------------------------------------------------------------
function Untitled_49_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»


% --------------------------------------------------------------------
function Untitled_50_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->Ë³Ê±ÕëÐý×ª90¡ã
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = rot90(handles.rstimg,3);
	handles.rstimg = tmpimg;
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('Ðý×ªÍ¼Ïñ');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_51_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->ÄæÊ±ÕëÐý×ª90¡ã
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = rot90(handles.rstimg,1);
	handles.rstimg = tmpimg;
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('Ðý×ªÍ¼Ïñ');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_52_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->·Å´ó25%
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = imresize(handles.rstimg,1.25);
	handles.rstimg = tmpimg;
	[H,W,~] = size(handles.srcimg);
	axes(handles.axes1);
	imshow(handles.srcimg);
	title(['¶ÁÈëÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	[H,W,~] = size(handles.rstimg);
	figure;
	imshow(handles.rstimg);
	title(['·Å´óÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_53_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->ËõÐ¡25%
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = imresize(handles.rstimg,0.75);
	handles.rstimg = tmpimg;
	[H,W,~] = size(handles.srcimg);
	axes(handles.axes1);
	imshow(handles.srcimg);
	title(['¶ÁÈëÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	[H,W,~] = size(handles.rstimg);
	figure;
	imshow(handles.rstimg);
	title(['ËõÐ¡Í¼Ïñ(',num2str(H),'x',num2str(W),')']);
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_86_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->ÉÏÏÂ·­×ª
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = flipud(handles.rstimg);
	handles.rstimg = tmpimg;
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('·­×ªÍ¼Ïñ');
	guidata(hObject, handles);

% --------------------------------------------------------------------
function Untitled_87_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->×óÓÒ·­×ª
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = fliplr(handles.rstimg);
	handles.rstimg = tmpimg;
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('·­×ªÍ¼Ïñ');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_54_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->Ðý×ª
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'Ðý×ª¶ÈÊý(Ë³Ê±ÕëÎªÕý£¬ÄæÊ±ÕëÎª¸º)£º'};
	defaultans = {'45'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	theta = floor(str2num(answer{1}));
	tform = affine2d([cosd(theta) -sind(theta) 0;...
					sind(theta) cosd(theta) 0;...
					0 0 1]);
	handles.rstimg = imrotate(handles.srcimg,theta,'bilinear');
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('Ðý×ªÍ¼Ïñ');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_55_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->·ÅËõ
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'X·½ÏòËõ·Å±¶ÊýSx(Sx>0)£º';...
			  'Y·½ÏòËõ·Å±¶ÊýSy(Sy>0)£º'};
	defaultans = {'0.75','0.75'};
	answer = inputdlg(prompt,'Input',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	Sx = str2num(answer{1});
	Sy = str2num(answer{2});
    [H,W,~] = size(handles.srcimg);
	Sx = ceil(H*Sx);
	Sy = ceil(W*Sy);
	if ~Sx&&~Sy
		errordlg('Error£ºËõ·ÅÏµÊýÓ¦µ±´óÓÚ0£¡','´íÎó');
		return;
	end
	handles.rstimg = imresize(handles.srcimg,[Sx,Sy]);
	axes(handles.axes1);
	imshow(handles.srcimg);
	title(['¶ÁÈëÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	[H,W,~] = size(handles.rstimg);
	figure(1);
	imshow(handles.rstimg);
	title(['Ëõ·ÅÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_56_Callback(hObject, eventdata, handles)
	% ·ÂÉä±ä»»->Æ½ÒÆ
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'XÆ½ÒÆÁ¿(×óÒÆÎª¸º£¬ÓÒÒÆÎªÕý)£º';...
			  'YÆ½ÒÆÁ¿(ÉÏÒÆÎª¸º£¬ÏÂÒÆÎªÕý)£º'};
	defaultans = {'50','50'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	delx = floor(str2num(answer{1}));
	dely = floor(str2num(answer{2}));
	[H,W] = size(handles.srcimg);
	if abs(delx)>H || abs(dely)>W
		errordlg('Error:Æ½ÒÆÁ¿¹ý´ó!','´íÎó');
		return;
	end
	se = translate(strel(1), [delx,dely]);
	handles.rstimg = imdilate(handles.srcimg,se);
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('Æ½ÒÆÍ¼Ïñ');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_57_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë


% --------------------------------------------------------------------
function Untitled_58_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë->±ä»»±àÂë


% --------------------------------------------------------------------
function Untitled_59_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë->±ä»»±àÂë->DCT±ä»»
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = dct2(handles.grayimg);
	handles.rstimg = tmpimg;
	axes(handles.axes1);
	imshow(handles.grayimg);title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(log10(abs(handles.rstimg)));title('DCTÆ×Í¼');
	tmp=caxis;colormap(gca,jet(64));
	colorbar('Location','eastoutside',...
			 'Position',[0.92,0.15,0.02,0.7]);
	guidata(hObject,handles);

	choice = questdlg('ÊÇ·ñÌÞ³ý¹ýÐ¡µÄDCTÏµÊý£¿',...
					  'ÖØ½¨', 'ÊÇ(Y)','·ñ(N)',...
					  'ÊÇ(Y)');
	if isempty(choice) || strcmp(choice,'·ñ(N)')
		return;
	end
	prompt = {'ÉèÖÃDCTÏµÊýÌÞ³ýãÐÖµ£º'};
	defaultans = {'10'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end

	boundry = str2num(answer{1});
	tmpdct = tmpimg;
	tmpdct(abs(tmpimg) < boundry) = 0.01;
	tmpimg = uint8(idct2(tmpdct));
	RMSE = (handles.grayimg-tmpimg).^2;
	RMSE = sqrt(mean(RMSE(:)));
	figure;
	subplot(1,2,1);imshow(tmpimg);
	title(['ÌÞ³ýÐ¡ÏµÊýºóÍ¼Ïñ,RMSE:',num2str(RMSE)]);
	subplot(1,2,2);imshow(log10(abs(tmpdct)),[]);
	title('ÌÞ³ýÐ¡ÏµÊýºóDCTÆ×Í¼');
	caxis(tmp);colormap(gca,jet(64));
	colorbar('Location','eastoutside',...
			 'Position',[0.92,0.3,0.02,0.45]);


% --------------------------------------------------------------------
function Untitled_60_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë->±ä»»±àÂë->DWT±ä»»
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	prompt = {'Ð¡²¨·Ö½â¼¶ÊýN£º';...
			  'Ð¡²¨»ùwname£º'};
	defaultans = {'1','db1'};
	answer = inputdlg(prompt,'ÊäÈë',1,defaultans);
	if isempty(answer)
		warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
		return;
	end
	N = str2num(answer{1});
	wname = answer{2};
	if N<0
		errordlg('Error£º·Ö½â¼¶ÊýÓ¦µ±´óÓÚ0£¡','´íÎó');
		return;
	elseif N > 3
		choice = questdlg('·Ö½â¼¶Êý½Ï´ó£¬ÊÇ·ñ¼ÌÐø£¿',...
						'¸ü¸Ä¼¶Êý', 'ÊÇ(Y)','¸ü¸ÄÉèÖÃ(N)',...
						'¸ü¸ÄÉèÖÃ(N)');
		if isempty(choice)
			warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
			return;
		elseif strcmp(choice,'¸ü¸ÄÉèÖÃ(N)')
			newanswer = inputdlg({'¸ü¸Ä¼¶ÊýÎª£º'},'¸ü¸Ä',1,{'2'});
			if isempty(newanswer)
				warndlg('Warning:²Ù×÷ÒÑÈ¡Ïû!','¾¯¸æ');
				return;
			end
			N = str2num(newanswer{1});
		end
    end
	[c,s] = wavedec2(handles.grayimg,N,wname);
	for k = 1:N
		sk = num2str(k);
		Hk = ['H',sk];Himg = [Hk,'img'];
		Vk = ['V',sk];Vimg = [Vk,'img'];
		Dk = ['D',sk];Dimg = [Dk,'img'];
		Ak = ['A',sk];Aimg = [Ak,'img'];
		eval(['[',Hk,',',Vk,',',Dk,'] = detcoef2(''all'',c,s,',sk,');']);
		eval([Ak,' = appcoef2(c,s,wname,',sk,');']);
		eval([Vimg,' = wcodemat(',Vk,',255,''mat'',1);']);
		eval([Himg,' = wcodemat(',Hk,',255,''mat'',1);']);
		eval([Dimg,' = wcodemat(',Dk,',255,''mat'',1);']);
		eval([Aimg,' = wcodemat(',Ak,',255,''mat'',1);']);
	end
	eval(['tmpimg = A',num2str(N),'img;']);
	for k = N:-1:1
		sk = num2str(k);
		Himg = ['H',sk,'img'];Vimg = ['V',sk,'img'];
		Dimg = ['D',sk,'img'];
		eval(['tmpimg = [tmpimg',',',Himg,';',Vimg,',',Dimg,'];']);
	end
	handles.rstimg = uint8(tmpimg);

	axes(handles.axes1);
	imshow(handles.grayimg);title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('DWTÆ×Í¼');
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_61_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë->±ä³¤±àÂë->

% --------------------------------------------------------------------
function Untitled_62_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë->±ä³¤±àÂë->¹þ·òÂü±àÂë


% --------------------------------------------------------------------
function Untitled_63_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë->±ä³¤±àÂë->ÏãÅ©-·¨Åµ±àÂë


% --------------------------------------------------------------------
function Untitled_64_Callback(hObject, eventdata, handles)
	% Í¼Ïñ±àÂë->±ä³¤±àÂë->ËãÊõ±àÂë


% --------------------------------------------------------------------
function Untitled_65_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ


% --------------------------------------------------------------------
function Untitled_66_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»


% --------------------------------------------------------------------
function Untitled_80_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->RGB2HSV
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	tmpimg = im2double(handles.srcimg);
	handles.rstimg = rgb2hsv(tmpimg);
	handles.lock = 1;
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('RGB2HSVÍ¼Ïñ');
	tags = {'R','G','B','H','S','V'};
	figure;
	for i = 1:3
		subplot(2,3,i);imshow(handles.srcimg(:,:,i));
		title(tags{i});
		subplot(2,3,i+3);imshow(handles.rstimg(:,:,i));
		title(tags{i+3})
	end
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_89_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->HSV2RGB
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	if handles.lock ~= 1
		choice = questdlg('»º´æÍ¼Ïñ¿ÉÄÜ²»ÊÇHSVÍ¼Ïñ£¡ÊÇ·ñ¼ÌÐø¸Ã²Ù×÷£¿',...
				'Òì³£','·ñ(N)','ÊÇ(Y)',...
				'·ñ(N)');
		if isempty(choice) || strcmp(choice,'·ñ(N)')
			return;
		end
	end
	handles.lock = 0;
	tmpimg = im2double(handles.rstimg);
	handles.rstimg = im2uint8(hsv2rgb(tmpimg));
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('HSV2RGBÍ¼Ïñ');
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_81_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->RGB2CMY
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	handles.lock = 2;
	handles.rstimg = imcomplement(handles.srcimg);
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('RGB2CMYÍ¼Ïñ');
	tags = {'R','G','B','C','M','Y'};
	figure;
	for i = 1:3
		subplot(2,3,i);imshow(handles.srcimg(:,:,i));
		title(tags{i});
		subplot(2,3,i+3);imshow(handles.rstimg(:,:,i));
		title(tags{i+3})
	end
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_90_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->CMY2RGB
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	if handles.lock ~= 2
		choice = questdlg('»º´æÍ¼Ïñ¿ÉÄÜ²»ÊÇCMYÍ¼Ïñ£¡ÊÇ·ñ¼ÌÐø¸Ã²Ù×÷£¿',...
				'Òì³£','·ñ(N)','ÊÇ(Y)',...
				'·ñ(N)');
		if isempty(choice) || strcmp(choice,'·ñ(N)')
			return;
		end
	end
	handles.lock = 0;
	handles.rstimg = imcomplement(handles.rstimg);
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('CMY2RGBÍ¼Ïñ');
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_82_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->RGB2HSI
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	handles.lock = 3;
	tmpimg = im2double(handles.srcimg);
	handles.rstimg = im2uint8(rgb2hsi(tmpimg));
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('RGB2HSIÍ¼Ïñ');
	tags = {'R','G','B','H','S','I'};
	figure;
	for i = 1:3
		subplot(2,3,i);imshow(handles.srcimg(:,:,i));
		title(tags{i});
		subplot(2,3,i+3);imshow(handles.rstimg(:,:,i));
		title(tags{i+3})
	end
	guidata(hObject,handles);



% --------------------------------------------------------------------
function Untitled_91_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->HSI2RGB
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	if handles.lock ~= 3
		choice = questdlg('»º´æÍ¼Ïñ¿ÉÄÜ²»ÊÇHSIÍ¼Ïñ£¡ÊÇ·ñ¼ÌÐø¸Ã²Ù×÷£¿',...
				'Òì³£','·ñ(N)','ÊÇ(Y)',...
				'·ñ(N)');
		if isempty(choice) || strcmp(choice,'·ñ(N)')
			return;
		end
	end
	handles.lock = 0;
	tmpimg = im2double(handles.rstimg);
	handles.rstimg = im2uint8(hsi2rgb(tmpimg));
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('HSI2RGBÍ¼Ïñ');
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_92_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->RGB2YCbCr
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	handles.lock = 4;
	tmpimg = im2double(handles.srcimg);
	handles.rstimg = im2uint8(rgb2ycbcr(handles.srcimg));
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('RGB2YCbCrÍ¼Ïñ');
	tags = {'R','G','B','Y','Cb','Cr'};
	figure;
	for i = 1:3
		subplot(2,3,i);imshow(handles.srcimg(:,:,i));
		title(tags{i});
		subplot(2,3,i+3);imshow(handles.rstimg(:,:,i));
		title(tags{i+3})
	end
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_93_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÑÕÉ«¿Õ¼ä±ä»»->YCbCr2RGB
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	if handles.srcimgD ~=3
		errordlg('Error£º±»×ª»»Í¼Ïñ±ØÐëÊÇRGBÍ¼Ïñ£¡','´íÎó');
		return;
	end
	if handles.lock ~= 4
		choice = questdlg('»º´æÍ¼Ïñ¿ÉÄÜ²»ÊÇYCbCrÍ¼Ïñ£¡ÊÇ·ñ¼ÌÐø¸Ã²Ù×÷£¿',...
				'Òì³£','·ñ(N)','ÊÇ(Y)',...
				'·ñ(N)');
		if isempty(choice) || strcmp(choice,'·ñ(N)')
			return;
		end
	end
	handles.lock = 0;
	tmpimg = im2double(handles.rstimg);
	handles.rstimg = im2uint8(ycbcr2rgb(handles.rstimg));
	axes(handles.axes1);
	imshow(handles.srcimg);title('RGBÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('YCbCr2RGBÍ¼Ïñ');
	guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_67_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->Î±²ÊÉ«ÔöÇ¿


% --------------------------------------------------------------------
function Untitled_68_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÁÁ¶ÈÔöÇ¿


% --------------------------------------------------------------------
function Untitled_69_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->±¥ºÍ¶ÈÔöÇ¿


% --------------------------------------------------------------------
function Untitled_70_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->É«µ÷ÔöÇ¿


% --------------------------------------------------------------------
function Untitled_71_Callback(hObject, eventdata, handles)
	% ²ÊÉ«Í¼Ïñ->ÖÐÖµÂË²¨(±ßÔµÅÅÐò)


% --------------------------------------------------------------------
function Untitled_72_Callback(hObject, eventdata, handles)
	% ÊÓÆµ´¦Àí


% --------------------------------------------------------------------
function Untitled_73_Callback(hObject, eventdata, handles)
	% ÊÓÆµ´¦Àí->ÔË¶¯¼ì²â


% --------------------------------------------------------------------
function Untitled_74_Callback(hObject, eventdata, handles)
	% ÊÓÆµ´¦Àí->ÔË¶¯¼ì²â->»ùÓÚÍ¼Ïñ²î


% --------------------------------------------------------------------
function Untitled_75_Callback(hObject, eventdata, handles)
	% ÊÓÆµ´¦Àí->ÔË¶¯¼ì²â->»ùÓÚÄ£ÐÍ


% --------------------------------------------------------------------
function Untitled_76_Callback(hObject, eventdata, handles)
	% ÊÓÆµ´¦Àí->ÔË¶¯¼ì²â->ÆµÂÊÓò


% --------------------------------------------------------------------
function Untitled_77_Callback(hObject, eventdata, handles)
	% ¶à³ß¶È´¦Àí


% --------------------------------------------------------------------
function Untitled_78_Callback(hObject, eventdata, handles)
	% ¶à³ß¶È´¦Àí->¸ßË¹-À­ÆÕÀ­Ë¹½ð×ÖËþ


% --------------------------------------------------------------------
function Untitled_79_Callback(hObject, eventdata, handles)
	% ¶à³ß¶È´¦Àí->¶à³ß¶ÈÐ¡²¨


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
	% ÎÄ¼þ->´ò¿ªÎÄ¼þ
	if handles.getflag | handles.putflag
		choice = questdlg('ÖØÐÂ´ò¿ª½«»á¸²¸ÇÖ®Ç°ÎÄ¼þ£¬ÊÇ·ñ¼ÌÐø£¿',...
					'´ò¿ªÎÄ¼þ','ÊÇ(Y)','·ñ(N)',...
					'ÊÇ(Y)');
		if isempty(choice)
			warndlg('Ô­ÎÄ¼þ±»¸²¸Ç!','¾¯¸æ');
		elseif strcmp(choice,'·ñ(N)')
			return;
		end
	end
	[filename, pathname] = uigetfile(...
		{'*.bmp';'*.jpg';'*.png';'*.tif';'*.*'},...
		'´ò¿ªÎÄ¼þ',...
		'../data/Lena_color.bmp',...
		'MultiSelect','off');
	if isequal(filename,0)
		warndlg('Warning£ºÍ¼ÏñÎ´´ò¿ª£¡','¾¯¸æ');
		return;
	end
	file = fullfile(pathname,filename);
	handles.srcimg = imread(file);
	handles.rstimg = handles.srcimg;
	handles.getflag = 1;
	handles.putflag = 1;
	handles.srcimgD = size(handles.srcimg,3);
	if handles.srcimgD == 3
		handles.grayimg = rgb2gray(handles.srcimg);
	else
		handles.grayimg = handles.srcimg;
	end
	axes(handles.axes1);
	imshow(handles.srcimg);
	title('¶ÁÈëÍ¼Ïñ');
	
	axes(handles.axes2);
	imshow(ones(256)*0.94);
	
	guidata(hObject, handles);

% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->±£´æÎÄ¼þ
	if ~handles.putflag
		errordlg('Error£ºÃ»ÓÐ¿É±£´æµÄ½á¹ûÍ¼Ïñ£¡','´íÎó');
		return;
	end
	[filename, pathname] = uiputfile(...
		{'*.bmp';'*.jpg';'*.png';'*.tif';'*.*'},...
		'±£´æ½á¹ûÍ¼Ïñ',...
		'../data/newfile.bmp');
	if isequal(filename,0)
		warndlg('Warning£ºÍ¼ÏñÎ´±£´æ£¡','¾¯¸æ');
	else
		file = fullfile(pathname,filename);
		imwrite(handles.rstimg,file);
	end
	%guidata(hObject, handles);



% --------------------------------------------------------------------
function uitoggletool1_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->·Å´ó25%
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = imresize(handles.rstimg,1.25);
	handles.rstimg = tmpimg;
	[H,W,~] = size(handles.srcimg);
	axes(handles.axes1);
	imshow(handles.srcimg);
	title(['¶ÁÈëÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	[H,W,~] = size(handles.rstimg);
	figure;
	imshow(handles.rstimg);
	title(['·Å´óÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	guidata(hObject, handles);


% --------------------------------------------------------------------
function uitoggletool2_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->ËõÐ¡25%
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = imresize(handles.rstimg,0.75);
	handles.rstimg = tmpimg;
	[H,W,~] = size(handles.srcimg);
	axes(handles.axes1);
	imshow(handles.srcimg);
	title(['¶ÁÈëÍ¼Ïñ(',num2str(H),'x',num2str(W),')']);
	[H,W,~] = size(handles.rstimg);
	figure;
	imshow(handles.rstimg);
	title(['ËõÐ¡Í¼Ïñ(',num2str(H),'x',num2str(W),')']);
	guidata(hObject, handles);


% --------------------------------------------------------------------
function uitoggletool3_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->ÄæÊ±ÕëÐý×ª90¡ã
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = rot90(handles.rstimg,1);
	handles.rstimg = tmpimg;
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('Ðý×ªÍ¼Ïñ');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function uitoggletool4_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->Ë³Ê±ÕëÐý×ª90¡ã
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = rot90(handles.rstimg,3);
	handles.rstimg = tmpimg;
	axes(handles.axes1);
	imshow(handles.srcimg);title('¶ÁÈëÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('Ðý×ªÍ¼Ïñ');
	guidata(hObject, handles);


% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->¸µÀïÒ¶ÆµÆ×Í¼
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	tmpimg = fft2(handles.grayimg);
	handles.freqimg = tmpimg;
	handles.freqflag = 1;
	tmpimg = log(1+abs(fftshift(tmpimg)));
	axes(handles.axes1)
	imshow(handles.grayimg);title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2)
	imshow(tmpimg,[]);title('¸µÀïÒ¶ÆµÆ×Í¼');


% --------------------------------------------------------------------
function uipushtool4_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->DCTÆ×Í¼
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	handles.rstimg = dct2(handles.grayimg);
	axes(handles.axes1);
	imshow(handles.grayimg);title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(log10(abs(handles.rstimg)));title('DCTÆ×Í¼');
	tmp=caxis;colormap(gca,jet(64));
	colorbar('Location','eastoutside',...
			 'Position',[0.92,0.15,0.02,0.7]);
	guidata(hObject,handles);


% --------------------------------------------------------------------
function uipushtool5_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->DWTÆ×Í¼
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	N = 2;
	wname = 'haar';
    [c,s] = wavedec2(handles.grayimg,N,wname);
	for k = 1:N
		sk = num2str(k);
		Hk = ['H',sk];Himg = [Hk,'img'];
		Vk = ['V',sk];Vimg = [Vk,'img'];
		Dk = ['D',sk];Dimg = [Dk,'img'];
		Ak = ['A',sk];Aimg = [Ak,'img'];
		eval(['[',Hk,',',Vk,',',Dk,'] = detcoef2(''all'',c,s,',sk,');']);
		eval([Ak,' = appcoef2(c,s,wname,',sk,');']);
		eval([Vimg,' = wcodemat(',Vk,',255,''mat'',1);']);
		eval([Himg,' = wcodemat(',Hk,',255,''mat'',1);']);
		eval([Dimg,' = wcodemat(',Dk,',255,''mat'',1);']);
		eval([Aimg,' = wcodemat(',Ak,',255,''mat'',1);']);
	end
	eval(['tmpimg = A',num2str(N),'img;']);
	for k = N:-1:1
		sk = num2str(k);
		Himg = ['H',sk,'img'];Vimg = ['V',sk,'img'];
		Dimg = ['D',sk,'img'];
		eval(['tmpimg = [tmpimg',',',Himg,';',Vimg,',',Dimg,'];']);
    end
	handles.rstimg = uint8(tmpimg);

	axes(handles.axes1);
	imshow(handles.grayimg);title('»Ò¶ÈÍ¼Ïñ');
	axes(handles.axes2);
	imshow(handles.rstimg);title('DWTÆ×Í¼');
	guidata(hObject,handles);


% --------------------------------------------------------------------
function uipushtool6_ClickedCallback(hObject, eventdata, handles)
	% ¹¤¾ßÀ¸->½á¹ûÖØÖÃ
	if ~handles.getflag
		errordlg('Error£ºÇëµ¼Èë²Ù×÷¶ÔÏó£¡','´íÎó');
		return;
	end
	handles.rstimg = handles.srcimg;
	handles.lock = 0;
	guidata(hObject,handles);


function hsi = rgb2hsi(rgb)
	%RGB2HSI Convert an RGB image to HSI.
	% Õª×Ô¡¶Êý×ÖÍ¼Ïñ´¦ÀíµÄMATLABÊµÏÖ¡·µÚ2°æ.(ÃÀ)¸ÔÈøÀ×Ë¹µÈÖø.µÚ6ÕÂ
	% HSI = RGB2HSI(RGB) converts an RGB image to HSI.
	% The input image is assumed to be of size M-by-N-by-3,
	% where the third dimension accounts for three image 
	% planes: red, green, and blue, in that order. If all RGB
	% component images are equal, the HSI conversion is 
	% undefined. The input image can be of class double (with
	% values in the range [0, 1]), uint8, or uint16.
	% 
	% The output image, HSI, is of class double, where:
	% HSI(:, :, 1) = hue image normalized to the range [0,1] by
	% dividing all angle values by 2*pi.
	% HSI(:, :, 2) = saturation image, in the range [0, 1].
	% HSI(:, :, 3) = intensity image, in the range [0, 1].
	% Extract the individual component images.
	rgb = im2double(rgb);
	r = rgb(:,:,1);
	g = rgb(:,:,2);
	b = rgb(:,:,3);

	% Implement the conversion equations
	num = 0.5 * ((r - g) + (r - b));
	den = sqrt((r - g).^2 + (r - b).*(g - b));
	theta = acos(num./(den + eps));

	H = theta;
	H(b > g) = 2*pi - H(b > g);
	H = H/(2*pi);

	num = min(min(r, g), b);
	den = r + g + b;
	den(den == 0) = eps;
	S = 1 - 3.*num./den;
	H(S==0) = 0;
	I = (r + g + b) / 3;

	% Combine all three results into an hsi image.
	hsi = cat(3, H, S, I);


function rgb = hsi2rgb(hsi)
	%HSI2RGB Converts an HSI image to RGB.
	%  Õª×Ô¡¶Êý×ÖÍ¼Ïñ´¦ÀíµÄMATLABÊµÏÖ¡·µÚ2°æ(ÃÀ).¸ÔÈøÀ×Ë¹.µÚ6ÕÂ
	% RGB = HSI2RGB(HSI) converts an HSI image RGB, where HSI is
	% assumed to be of class double with:
	% HSI(:, :, 1) = hue image, assumed to be in the range
	% [0, 1] by having been divided by 2*pi.
	% HSI(:, :, 2) = saturation image, in the range [0, 1];
	% HSI(:, :, 3) = intensity image, in the range [0, 1].
	%
	% The components of the output image are:
	% RGB(:, :, 1) = red.
	% RGB(:, :, 2) = green.
	% RGB(:, :, 3) = blue.
	% Extract the individual HSI component images.
	H = hsi(:,:,1) * 2 * pi;
	S = hsi(:,:,2);
	I = hsi(:,:,3);

	% Implement the conversion equations
	R = zeros(size(hsi,1),size(hsi,2));
	G = zeros(size(hsi,1),size(hsi,2));
	B = zeros(size(hsi,1),size(hsi,2));

	% RG sector (0 <= H < 2*pi/3)
	idx = find( (0 <= H) & (H < 2*pi/3) );
	B(idx) = I(idx) .* (1 - S(idx));
	R(idx) = I(idx) .* (1 + S(idx).*cos(H(idx)) ./ cos(pi/3 - H(idx)));
	G(idx) = 3*I(idx) - (R(idx) + B(idx));

	% BG sector (2*pi/3 <= H < 4*pi/3)
	idx = find( (2*pi/3 <= H) & (H < 4*pi/3) );
	R(idx) = I(idx) .* (1 - S(idx));
	G(idx) = I(idx) .* (1 + S(idx).*cos(H(idx) - 2*pi/3) ./ cos(pi - H(idx)));
	B(idx) = 3*I(idx) - (R(idx) + G(idx));

	% BR sector (4*pi/3 <= H < 2*pi)
	idx = find( (4*pi/3 <= H) & (H <= 2*pi) );
	G(idx) = I(idx) .* (1 - S(idx));
	B(idx) = I(idx) .* (1 + S(idx).*cos(H(idx) - 4*pi/3) ./ cos(5*pi/3 - H(idx)));
	R(idx) = 3*I(idx) - (G(idx) + B(idx));		

	% Combine all three results into an RGB image.
	% Clip to [0,1] compensate for floating-point 
	% arthmetric rounding effects.
	rgb = cat(3, R, G, B);
	rgb = max(min(rgb, 1), 0);
    
