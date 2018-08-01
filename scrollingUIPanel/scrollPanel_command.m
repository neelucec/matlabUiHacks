%% Actual Example
% Create the figure
fig = uifigure('Name', 'Scroll Panel Test');

% Place a uipanel on the figure, color it for fun
scrollPane = uipanel(fig, 'BackgroundColor', [0.5,0.4,1]);

% space requirements for controls
totalHeight = 720;%px
totalWidth = 260;%px
viewHeight = 200;%px

% set the Position property to the required dimensions
scrollPane.Position(3) = totalWidth;  % WIDTH
scrollPane.Position(4) = totalHeight; % HEIGHT

% Begin, magic use mlapptools.setStyle() to modify the panel's style
mlapptools.setStyle(scrollPane, 'overflow-y', 'scroll');
mlapptools.setStyle(scrollPane, 'height', sprintf('%dpx', viewHeight));

%Set the html styles
%{
cssText = [...
  '''<style>\n', ...
  '  .scrollpane::-webkit-scrollbar {\n', ...
  '    width: 20px;\n', ...
  '  }\n', ...
  '  /* Track */\n', ...
  '  .scrollpane::-webkit-scrollbar-track {\n', ...
  '    background-color: white;\n', ...
  '    box-shadow: inset 0 0 5px white;\n', ... 
  '    border-radius: 10px;\n', ...
  '  }\n', ...
  '  /* Handle */\n', ...
  '  .scrollpane::-webkit-scrollbar-thumb {\n', ...
  '    background: red; \n', ...
  '    border-radius: 10px;\n', ...
  '  }\n', ...
  '  /* Handle on hover */\n', ...
  '  .scrollpane::-webkit-scrollbar-thumb:hover {\n', ...
  '    background: #b30000; \n', ...
  '  }\n', ...
  '</style>''' ...
  ];

%yellow honeycomb
cssText = [...
                '''<style>\n', ...
                '    /* Stars modified from: http://lea.verou.me/css3patterns/#carbon-fibre */\n', ...
                '  .scrollpane {\n', ...
                '    background:\n',...
                '    radial-gradient(black 15%, transparent 16%) 0 0,\n',...
                '    radial-gradient(black 15%, transparent 16%) 8px 8px,\n',...
                '    radial-gradient(rgba(255,255,255,.1) 15%, transparent 20%) 0 1px,\n',...
                '    radial-gradient(rgba(255,255,255,.1) 15%, transparent 20%) 8px 9px;\n',...
                '    background-color:#484858 !important;\n',...
                '    background-size:16px 16px !important;\n',...
                '  }\n', ...
                '  .controlbox {\n', ...
                '    border-radius: 15px 5px 5px 15px !important;\n', ...
                '    background:\n',...
                '    radial-gradient(circle farthest-side at 0% 50%,#fb1 23.5%,rgba(240,166,17,0) 0)21px 30px,\n',...
                '    radial-gradient(circle farthest-side at 0% 50%,#B71 24%,rgba(240,166,17,0) 0)19px 30px,\n',...
                '    linear-gradient(#fb1 14%,rgba(240,166,17,0) 0, rgba(240,166,17,0) 85%,#fb1 0)0 0,\n',...
                '    linear-gradient(150deg,#fb1 24%,#B71 0,#B71 26%,rgba(240,166,17,0) 0,rgba(240,166,17,0) 74%,#B71 0,#B71 76%,#fb1 0)0 0,\n',...
                '    linear-gradient(30deg,#fb1 24%,#B71 0,#B71 26%,rgba(240,166,17,0) 0,rgba(240,166,17,0) 74%,#B71 0,#B71 76%,#fb1 0)0 0,\n',...
                '    linear-gradient(90deg,#B71 2%,#fb1 0,#fb1 98%,#B71 0%)0 0 #fb1 !important;\n',...
                '    background-size:40px 60px !important;\n',...
                '    ;\n', ...
                '  }\n', ...
                '</style>\n''' ...
                ];
%}
 cssText = [...
  '''<style>\n', ...
  '    /* Stars modified from: http://lea.verou.me/css3patterns/#stars */\n', ...
  '  .scrollpane {\n', ...
  '    overflow: auto;\n', ...
  '    background:\n',...
  '    linear-gradient(324deg, #232927 4%,   transparent 4%) -70px 43px,\n', ...
  '    linear-gradient( 36deg, #232927 4%,   transparent 4%) 30px 43px,\n', ...
  '    linear-gradient( 72deg, #e3d7bf 8.5%, transparent 8.5%) 30px 43px,\n', ...
  '    linear-gradient(288deg, #e3d7bf 8.5%, transparent 8.5%) -70px 43px,\n', ...
  '    linear-gradient(216deg, #e3d7bf 7.5%, transparent 7.5%) -70px 23px,\n', ...
  '    linear-gradient(144deg, #e3d7bf 7.5%, transparent 7.5%) 30px 23px,\n', ...
  '    linear-gradient(324deg, #232927 4%,   transparent 4%) -20px 93px,\n', ...
  '    linear-gradient( 36deg, #232927 4%,   transparent 4%) 80px 93px,\n', ...
  '    linear-gradient( 72deg, #e3d7bf 8.5%, transparent 8.5%) 80px 93px,\n', ...
  '    linear-gradient(288deg, #e3d7bf 8.5%, transparent 8.5%) -20px 93px,\n', ...
  '    linear-gradient(216deg, #e3d7bf 7.5%, transparent 7.5%) -20px 73px,\n', ...
  '    linear-gradient(144deg, #e3d7bf 7.5%, transparent 7.5%) 80px 73px !important;\n',...
  '    background-color: #232977 !important;\n',...
  '    background-size: 100px 100px !important;\n',...
  '  }\n', ...
  '  .scrollpane::-webkit-scrollbar {\n', ...
  '    width: 20px;\n', ...
  '  }\n', ...
  '  /* Track */\n', ...
  '  .scrollpane::-webkit-scrollbar-track {\n', ...
  '    background-color: white;\n', ...
  '    box-shadow: inset 0 0 5px white;\n', ... 
  '    border-radius: 10px;\n', ...
  '  }\n', ...
  '  /* Handle */\n', ...
  '  .scrollpane::-webkit-scrollbar-thumb {\n', ...
  '    background: red; \n', ...
  '    border-radius: 10px;\n', ...
  '  }\n', ...
  '  /* Handle on hover */\n', ...
  '  .scrollpane::-webkit-scrollbar-thumb:hover {\n', ...
  '    background: #b30000; \n', ...
  '  }\n', ...
  '  .blockdiv {\n', ...
  '    color: black;\n', ...
  '    font: 25px Arial, sans-serif !important;\n', ...
  '    background: rgba(255,255,255,0.75);\n', ...
  '    width: 100%;\n', ...
  '    height: 30px;\n', ...
  '  }\n', ...
  '  .textdiv {\n', ...
  '    position: relative;\n', ...
  '    float: left;\n', ...
  '    top: 50%;\n', ...
  '    left: 50%;\n', ...
  '    transform: translate(-50%, -50%);\n', ...
  '  }\n', ...
  '</style>''' ...
  ];

