%% CSS for table aesthetic from https://purecss.io/tables/
tableCSS = [ '''<style>\n', ...
  '/* Pure table */\n', ...
  '.pure-table {\n', ...
  '  empty-cells: show !important;\n', ...
  '  border: 1px solid #cbcbcb !important;\n', ...
  '}\n', ...
  '.pure-table, table {\n', ...
  '  border-collapse: collapse !important;\n', ...
  '  border-spacing: 0 !important;\n', ...
  '}\n', ...
  '.pure-table caption {\n', ...
  '  color: #000 !important;\n', ...
  '  font: italic 85%/1 arial, sans-serif !important;\n', ...
  '  padding: 1em 0 !important;\n', ...
  '  text-align: center !important;\n', ...
  '}\n', ...
  '.pure-table td, .pure-table th {\n', ...
  '  border-left: 1px solid #cbcbcb !important;\n', ...
  '  border-width: 0 0 0 1px !important;\n', ...
  '  font-size: inherit !important;\n', ...
  '  margin: 0 !important;\n', ...
  '  overflow: visible !important;\n', ...
  '  padding: .5em 1em !important;\n', ...
  '}\n', ...
  '.pure-table td:first-child, .pure-table th:first-child {\n', ...
  '  border-left-width: 0 !important;\n', ...
  '}\n', ...
  '.pure-table thead {\n', ...
  '  background-color: #e0e0e0 !important;\n', ...
  '  color: #000 !important;\n', ...
  '  text-align: left !important;\n', ...
  '  vertical-align: bottom !important;\n', ...
  '}\n', ...
  '.pure-table td {\n', ...
  '  background-color: transparent !important;\n', ...
  '}\n', ...
  '</style>\n''' ...
];
%% JavaScript template
% Note that the line `const nodeID = %s;` is written to accept
% a nodeID string through `sprintf(js, nodeID);`
js = [ ...
  '// Collect browser information from Navigator \n', ...
  '// insert into table on DOM. for \n', ...
  'const nodeID = %s; \n', ...
  'function buildRow(name,value){ \n', ...
  '  //function builds a tr (table row) node \n', ...
  '  var tRow = document.createElement("tr"); \n', ...
  '  var Lcol = document.createElement("td"); \n', ...
  '  var Rcol = document.createElement("td"); \n', ...
  '  Lcol.innerHTML = name; \n', ...
  '  Rcol.innerHTML = value; \n', ...
  '  tRow.appendChild(Lcol); \n', ...
  '  tRow.appendChild(Rcol); \n', ...
  '  return tRow; \n', ...
  '} \n', ...
  '// use navigator to grab some browser info \n', ...
  'var nav = window.navigator; \n', ...
  '// create a table \n', ...
  'var tab = document.createElement("table"); \n', ...
  'tab.classList.add("pure-table"); \n', ...
  '// build each row from the navigator object \n', ...
  'let trElement \n', ...
  'for(key in nav){ \n', ...
  '  trElement = buildRow(key,nav[key]); \n', ...
  '  tab.appendChild(trElement); \n', ...
  '} \n', ...
  '// get matlab uielement dom and remove all inner nodes \n', ...
  'var matlabUI = document.querySelectorAll(nodeID)[0]; \n', ...
  'while (matlabUI.firstChild) { \n', ...
  '    matlabUI.removeChild(matlabUI.lastChild); \n', ...
  '} \n', ...
  '// add our table to the uielement \n', ...
  'var newdiv = document.createElement("div");\n',...
  'newdiv.appendChild(tab); \n', ...
  'matlabUI.appendChild(newdiv); \n' ...
  ];
%% Create figure
% make a figure big enough for the table
fig = uifigure('position', [100,100,955,1075],'Name', 'Matlab Browser Info');
fig.AutoResizeChildren = 'off';

% make a panel big enough for the table
pan = uipanel(fig, 'backgroundcolor', [1,1,1]);
pan.Position = [1,1,955,1075];

% use MLAPPTOOLS to get the panelID (nodeID) and webWindow
%  https://github.com/StackOverflowMATLABchat/mlapptools
[webwin,panID] = mlapptools.getWebElements(pan);

%make nodeID string for js
nodeID = sprintf('''[%s="%s"]''', panID.ID_attr, panID.ID_val);

%inject CSS into the head
webwin.executeJS(['document.head.innerHTML += ',tableCSS]);

% run the JS to inspect navigator and make table
webwin.executeJS(sprintf(js,nodeID));
