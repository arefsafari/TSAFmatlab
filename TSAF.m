function varargout = TSAF(varargin)
% TSAF MATLAB code for TSAF.fig
%      TSAF, by itself, creates a new TSAF or raises the existing
%      singleton*.
%
%      H = TSAF returns the handle to a new TSAF or the handle to
%      the existing singleton*.
%
%      TSAF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TSAF.M with the given input arguments.
%
%      TSAF('Property','Value',...) creates a new TSAF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TSAF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TSAF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TSAF

% Last Modified by GUIDE v2.5 01-Dec-2015 11:50:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TSAF_OpeningFcn, ...
                   'gui_OutputFcn',  @TSAF_OutputFcn, ...
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


% --- Executes just before TSAF is made visible.
function TSAF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TSAF (see VARARGIN)





movegui(gcf,'center')
dim = get(0,'ScreenSize');
width  = dim(3);
height = dim(4);
guiWidth = round(width*0.7);
guiHeight = round(height*0.8);
set(gcf,'Units','Pixels','Position',[(width-guiWidth)/2 (height-guiHeight)/2 guiWidth guiHeight])



set(handles.axes1,'Visible','off');
set(handles.axes2,'Visible','off');
set(handles.axes3,'Visible','off');


% Choose default command line output for TSAF
handles.output = hObject;
handles.metricdata.lagsToPlot=20;
handles.metricdata.isLogTransform=false;
handles.metricdata.isMeanCorrected=false;
handles.metricdata.differentiation=0;
handles.metricdata.harmonics=0;
handles.metricdata.seasonalityRemoved=0;
handles.metricdata.tCandidate=0;
handles.metricdata.D=0;
handles.metricdata.Seasonality=0;
handles.metricdata.futureSamples=1;
handles.metricdata.pathsNumber=1;
handles.metricdata.isARLags=false;
handles.metricdata.isMALags=false;
handles.metricdata.isSARLags=false;
handles.metricdata.isSMALags=false;
handles.metricdata.isAR=false;
handles.metricdata.isMA=false;
handles.metricdata.isSAR=false;
handles.metricdata.isSMA=false;

handles.metricdata.ARLags=0;
handles.metricdata.MALags=0;
handles.metricdata.SARLags=0;
handles.metricdata.SMALags=0;
handles.metricdata.AR=0;
handles.metricdata.MA=0;
handles.metricdata.SAR=0;
handles.metricdata.SMA=0;


handles.metricdata.defaultpDq={'1','0','1'};
handles.metricdata.defaultanswer={'1','1'};
handles.metricdata.advancedFilterNum=1;
handles.metricdata.advancedFilterDen=1;
handles.metricdata.pRange=1;
handles.metricdata.DRange=0;
handles.metricdata.qRange=1;
handles.correlation_type=0;


axes(handles.axes1);
set(gca,'XTickLabel','','XTick',0)
set(gca,'YTickLabel','','YTick',0)
axes(handles.axes2);
set(gca,'XTickLabel','','XTick',0)
set(gca,'YTickLabel','','YTick',0)
axes(handles.axes3);
set(gca,'XTickLabel','','XTick',0)
set(gca,'YTickLabel','','YTick',0)

set(handles.MA,'Enable','off');
set(handles.AR,'Enable','off');
set(handles.SMA,'Enable','off');
set(handles.SAR,'Enable','off');
set(handles.MALags,'Enable','off');
set(handles.ARLags,'Enable','off');
set(handles.SMALags,'Enable','off');
set(handles.SARLags,'Enable','off');


load('data_image','image1')
load('model_image','image2')
load('correlation_image','image3')


axes(handles.axes1);
image(image1);
axis off
%%% show the image in an animated way
% for i=1:10
%     imshow(circshift(image1,[0 -i*4]),[]);
%     drawnow
% end

axes(handles.axes2);
image(image2);
axis off
%%% show the image in an animated way
% for i=1:10
%     imshow(circshift(image2,[i*7 0]),[]);
%     drawnow
% end

axes(handles.axes3);
image(image3);
axis off
%%% show the image in an animated way
% for i=1:10
%     imshow(circshift(image3,[i*7 0]),[]);
%     drawnow
% end



% Update handles structure
guidata(hObject, handles);




% UIWAIT makes TSAF wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TSAF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


try
    arima(1,0,0);
