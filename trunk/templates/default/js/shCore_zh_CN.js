var dp={
sh:
{
Toolbar:{},
Utils:{},
RegexLib:{},
Brushes:{},
Strings:{},
Version:'1.4.1'
}
};
dp.SyntaxHighlighter=dp.sh;
dp.sh.Toolbar.Commands={
ExpandSource:{
label:'+ \u5c55\u5f00',
check:function(highlighter){return highlighter.collapse;},
func:function(sender,highlighter){
sender.parentNode.removeChild(sender);
highlighter.div.className=highlighter.div.className.replace('collapsed','');
}},
ViewSource:{
label:'\u6e90\u7801',
func:function(sender,highlighter){
var code=highlighter.originalCode.replace(/</g,'&lt;');
var wnd=window.open('','_blank','width=750,height=400,location=0,resizable=1,menubar=0,scrollbars=1');
wnd.document.write('<textarea style="width:99%;height:99%">' + code + '</textarea>');
wnd.document.close();
}},
CopyToClipboard:{
label:'\u590d\u5236',
check:function(){return window.clipboardData != null;},
func:function(sender,highlighter){
window.clipboardData.setData('text',highlighter.originalCode);
alert('\u4ee3\u7801\u5df2\u590d\u5236');
}},
PrintSource:{
label:'\u6253\u5370',
func:function(sender,highlighter){
var iframe=document.createElement('IFRAME');
var doc=null;
iframe.style.cssText='position:absolute;width:0px;height:0px;left:-500px;top:-500px;';
document.body.appendChild(iframe);
doc=iframe.contentWindow.document;
dp.sh.Utils.CopyStyles(doc,window.document);
doc.write('<div class="' + highlighter.div.className.replace('collapsed','') + ' printing">' + highlighter.div.innerHTML + '</div>');
doc.close();
iframe.contentWindow.focus();
iframe.contentWindow.print();
alert('\u70b9\u786e\u5b9a\u5f00\u59cb\u6253\u5370...');
document.body.removeChild(iframe);
}}};
dp.sh.Toolbar.Create=function(highlighter){
var div=document.createElement('DIV');
div.className='tools';
for(var name in dp.sh.Toolbar.Commands){
var cmd=dp.sh.Toolbar.Commands[name];
if(cmd.check != null && !cmd.check(highlighter))
continue;
div.innerHTML += '<a href="#" onclick="dp.sh.Toolbar.Command(\'' + name + '\',this);return false;">' + cmd.label + '</a>';
}
return div;}
dp.sh.Toolbar.Command=function(name,sender){
var n=sender;
while(n != null && n.className.indexOf('dp-highlighter') == -1)
n=n.parentNode;
if(n != null)
dp.sh.Toolbar.Commands[name].func(sender,n.highlighter);
}
dp.sh.Utils.CopyStyles=function(destDoc,sourceDoc){
var links=sourceDoc.getElementsByTagName('link');
for(var i=0;i<links.length;i++)
if(links[i].rel.toLowerCase() == 'stylesheet')
destDoc.write('<link type="text/css" rel="stylesheet" href="' + links[i].href + '"></link>');
}
dp.sh.RegexLib={
MultiLineCComments:new RegExp('/\\*[\\s\\S]*?\\*/','gm'),
SingleLineCComments:new RegExp('//.*$','gm'),
SingleLinePerlComments:new RegExp('#.*$','gm'),
DoubleQuotedString:new RegExp('"(?:\\.|(\\\\\\")|[^\\""])*"','g'),
SingleQuotedString:new RegExp("'(?:\\.|(\\\\\\')|[^\\''])*'",'g')
};
dp.sh.Match=function(value,index,css){
this.value=value;
this.index=index;
this.length=value.length;
this.css=css;
}
dp.sh.Highlighter=function(){
this.noGutter=false;
this.addControls=true;
this.collapse=false;
this.tabsToSpaces=true;
this.wrapColumn=80;
this.showColumns=true;}
dp.sh.Highlighter.SortCallback=function(m1,m2){
if(m1.index<m2.index)
return -1;
else if(m1.index > m2.index)
return 1;
else{
if(m1.length<m2.length)
return -1;
else if(m1.length > m2.length)
return 1;
}
return 0;}
dp.sh.Highlighter.prototype.CreateElement=function(name){
var result=document.createElement(name);
result.highlighter=this;
return result;}
dp.sh.Highlighter.prototype.GetMatches=function(regex,css){
var index=0;
var match=null;
while((match=regex.exec(this.code)) != null)
this.matches[this.matches.length]=new dp.sh.Match(match[0],match.index,css);}
dp.sh.Highlighter.prototype.AddBit=function(str,css){
if(str == null || str.length == 0)
return;
var span=this.CreateElement('SPAN');
str=str.replace(/&/g,'&amp;');
str=str.replace(/ /g,'&nbsp;');
str=str.replace(/</g,'&lt;');
str=str.replace(/\n/gm,'&nbsp;<br>');
if(css != null){
var regex=new RegExp('<br>','gi');
if(regex.test(str)){
var lines=str.split('&nbsp;<br>');
str='';
for(var i=0;i<lines.length;i++){
span=this.CreateElement('SPAN');
span.className=css;
span.innerHTML=lines[i];
this.div.appendChild(span);
if(i + 1<lines.length)
this.div.appendChild(this.CreateElement('BR'));
}}else{
span.className=css;
span.innerHTML=str;
this.div.appendChild(span);}}
else{
span.innerHTML=str;
this.div.appendChild(span);}}
dp.sh.Highlighter.prototype.IsInside=function(match){
if(match == null || match.length == 0)
return false;
for(var i=0;i<this.matches.length;i++)
{
var c=this.matches[i];
 if(c == null)
 continue;
 if((match.index > c.index) && (match.index<c.index + c.length))
 return true;
}
 return false;
}
dp.sh.Highlighter.prototype.ProcessRegexList=function()
{
 for(var i=0;i<this.regexList.length;i++)
 this.GetMatches(this.regexList[i].regex,this.regexList[i].css);
}