[webWindow, panelID] = mlapptools.getWebElements(scrollPane);
%inject css
webWindow.executeJS(['document.head.innerHTML += ',cssText]);

%make a dojo query string
setClassString = sprintf(...
  'dojo.addClass(dojo.query("[%s = ''%s'']")[0], "%s")',...
  panelID.ID_attr, panelID.ID_val, 'scrollpane');

% add class to DOM element
webWindow.executeJS(setClassString);

%{
% allow scrollbars on the <div> element
mlapptools.setStyle(scrollPane, 'overflow-x', 'hidden');
mlapptools.setStyle(scrollPane, 'overflow-y', 'scroll');
% set the viewable dimensions
mlapptools.setStyle(scrollPane, 'height', sprintf('%dpx',viewHeight));
mlapptools.setStyle(scrollPane, 'width', sprintf('%dpx',totalWidth));
%}

%% add some static text
nodeID = sprintf('''[%s="%s"]''', panelID.ID_attr, panelID.ID_val);
js = sprintf( ...
  [ ...
    'var d = document.createElement("div");', ...
    'var t = document.createElement("div");', ...
    't.id = "inputter";',...
    'd.classList.add("blockdiv");',...
    't.classList.add("textdiv");', ...
    't.innerHTML= "Some Static Text";', ...
    'd.addEventListener(''mouseover'', function(e){', ...
    '  this.firstChild.innerHTML = ''<h1>YARGH</h1>'';});', ...
    'd.addEventListener(''mouseout'', function(e){', ...
    '  this.firstChild.innerHTML = "Some Static Text";});', ...
    'd.appendChild(t);', ...
    'document.querySelectorAll(%s)[0]',...
    '.insertBefore(d,document.querySelectorAll(%s)[0].firstChild);', ...
    'document.addEventListener(''keypress'', function(e){', ...
    '  let tK = "";',...
    '  if (e.altKey) tK += ''ALT+'';',...
    '  if (e.ctrlKey) tK += ''CTRL+'';',...
    '  if (e.metaKey) tK += ''META+'';',...
    '  if (e.shiftKey) tK += ''SHIFT+'';',...
    '  tK += e.key;',...
    '  let tt = document.getElementById("inputter").innerHTML = tK;' ...
    '});' ...
  ], ...
  nodeID, nodeID ...
);

webWindow.executeJS(js);