catch
    msg=sprintf('TSAF requires Econometrics Toolbox which is not avialable in your Matlab ! \n\n You can download the trial version of this toolbox here: \n\n http://www.mathworks.com/products/econometrics/ \n\n');
    errordlg(msg);
    close(handles.output);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles    structure with handles and user data (see GUIDATA)


cla(handles.axes1)
cla(handles.axes2)
cla(handles.axes3)
set(handles.lagsToPlot,'string',num2str(20));
set(handles.seasonalityRemoved,'string',num2str(0));
set(handles.isLogTransform,'Value',0)
set(handles.isMeanCorrected,'Value',0)
set(handles.differentiation,'string',num2str(0));
set(handles.harmonics,'string',num2str(0));
set(handles.D,'string',num2str(0));
set(handles.Seasonality,'string',num2str(0));
handles.metricdata.lagsToPlot=20;
handles.metricdata.isLogTransform=false;
handles.metricdata.isMeanCorrected=false;
handles.metricdata.differentiation=0;
handles.metricdata.harmonics=0;
handles.metricdata.seasonalityRemoved=0;
handles.metricdata.D=0;
handles.metricdata.Seasonality=0;
handles.metricdata.isARLags=false;
handles.metricdata.isMALags=false;
handles.metricdata.isSARLags=false;
handles.metricdata.isSMALags=false;
handles.metricdata.isAR=false;
handles.metricdata.isMA=false;
handles.metricdata.isSAR=false;
handles.metricdata.isSMA=false;
handles.metricdata.futureSamples=1;
handles.metricdata.pathsNumber=1;
set(handles.futureSamples,'string',num2str(1));
set(handles.pathsNumber,'string',num2str(1));
guidata(hObject, handles);

set(handles.isARLags,'Value',0);
set(handles.isMALags,'Value',0);
set(handles.isSARLags,'Value',0);
set(handles.isSMALags,'Value',0);
set(handles.isAR,'Value',0);
set(handles.isMA,'Value',0);
set(handles.isSAR,'Value',0);
set(handles.isSMA,'Value',0);
set(handles.ARLags,'String','');
set(handles.MALags,'String','');
set(handles.SARLags,'String','');
set(handles.SMALags,'String','');
set(handles.AR,'String','');
set(handles.MA,'String','');
set(handles.SAR,'String','');
set(handles.SMA,'String','');
set(handles.MA,'Enable','off');
set(handles.AR,'Enable','off');
set(handles.SMA,'Enable','off');
set(handles.SAR,'Enable','off');
set(handles.MALags,'Enable','off');
set(handles.ARLags,'Enable','off');
set(handles.SMALags,'Enable','off');
set(handles.SARLags,'Enable','off');
set(handles.futureSamples,'Enable','off');
set(handles.pathsNumber,'Enable','off');
set(handles.text17,'Enable','off');
set(handles.text18,'Enable','off');


set(handles.forecast,'Enable','off');
set(handles.save,'Enable','off');


[filename, pathname] = uigetfile( ...
    {'*.xlsx', 'All xlsx-Files (*.xlsx)'; '*.xls','All xls-Files (*.xls)' ; '*.csv' , 'All csv-Files (*.csv)' ; '*.*' , 'All Files'}, 'Select Address Book');
% If "Cancel" is selected then return
if isequal([filename,pathname],[0,0])
    return
% Otherwise construct the fullfilename and Check and load the file
else
    File = fullfile(pathname,filename);
    num=xlsread(File);
 
    dataColumn=1;
    if (size(num,2)>1)
        msg=sprintf('Select the data column: \n');
        prompt= msg;
        name='';
        numlines=1;
        defaultanswer={'1'};
        answer=inputdlg(prompt,name,numlines,defaultanswer);
        try
            dataColumn=str2num(cell2mat(answer));
        catch
            return
        end
    end
 
    if (size(num,2)==0)
        errordlg('Your selected file includes no number.', 'Error');
        return 
    else
        try
            data=num(:,dataColumn);
            plot_all(data,hObject);
            handles.metricdata.data=data;
        catch
            msg=sprintf('Selected column containts no data! \n');
            errordlg(msg); 
        end
    end    
end


guidata(hObject, handles);





function plot_all(x,hObject)