dp.sh.Highlighter.prototype.ProcessSmartTabs=function(code)
{
var lines=code.split('\n');
var result='';
var tabSize=4;
var tab='\t';
 function InsertSpaces(line,pos,count)
{
var left=line.substr(0,pos);
var right=line.substr(pos + 1,line.length);// pos + 1 will get rid of the tab
var spaces='';
 for(var i=0;i<count;i++)
 spaces += ' ';
 return left + spaces + right;
}
 function ProcessLine(line,tabSize)
{
 if(line.indexOf(tab) == -1)
 return line;
var pos=0;
 while((pos=line.indexOf(tab)) != -1)
{
var spaces=tabSize - pos % tabSize;
 line=InsertSpaces(line,pos,spaces);
}
 return line;
}
 for(var i=0;i<lines.length;i++)
 result += ProcessLine(lines[i],tabSize) + '\n';
 return result;
}
dp.sh.Highlighter.prototype.SwitchToList=function()
{
var html=this.div.innerHTML.replace(/<(br)\/?>/gi,'\n');
var lines=html.split('\n');
 if(this.addControls == true)
 this.bar.appendChild(dp.sh.Toolbar.Create(this));
 if(this.showColumns)
{
var div=this.CreateElement('div');
var columns=this.CreateElement('div');
var showEvery=10;
var i=1;
 while(i <= 150)
{
 if(i % showEvery == 0)
 {
 div.innerHTML += i;
 i += (i + '').length;
 }
 else
 {
 div.innerHTML += '&middot;';
 i++;
 }
}
 columns.className='columns';
 columns.appendChild(div);
 this.bar.appendChild(columns);
}
 for(var i=0,lineIndex=this.firstLine;i<lines.length - 1;i++,lineIndex++)
{
var li=this.CreateElement('LI');
var span=this.CreateElement('SPAN');
 li.className=(i % 2 == 0) ? 'alt':'';
 span.innerHTML=lines[i] + '&nbsp;';
 li.appendChild(span);
 this.ol.appendChild(li);
}
 this.div.innerHTML='';
}
dp.sh.Highlighter.prototype.Highlight=function(code)
{
 function Trim(str)
{
 return str.replace(/^\s*(.*?)[\s\n]*$/g,'$1');
}
 function Chop(str)
{
 return str.replace(/\n*$/,'').replace(/^\n*/,'');
}
 function Unindent(str)
{
var lines=str.split('\n');
var indents=new Array();
var regex=new RegExp('^\\s*','g');
var min=1000;
 for(var i=0;i<lines.length && min > 0;i++)
{
 if(Trim(lines[i]).length == 0)
 continue;
var matches=regex.exec(lines[i]);
 if(matches != null && matches.length > 0)
 min=Math.min(matches[0].length,min);
}
 if(min > 0)
 for(var i=0;i<lines.length;i++)
 lines[i]=lines[i].substr(min);
 return lines.join('\n');
}
 function Copy(string,pos1,pos2)
{
 return string.substr(pos1,pos2 - pos1);
}
var pos=0;
 code=code.replace(/(<br\/> )/g,"");
 this.originalCode=code;
 this.code=Chop(Unindent(code));
 this.div=this.CreateElement('DIV');
 this.bar=this.CreateElement('DIV');
 this.ol=this.CreateElement('OL');
 this.matches=new Array();
 this.div.className='dp-highlighter';
 this.div.highlighter=this;
 this.bar.className='bar';
 this.ol.start=this.firstLine;
 if(this.CssClass != null)
 this.ol.className=this.CssClass;
 if(this.collapse)
 this.div.className += ' collapsed';
 if(this.noGutter)
 this.div.className += ' nogutter';
 if(this.tabsToSpaces == true)
 this.code=this.ProcessSmartTabs(this.code);
 this.ProcessRegexList();
 if(this.matches.length == 0)
{
 this.AddBit(this.code,null);
 this.SwitchToList();
 this.div.appendChild(this.ol);
 return;
}
 this.matches=this.matches.sort(dp.sh.Highlighter.SortCallback);
 for(var i=0;i<this.matches.length;i++)
 if(this.IsInside(this.matches[i]))
 this.matches[i]=null;
 for(var i=0;i<this.matches.length;i++)
{
var match=this.matches[i];
 if(match == null || match.length == 0)
 continue;
 this.AddBit(Copy(this.code,pos,match.index),null);
 this.AddBit(match.value,match.css);
 pos=match.index + match.length;
}
 this.AddBit(this.code.substr(pos),null);
 this.SwitchToList();
 this.div.appendChild(this.bar);
 this.div.appendChild(this.ol);
}
dp.sh.Highlighter.prototype.GetKeywords=function(str) 
{
 return '\\b' + str.replace(/ /g,'\\b|\\b') + '\\b';
}
dp.sh.HighlightAll=function(name,showGutter ,showControls ,collapseAll ,firstLine ,showColumns )
{
 function FindValue()
{
var a=arguments;
 for(var i=0;i<a.length;i++)
{
 if(a[i] == null)
 continue;
 if(typeof(a[i]) == 'string' && a[i] != '')
 return a[i] + '';
 if(typeof(a[i]) == 'object' && a[i].value != '')
 return a[i].value + '';
}
 return null;
}
 function IsOptionSet(value,list)
{
 for(var i=0;i<list.length;i++)
 if(list[i] == value)
 return true;
 return false;
}
 function GetOptionValue(name,list,defaultValue)
{
var regex=new RegExp('^' + name + '\\[(\\w+)\\]$','gi');
var matches=null;
 for(var i=0;i<list.length;i++)
 if((matches=regex.exec(list[i])) != null)
 return matches[1];
 return defaultValue;
}
var elements=document.getElementsByName(name);
var highlighter=null;
var registered=new Object();
var propertyName='value';
 if(elements == null)
 return;
 for(var brush in dp.sh.Brushes)
{
var aliases=dp.sh.Brushes[brush].Aliases;
 if(aliases == null)
 continue;
 for(var i=0;i<aliases.length;i++)
 registered[aliases[i]]=brush;
}
 for(var i=0;i<elements.length;i++)
{
var element=elements[i];
var options=FindValue(
 element.attributes['class'],element.className,
 element.attributes['language'],element.language
 );
var language='';
 if(options == null)
 continue;
 options=options.split(':');
 language=options[0].toLowerCase();
 if(registered[language] == null)
 continue;
 highlighter=new dp.sh.Brushes[registered[language]]();
 element.style.display='none';
 highlighter.noGutter=(showGutter == null) ? IsOptionSet('nogutter',options):!showGutter;
 highlighter.addControls=(showControls == null) ? !IsOptionSet('nocontrols',options):showControls;
 highlighter.collapse=(collapseAll == null) ? IsOptionSet('collapse',options):collapseAll;
 highlighter.showColumns=(showColumns == null) ? IsOptionSet('showcolumns',options):showColumns;
 highlighter.firstLine=(firstLine == null) ? parseInt(GetOptionValue('firstline',options,1)):firstLine;
 highlighter.Highlight(element[propertyName]);
 element.parentNode.insertBefore(highlighter.div,element);
}
}