handles = guidata(gcbo);
isLogTransform=handles.metricdata.isLogTransform;
isMeanCorrected=handles.metricdata.isMeanCorrected; 
lags=handles.metricdata.lagsToPlot;
differentiation=handles.metricdata.differentiation;
harmonics=handles.metricdata.harmonics;
seasonalityRemoved=handles.metricdata.seasonalityRemoved;
advancedFilterNum=handles.metricdata.advancedFilterNum;
advancedFilterDen=handles.metricdata.advancedFilterDen;


if isLogTransform
    x=log10(x);
end

if isMeanCorrected
    x=x-mean(x);
end


if differentiation>0
    x=diff(x,differentiation);
end



x=filter(advancedFilterNum,advancedFilterDen,x);
x=x(length(advancedFilterNum):end);


x_memory=x;
[T,oo,~,ff,ind]=find_periods(x_memory,harmonics,5);
tCandidate=find_period_candidate(T);
handles.metricdata.tCandidate=tCandidate;
if seasonalityRemoved>0
    x=x(seasonalityRemoved+1:end)-x(1:end-seasonalityRemoved);
end
axes(handles.axes2);
cla
[~,o,~,f,~]=find_periods(x,harmonics,5);

ending=min(length(ff),length(oo));
plot(ff(1:ending),abs(oo(1:ending)),'r');
hold on

if seasonalityRemoved>0
    plot(f,abs(o),'b:','linewidth',2)
    legend('data','seasonality removed')
else
    legend('hide')
end
plot(ff(ind),abs(oo(ind)),'k^','linewidth',2)
for i=1:harmonics
    msg=num2str(1/ff(ind(i)), '%.1f');
    text(ff(ind(i))+0.02,abs(oo(ind(i))),msg)
end
xlim([0 0.5])
ylim auto
set(gca,'FontName','Times New Roman','FontSize',11)
ylabel('Amplitude Response')
xlabel('Frequency (cycle per sample)')


axes(handles.axes1);
cla;
plot(x,'.-')
xlim([0 length(x)])
ylim auto
set(gca,'FontName','Times New Roman','FontSize',11)
ylabel('Signal')
xlabel('Time (sample)')       


if (handles.correlation_type==0)
    axes(handles.axes3);
    cla
    [acf,lags_interval,bounds]=autocorr(x,lags);
    h=stem(lags_interval,acf,'filled','MarkerFaceColor',[1 .5 0]);
    set(h,'Color',[1 .5 0])
    hold on
    plot(linspace(0.5,lags_interval(end),2),bounds(1)*ones(1,2),'m')
    plot(linspace(0.5,lags_interval(end),2),bounds(2)*ones(1,2),'m')
    set(gca,'FontName','Times New Roman','FontSize',11)
    ylim([min(acf)-0.2 max(acf)+0.2])
    ylabel('Sample Autocorrelation')
    xlabel('Lag')
else
    axes(handles.axes3);
    cla
    [pcf,lags_interval,bounds]=parcorr(x,lags);
    h=stem(lags_interval,pcf,'filled','MarkerFaceColor',[1 .5 0]);
    set(h,'Color',[1 .5 0])
    hold on
    plot(linspace(0.5,lags_interval(end),2),bounds(1)*ones(1,2),'m')
    plot(linspace(0.5,lags_interval(end),2),bounds(2)*ones(1,2),'m')
    set(gca,'FontName','Times New Roman','FontSize',11)
    ylim([min(pcf)-0.2 max(pcf)+0.2])
    ylabel('Sample Partial Autocorrelation')
    xlabel('Lag')
end


guidata(hObject, handles);




       
% --- Executes on button press in isMeanCorrected.
function isMeanCorrected_Callback(hObject, eventdata, handles)
% hObject    handle to isMeanCorrected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isMeanCorrected

data=handles.metricdata.data;
if (get(hObject,'Value'))
    handles.metricdata.isMeanCorrected=true;
else
    handles.metricdata.isMeanCorrected=false;
end
guidata(hObject, handles);
plot_all(data,hObject)



function lagsToPlot_Callback(hObject, eventdata, handles)
% hObject    handle to lagsToPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lagsToPlot as text
%        str2double(get(hObject,'String')) returns contents of lagsToPlot as a double

data=handles.metricdata.data;
handles.metricdata.lagsToPlot=str2num(get(hObject,'String'));
guidata(hObject, handles);
plot_all(data,hObject)

% --- Executes during object creation, after setting all properties.
function lagsToPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lagsToPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function differentiation_Callback(hObject, eventdata, handles)
% hObject    handle to differentiation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of differentiation as text
%        str2double(get(hObject,'String')) returns contents of differentiation as a double
data=handles.metricdata.data;
handles.metricdata.differentiation=str2num(get(hObject,'String'));
guidata(hObject, handles);
plot_all(data,hObject)


% --- Executes during object creation, after setting all properties.
function differentiation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to differentiation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function harmonics_Callback(hObject, eventdata, handles)
% hObject    handle to harmonics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of harmonics as text
%        str2double(get(hObject,'String')) returns contents of harmonics as a double
data=handles.metricdata.data;
handles.metricdata.harmonics=str2num(get(hObject,'String'));
guidata(hObject, handles);
plot_all(data,hObject)

% --- Executes during object creation, after setting all properties.
function harmonics_CreateFcn(hObject, eventdata, handles)
% hObject    handle to harmonics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

message = sprintf('According to the selected harmonics: \n\nSeasonality is approximately observed every %d Samples \n',handles.metricdata.tCandidate);
h=(msgbox(message,'','modal'));
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
set( ch, 'FontSize', 9);
set( ch, 'FontName', 'Times New Roman' );



function seasonalityRemoved_Callback(hObject, eventdata, handles)
% hObject    handle to seasonalityRemoved (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seasonalityRemoved as text
%        str2double(get(hObject,'String')) returns contents of seasonalityRemoved as a double


data=handles.metricdata.data;
handles.metricdata.seasonalityRemoved=str2num(get(hObject,'String'));
guidata(hObject, handles);
plot_all(data,hObject)


% --- Executes during object creation, after setting all properties.
function seasonalityRemoved_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seasonalityRemoved (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function D_Callback(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D as text
%        str2double(get(hObject,'String')) returns contents of D as a double

D=str2num(get(hObject,'String'));
handles.metricdata.D=D;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Seasonality_Callback(hObject, eventdata, handles)
% hObject    handle to Seasonality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Seasonality as text
%        str2double(get(hObject,'String')) returns contents of Seasonality as a double

Seasonality=str2num(get(hObject,'String'));
handles.metricdata.Seasonality=Seasonality;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Seasonality_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Seasonality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ARLags_Callback(hObject, eventdata, handles)
% hObject    handle to ARLags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARLags as text
%        str2double(get(hObject,'String')) returns contents of ARLags as a double

temp = get(hObject, 'String');
ARLags = find_lags(temp);
handles.metricdata.ARLags = ARLags;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function ARLags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARLags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MALags_Callback(hObject, eventdata, handles)
% hObject    handle to MALags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MALags as text
%        str2double(get(hObject,'String')) returns contents of MALags as a double

temp = get(hObject, 'String');
MALags = find_lags(temp);
handles.metricdata.MALags = MALags;
guidata(hObject,handles);


function lags=find_lags(string)

temp1=strsplit(string,{',',', ',' ,',';','; ',' ;',' ','  ','   '});
for i=1:length(temp1)
    temp2{i}=strsplit(temp1{i},':');
end

lags_temp=[];
for i=1:length(temp2)
    temp3=str2double(temp2{i});
    if length(temp3)==2
       lags_temp=[lags_temp temp3(1):temp3(2)];
    else
       lags_temp=[lags_temp temp3(1)];
    end
end
lags=lags_temp;


% --- Executes during object creation, after setting all properties.
function MALags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MALags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in estimate.
function estimate_Callback(hObject, eventdata, handles)
% hObject    handle to estimate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(gcbo);

isAR=handles.metricdata.isAR;
isMA=handles.metricdata.isMA;
isSAR=handles.metricdata.isSAR;
isSMA=handles.metricdata.isSMA;
isARLags=handles.metricdata.isARLags;
isMALags=handles.metricdata.isMALags;
isSARLags=handles.metricdata.isSARLags;
isSMALags=handles.metricdata.isSMALags;
ARLags=handles.metricdata.ARLags;
MALags=handles.metricdata.MALags;
SARLags=handles.metricdata.SARLags;
SMALags=handles.metricdata.SMALags;
AR=handles.metricdata.AR;
MA=handles.metricdata.MA;
SAR=handles.metricdata.SAR;
SMA=handles.metricdata.SMA;

D=handles.metricdata.D;
Seasonality=handles.metricdata.Seasonality;
isLogTransform=handles.metricdata.isLogTransform;

x=handles.metricdata.data;
y=x;
if isLogTransform
    y=log10(x);
end


model=arima;

try
    if (isAR)
        model.AR=num2cell(AR);
    end

    if (isMA)
        model.MA=num2cell(MA);
    end

    if (isSAR)
        model.SAR=num2cell(SAR);
    end

    if (isSMA)
        model.SMA=num2cell(SMA);
    end
catch
    msg=sprintf('System is not either stable or causal!\n');
    errordlg(msg, 'Error');
    return
end

try
    if (isARLags)
        model.AR=translateLagsToCof(ARLags,AR,isAR);
    end

    if (isMALags)
        model.MA=translateLagsToCof(MALags,MA,isMA);
    end

    if (isSARLags)
        model.SAR=translateLagsToCof(SARLags,SAR,isSAR);
    end

    if (isSMALags)
        model.SMA=translateLagsToCof(SMALags,SMA,isSMA);
    end
catch
    msg=sprintf('Lags and Coefficients vectors must have the same length!\n');
    errordlg(msg, 'Error');
    return
end

model.D=D;
model.Seasonality=Seasonality;


h = waitbar(0,'Please wait ...');
hw=findobj(h,'Type','Patch');
set(hw,'EdgeColor',[0 0 0],'FaceColor',[0 1 0]) % changes the color to green

try
     estModel=estimate(model,y);
     waitIteration(20,1,0);
     close(h)
     handles.metricdata.estModel=estModel;
     set(handles.forecast,'Enable','on');
     set(handles.futureSamples,'Enable','on');
     set(handles.pathsNumber,'Enable','on');
     set(handles.text17,'Enable','on');
     set(handles.text18,'Enable','on');
catch
     waitIteration(20,1,0);
     close(h)
     errordlg('The model is unstable', 'Error');
end


guidata(hObject,handles);



function waitIteration(T,res,startPoint)

for i=1:T
      waitbar(startPoint+res*i/T)
      pause(0.001)
end

     


function cof=translateLagsToCof(input,pair,condition)

temp=zeros(1,input(end));
index=1;
for i=input
     if(~condition)
          temp(i)=NaN;
     else
          temp(i)=pair(index);
     end
     index=index+1;
end

cof=num2cell(temp);


% --- Executes on button press in isARLags.
function isARLags_Callback(hObject, eventdata, handles)
% hObject    handle to isARLags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isARLags

if (get(hObject,'Value'))
    handles.metricdata.isARLags=true;
    set(handles.ARLags,'enable','on')
else
    handles.metricdata.isARLags=false;
    set(handles.ARLags,'enable','off')
end
guidata(hObject, handles);


% --- Executes on button press in isMALags.
function isMALags_Callback(hObject, eventdata, handles)
% hObject    handle to isMALags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isMALags

if (get(hObject,'Value'))
    handles.metricdata.isMALags=true;
    set(handles.MALags,'enable','on')
else
    handles.metricdata.isMALags=false;
    set(handles.MALags,'enable','off')
    set(handles.MALags,'string',num2str(''));
end
guidata(hObject, handles);


% --- Executes on button press in isLogTransform.
function isLogTransform_Callback(hObject, eventdata, handles)
% hObject    handle to isLogTransform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isLogTransform

data=handles.metricdata.data;
if (get(hObject,'Value'))
    handles.metricdata.isLogTransform=true;
else
    handles.metricdata.isLogTransform=false;
end
guidata(hObject, handles);
plot_all(data,hObject)


% --- Executes on button press in forecast.
function forecast_Callback(hObject, eventdata, handles)
% hObject    handle to forecast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(gcbo);
estModel=handles.metricdata.estModel;
isLogTransform=handles.metricdata.isLogTransform;
numFutureSamples=handles.metricdata.futureSamples;
numPaths=handles.metricdata.pathsNumber;
x=handles.metricdata.data;
y=x;


if isLogTransform
    y=log10(x);
end


%%%%%%%%% find minimum and maximum allowed values %%%%
prompt={'Minimum value:','Maximum value:'};
name='';
numlines=1;
defaultanswer={'',''}; 
answer=inputdlg(prompt,name,numlines,defaultanswer);
try
   physicalLimitations(1)=str2num(answer{1});
catch
   physicalLimitations(1)=-10e30;
end
try
   physicalLimitations(2)=str2num(answer{2});
catch
   physicalLimitations(2)=10e30;
end
minimum_value=physicalLimitations(1);
maximum_value=physicalLimitations(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

res = infer(estModel,y);
initial_vector=repmat(y,1,numPaths);
for futureSamples=1:numFutureSamples
    out(futureSamples,:)=simulate(estModel,1,'Y0',initial_vector,'NumPaths',numPaths,'E0',res);
    out(futureSamples,find(out(futureSamples,:)<=minimum_value))=minimum_value;
    out(futureSamples,find(out(futureSamples,:)>=maximum_value))=maximum_value;
    initial_vector=[repmat(y(futureSamples+1:end,1),1,numPaths);out(1:futureSamples,:)];
end
cla(handles.axes1)
axes(handles.axes1);
legend('hide')
plot(1:length(y),y,'linewidth',1);
hold on
plot(length(y):length(y)+numFutureSamples,[y(end)*ones(1,numPaths);out])
xlim([0 length(y)+numFutureSamples])
set(gca,'FontName','Times New Roman','FontSize',11)
ylabel('History and Forecast')
xlabel('Time (sample)')  
ylim auto
handles.metricdata.out=out;
set(handles.save,'Enable','on');

guidata(hObject, handles);

% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(gcbo);
estModel=handles.metricdata.estModel;
isLogTransform=handles.metricdata.isLogTransform;
numPaths=handles.metricdata.pathsNumber;
x=handles.metricdata.data;
out=handles.metricdata.out;

temp=out;

if isLogTransform
    temp=10.^(out);
end


fileopen_error_flag=1;
while(fileopen_error_flag==1)
    try
        xlswrite('forecast.xls',1)
        fileopen_error_flag=0;
    catch
        msg=sprintf('forecast.xls file is open, please close it now.\n');
        uiwait(warndlg(msg));
    end
end


final_data=[repmat(x,1,numPaths);temp];
delete forecast.xls;

columns_per_sheet=200;
sheets=ceil(numPaths/columns_per_sheet);
jump=0;
for i=1:sheets
    end_index=min(columns_per_sheet+jump,size(final_data,2));
    xlswrite('forecast.xls',final_data(:,1+jump:end_index),i);
    jump=jump+columns_per_sheet;
end 


msg=sprintf('Data is saved in a file named "forecast.xls" \nin %d sheets',sheets);
h=msgbox(msg);
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
set( ch, 'FontSize', 9 );
uiwait(h);


save('estimated_model','estModel')
msg=sprintf('Model is saved as an object named "estimated_model" \n');
h=msgbox(msg);
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
set( ch, 'FontSize', 9 );
uiwait(h);





function pathsNumber_Callback(hObject, eventdata, handles)
% hObject    handle to pathsNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pathsNumber as text
%        str2double(get(hObject,'String')) returns contents of pathsNumber as a double

pathsNumber=str2num(get(hObject,'String'));
handles.metricdata.pathsNumber=pathsNumber;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function pathsNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pathsNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function futureSamples_Callback(hObject, eventdata, handles)
% hObject    handle to futureSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of futureSamples as text
%        str2double(get(hObject,'String')) returns contents of futureSamples as a double
futureSamples=str2num(get(hObject,'String'));
handles.metricdata.futureSamples=futureSamples;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function futureSamples_CreateFcn(hObject, eventdata, handles)
% hObject    handle to futureSamples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Advance.
function Advance_Callback(hObject, eventdata, handles)
% hObject    handle to Advance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(gcbo);
data=handles.metricdata.data;
prompt={'Numerator:','Denominator:'};
name='';
numlines=1;

 
answer=inputdlg(prompt,name,numlines,handles.metricdata.defaultanswer);
handles.metricdata.defaultanswer=answer;
num=cell2mat(answer(1));
den=cell2mat(answer(2));
numerator=find_lags(num);
denominator=find_lags(den);
handles.metricdata.advancedFilterNum=numerator;
handles.metricdata.advancedFilterDen=denominator;

guidata(hObject, handles);
plot_all(data,hObject)



function AR_Callback(hObject, eventdata, handles)
% hObject    handle to AR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AR as text
%        str2double(get(hObject,'String')) returns contents of AR as a double

temp = get(hObject, 'String');
AR = find_lags(temp);
handles.metricdata.AR = AR;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function AR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MA_Callback(hObject, eventdata, handles)
% hObject    handle to MA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MA as text
%        str2double(get(hObject,'String')) returns contents of MA as a double

temp = get(hObject, 'String');
MA = find_lags(temp);
handles.metricdata.MA = MA;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function MA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in isAR.
function isAR_Callback(hObject, eventdata, handles)
% hObject    handle to isAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isAR

if (get(hObject,'Value'))
    handles.metricdata.isAR=true;
    set(handles.AR,'Enable','on')
else
    handles.metricdata.isAR=false;
    set(handles.AR,'Enable','off')
    set(handles.AR,'string',num2str(''));
end
guidata(hObject, handles);


% --- Executes on button press in isMA.
function isMA_Callback(hObject, eventdata, handles)
% hObject    handle to isMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isMAif (get(hObject,'Value'))

if (get(hObject,'Value'))
    handles.metricdata.isMA=true;
    set(handles.MA,'Enable','on')
else
    handles.metricdata.isMA=false;
    set(handles.MA,'Enable','off')
    set(handles.MA,'string',num2str(''));
end
guidata(hObject, handles);


function SARLags_Callback(hObject, eventdata, handles)
% hObject    handle to SARLags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SARLags as text
%        str2double(get(hObject,'String')) returns contents of SARLags as a double

temp = get(hObject, 'String');
SARLags = find_lags(temp);
handles.metricdata.SARLags = SARLags;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function SARLags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SARLags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SAR_Callback(hObject, eventdata, handles)
% hObject    handle to SAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SAR as text
%        str2double(get(hObject,'String')) returns contents of SAR as a double

temp = get(hObject, 'String');
SAR = find_lags(temp);
handles.metricdata.SAR = SAR;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function SAR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in isSARLags.
function isSARLags_Callback(hObject, eventdata, handles)
% hObject    handle to isSARLags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isSARLags

if (get(hObject,'Value'))
    handles.metricdata.isSARLags=true;
    set(handles.SARLags,'Enable','on')
else
    handles.metricdata.isSARLags=false;
    set(handles.SARLags,'Enable','off')
    set(handles.SARLags,'string',num2str(''));
end
guidata(hObject, handles);


% --- Executes on button press in isSAR.
function isSAR_Callback(hObject, eventdata, handles)
% hObject    handle to isSAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isSAR

if (get(hObject,'Value'))
    handles.metricdata.isSAR=true;
    set(handles.SAR,'Enable','on')
else
    handles.metricdata.isSAR=false;
    set(handles.SAR,'Enable','off')
    set(handles.SAR,'string',num2str(''));
end
guidata(hObject, handles);

% --- Executes on button press in isSMALags.
function isSMALags_Callback(hObject, eventdata, handles)
% hObject    handle to isSMALags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isSMALags
if (get(hObject,'Value'))
    handles.metricdata.isSMALags=true;
    set(handles.SMALags,'Enable','on')
else
    handles.metricdata.isSMALags=false;
    set(handles.SMALags,'Enable','off')
    set(handles.SMALags,'string',num2str(''));
end
guidata(hObject, handles);


function SMALags_Callback(hObject, eventdata, handles)
% hObject    handle to SMALags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SMALags as text
%        str2double(get(hObject,'String')) returns contents of SMALags as a double

temp = get(hObject, 'String');
SMALags = find_lags(temp);
handles.metricdata.SMALags = SMALags;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function SMALags_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SMALags (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in isSMA.
function isSMA_Callback(hObject, eventdata, handles)
% hObject    handle to isSMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of isSMA

if (get(hObject,'Value'))
    handles.metricdata.isSMA=true;
    set(handles.SMA,'Enable','on')
else
    handles.metricdata.isSMA=false;
    set(handles.SMA,'Enable','off')
    set(handles.SMA,'string',num2str(''));
end
guidata(hObject, handles);


function SMA_Callback(hObject, eventdata, handles)
% hObject    handle to SMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SMA as text
%        str2double(get(hObject,'String')) returns contents of SMA as a double

temp = get(hObject, 'String');
SMA = find_lags(temp);
handles.metricdata.SMA = SMA;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function SMA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

data=handles.metricdata.data;
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val};
case 'Autocorrelation' % User selects peaks.
   handles.correlation_type = 0;
case 'Partial Autocorrelation' % User selects membrane.
   handles.correlation_type = 1;
end
% Save the handles structure.
guidata(hObject,handles)
plot_all(data,hObject)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



handles = guidata(gcbo);
isLogTransform=handles.metricdata.isLogTransform;
x=handles.metricdata.data;
y=x;
if isLogTransform
    y=log10(x);
end

msg1=sprintf('AR(p), set p range: \n');
msg2=sprintf('set D range: \n');
msg3=sprintf('MA(q), set q range: \n');
prompt={msg1,msg2,msg3};
name='';
numlines=1;
answer=inputdlg(prompt,name,numlines,handles.metricdata.defaultpDq);
handles.metricdata.defaultpDq=answer;
pRangeTemp=cell2mat(answer(1));
DRangeTemp=cell2mat(answer(2));
qRangeTemp=cell2mat(answer(3));
pRange=find_lags(pRangeTemp);
DRange=find_lags(DRangeTemp);
qRange=find_lags(qRangeTemp);

h = waitbar(0,'Please wait ...');
hw=findobj(h,'Type','Patch');
set(hw,'EdgeColor',[0 0 0],'FaceColor',[0 1 0]) % changes the color to green
step=1;
steps=length(pRange)*length(qRange)*length(DRange);


number_of_observations=length(y);

for p=pRange
    for q=qRange
        for D=DRange;
            model=arima(p,D,q);
            try
                [~,~,logL] = estimate(model,y);
                waitIteration(20,1/steps,(step-1)/steps);
                LOGL = logL;
                PQ = p+q;            
                bic_matric(p+1,q+1,D+1)=aicbic(LOGL,PQ+1,number_of_observations);
            catch
                waitIteration(20,1/steps,(step-1)/steps);
                bic_matric(p+1,q+1,D+1)=NaN;
            end
            step=step+1;
        end
    end
end

close(h);


fileopen_error_flag=1;
while(fileopen_error_flag==1)
    try
        xlswrite('BIC.xls',1)
        fileopen_error_flag=0;
    catch
        msg=sprintf('BIC.xls file is open, please close it now.\n');
        uiwait(warndlg(msg));
    end
end


  
bic_matric(find(bic_matric==0))=10^30;
[M3, idx3] = min(bic_matric, [], 3);
[M2, idx2] = min(M3, [], 2);
[~, idx1] = min(M2, [], 1);
idx2=idx2(idx1);
idx3=idx3(idx1,idx2);
m=idx1;
n=idx2;
k=idx3;

N=size(bic_matric,3);
delete BIC.xls
for i=1:N
    xlswrite('BIC.xls',bic_matric(:,:,i),i);
end
msg=sprintf('Smallest BIC is achived when p = %d, D = %d and q = %d \n\n (Results are saved in a file named "BIC.xls") \n',m-1,k-1,n-1);
h=msgbox(msg);
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
set( ch, 'FontSize', 9 );
uiwait(h);



msg=sprintf('Do you want to choose the best candidate (the one with the smallest BIC)\n\nas the final model? \n');
ButtonName = questdlg(msg,'Model','Yes', 'No','Yes');
switch ButtonName,
   case 'Yes',
        h = waitbar(0,'Please wait ...');
        hw=findobj(h,'Type','Patch');
        set(hw,'EdgeColor',[0 0 0],'FaceColor',[0 1 0]) % changes the color to green
        model=arima(m-1,k-1,n-1);
        estModel = estimate(model,y);
        waitIteration(20,1,0);
        close(h)
        handles.metricdata.estModel=estModel;
        set(handles.forecast,'Enable','on');
        set(handles.futureSamples,'Enable','on');
        set(handles.pathsNumber,'Enable','on');
        set(handles.text17,'Enable','on');
        set(handles.text18,'Enable','on');        
   case 'No',
      
end 



guidata(hObject,handles);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


web_playlist='http://sphackswithiman.com/html/home.html';

web(web_playlist,'-noaddressbox','-notoolbar')
guidata(hObject,handles);



% --------------------------------------------------------------------
function help_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

web_playlist='https://www.youtube.com/watch?v=7eb141ajT7c&list=PLJ-OcUCIty7eFl4rjnMf3UgcHp-nWCoCB';

web(web_playlist,'-noaddressbox','-notoolbar')
guidata(hObject,handles);
