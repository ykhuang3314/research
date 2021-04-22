/* Global variables */
_TBODY = "TBODY";
_TR    = "TR";

_RowSpan = "rowspan";
_ColSpan = "colspan";
_Class   = "class";


_ValidValue = "validValue";
_WrongValue = "wrongValue";

_SParam   = "Parameters";
_SMembers = "Members";

//Symbols
_symbMoreDiff  = "#";
_symbMoreValid = "=";
_symbMoreAll   = "+";

_symbLessDiff  = "-";
_symbLessValid = "-";
_symbLessAll   = "-";

//Section Names
_idSep         = "_";
_idConstraint  = "Con"       + _idSep;
_idProperties  = "ConProp"   + _idSep;
_idMembers     = "Mbrs"      + _idSep;
_idParameters  = "Params"    + _idSep;
_idMemberParam = "MbrParams" + _idSep;
_idSection     = "Section";

//Start button id
_idBtnValid = "btnEq_";
_idBtnDiff  = "btnDiff_";
_idBtnAll   = "btnAll_";

function isButtonAll(b){
    return (b.id.substring(0, _idBtnAll.length)) === _idBtnAll;
}

function isButtonDiff(b){
    return (b.id.substring(0, _idBtnDiff.length)) === _idBtnDiff;
}

function isButtonEqual(b){
    return (b.id.substring(0, _idBtnValid.length)) === _idBtnValid;
}


//Visibility mode
_visible  = "visible";
_hideRow  = "collapse";

_visibleD = "table-row";
_hideRowD = "none";

//Comparison table name
_mainTable = "mainTable";

//Sorting weights
_wStatus = 8;
_wType   = 4;
_wName1  = 2;
_wName2  = 1;
_sDesc   = -1; //valid value -1 or 1; set to 1 for descending order:

/* END Global variables */
var _rsOffset = 0;

// Page initialization
window.onload = function() {
    sortByStatus(_sDesc);
    adjustRowSpans();
    createMapping();
};

function adjustRowSpans(){
    var table = document.getElementById(_mainTable);
    var bodies = table.getElementsByTagName(_TBODY);
    var i = 0;
    for(i ; i< bodies.length-1; i++){
        adjustRowSpan(bodies[i]);
    }
}

function adjustRowSpan(tableBody){
    var cells = tableBody.rows[0].cells;
    cells[0].setAttribute(_RowSpan, tableBody.childElementCount);
    cells[1].setAttribute(_RowSpan, tableBody.childElementCount);
}

/* sort table */
function sortByStatus(asc){
    _sDesc   = asc;
    _wStatus = 8;
    _wType   = 4;
    _wName1  = 2;
    _wName2  = 1;
    sortTable();
}

function sortByType(asc){
    _sDesc   = asc;
    _wStatus = 4;
    _wType   = 8;
    _wName1  = 2;
    _wName2  = 1;
    sortTable();
}

function sortByName(e, asc){
    var target = e.target;
    target.parentElement.children[7] === target ? sortByName1(asc) : sortByName2(asc);
}

function sortByName1(asc){
    _sDesc   = asc;
    _wStatus = 4;
    _wType   = 2;
    _wName1  = 8;
    _wName2  = 1;
    sortTable();
}

function sortByName2(asc){
    _sDesc   = asc;
    _wStatus = 4;
    _wType   = 2;
    _wName1  = 1;
    _wName2  = 8;
    sortTable();
}

function sortTable(){
    var table = document.getElementById(_mainTable);
    var bodies = table.getElementsByTagName(_TBODY);
    var i = 0;
    var j = 0;
    for(i ; i< bodies.length-1; i++){
        for(j = i + 1; j < bodies.length-1; j++){
            if(compTBody( bodies[j], bodies[i]) === _sDesc){
                table.insertBefore(bodies[j], bodies[i]);
            }
        }
    }
}

function compTBody(tbody1, tbody2){
    var children1 = tbody1.rows[0];
    var children2 = tbody2.rows[0];

    var statusResult = compStatus(tbody1.classList[0]       , tbody2.classList[0]         )  * _wStatus ;
    var typeResult = compString(children1.cells[1].innerHTML, children2.cells[1].innerHTML)  * _wType ;
    var nameResult1 = compString(children1.cells[6].innerHTML, children2.cells[6].innerHTML) * _wName1 ;
    var nameResult2 = compString(children1.cells[7].innerHTML, children2.cells[7].innerHTML) * _wName2 ;

    var result = statusResult + typeResult + nameResult1 + nameResult2;
    if(result === 0) {return 0; }
    return result < 0 ? -1 : 1;
}

function compString(string1, string2){
    if(string1 === string2){return 0;}
    return string1 < string2 ? -1 : 1;
}

//returns -1 if status1 < status2
//returns 0 if status1 = status2
//returns +1 if status1 > status2
function compStatus(status1, status2){
    if(status1 === status2){ return 0;}
    return getStatusValue(status1) < getStatusValue(status2) ? -1 : 1;
}

//0 -> unknown status
//"1 - Failed
//"2 - Failed_Locally
//"3 - Mismatch
//"4 - Unchecked
//"5 - Inactive
//"6 - Unbound
//"7 - Passed_Locally
//"8 - Passed"
// NoStatus, ///< Not yet checked.
// Passed, ///< Enforced.
// Failed, ///< Violated
// Inactive, ///< Out of context or disabled.
// Unbound, ///< Not bound to cons in other view.
// UnboundPassed, ///< Not bound, enforced locally.
// UnboundFailed, ///< Not bound, violated locally.
// BoundDiff ///< Bound, has some kind of difference.

function getStatusValue(status){
    if(status === "Failed")        {return 1;}
    if(status === "UnboundFailed") {return 2;}
    if(status === "BoundDiff")     {return 3;}
    if(status === "NoStatus")      {return 4;}
    if(status === "Inactive")      {return 5;}
    if(status === "Unbound")       {return 6;}
    if(status === "UnboundPassed") {return 7;}
    if(status === "Passed")        {return 8;}
    return 0;
}

//////////////////////////////////// TEST ////////////////////////////////////////////
_SEC_CONSTRAINT = 0;
_SEC_PARAMTOP   = 1;
_SEC_PROPERTIES = 2;
_SEC_MEMBERSTOP = 3;
_SEC_MBR        = 4;

_NO_ACTION     = 0;
_HIDE_CHILDREN = 1;
_SHOW_CHILDREN = 2;

_HIDE_ALL_CHILDREN = 3; //recursive hideChildren
_SHOW_ALL_CHILDREN = 4; //recursive showChildren

_BTN_ALL        = 0;
_BTN_EQUAL      = 1;
_BTN_DIFF       = 2;

_BODY_TO_ROW_SECTION = [];
_BODY_TO_INDEX_ROW   = [];

_ID_SEP         = "_";
_ID_SECTION     = "Section";
_ID_CONSTRAINT  = "Con"       + _ID_SEP;
_ID_PROPERTIES  = "ConProp"   + _ID_SEP;
_ID_PARAMETERS  = "Params"    + _ID_SEP;
_ID_PARAMTOP    = _ID_SECTION + _ID_SEP + _ID_PARAMETERS;
_ID_MEMBERS     = "Mbrs"      + _ID_SEP;
_ID_MEMBERSTOP  = _ID_SECTION + _ID_SEP + _ID_MEMBERS;
_ID_MEMBERPARAM = "MbrParams" + _ID_SEP;

function rowIndexToInfo(btnTypes, btnAll, btnEqual, btnDiff, section, parent, children){
    this.btnTypes = btnTypes;
    this.btnAll   = btnAll;
    this.btnEqual = btnEqual;
    this.btnDiff  = btnDiff;
    this.section  = section;
    this.parent   = parent;
    this.children = children;
}

function infoBody(bodyMapping){
    this.bodyMapping = bodyMapping;
}

function createMapping(){
    var table = document.getElementById(_mainTable);
    var bodies = table.getElementsByTagName(_TBODY);
    var b = 0;
    var body;
    for(b; b < bodies.length-1; b++){
        body = bodies[b];
        _BODY_TO_ROW_SECTION.push(createBodyMapping(bodies[b]));
        _BODY_TO_INDEX_ROW.push(body);
    }
}

//try to use startsWith -- check compatibility issue
function isSectionConstraint(rowId){
    return rowId.indexOf(_ID_CONSTRAINT) === 0;
}

function isSectionProperties(rowId){
    return rowId.indexOf(_ID_PROPERTIES)  === 0;
}

function isSectionParameters(rowId){
    return rowId.indexOf(_ID_PARAMTOP) === 0;
}

function isParameter(rowId){
    return rowId.indexOf(_ID_PARAMETERS) === 0;
}

function isSectionMembers(rowId){
    return rowId.indexOf(_ID_MEMBERSTOP) === 0;
}

function isMember(rowId){
    return rowId.indexOf(_ID_MEMBERS)  === 0;
}

function isMemberParameter(rowId){
    return rowId.indexOf(_ID_MEMBERPARAM)  === 0;
}

function arrayButton(btnAll, btnEqual, btnDiff){
    return {btnAll:btnAll, btnEqual:btnEqual, btnDiff:btnDiff};
}

function buttonToRow(button, row){
    return {button:button, row:row};
}

//function mapping
function createBodyMapping(body){
    var rowSecConstraint = Infinity;
    var rowSecParameters = Infinity;
    var rowSecMembers    = Infinity;
    var rowMember        = Infinity;
    var rowToParent      = []; //row to parent row
    var rowToChildren    = []; //row to children rows
    rowToChildren[0]     = [];
    rowToChildren[0][0]  = [];

    var sectionToRow          = [];
    var m = _SEC_CONSTRAINT;
    for(m; m < _SEC_MBR + 1; m++){
        sectionToRow[m]    = [];
        sectionToRow[m][0] = [];
    }

    var rowToButtonList  = [];
    var buttonKeys        = [];
    var buttonToRowList  = [];

    var rows             = body.rows;
    var r = 0;
    for(r; r < rows.length; r++){
        var row   = rows[r];
        var rowId = rows[r].id;
        var isTopSection= isSectionConstraint(rowId);
// CREATE BUTTON MAPPING
        if(isTopSection || isRowControlledByButton(row)){
            var btnAll   = getButtonAll(row, isTopSection);
            if(btnAll){ buttonToRowList.push(buttonToRow(btnAll, r)); buttonKeys.push(btnAll); }
            var btnEqual = getButtonValid(row, isTopSection);
            if(btnEqual) { buttonToRowList.push(buttonToRow(btnEqual, r)); buttonKeys.push(btnEqual); }
            var btnDiff  = getButtonDiff(row, isTopSection);
            if(btnDiff){ buttonToRowList.push(buttonToRow(btnDiff, r)); buttonKeys.push(btnDiff);}
            rowToButtonList[r] = arrayButton(btnAll, btnEqual, btnDiff);
        }
// CREATE SECTION MAPPING
        rowToChildren[r] = [];
        if(isTopSection){
            rowToParent[r]   = Infinity;
            rowSecConstraint = r;
            sectionToRow[_SEC_CONSTRAINT].push(r);
        }
        else if(isSectionProperties(rowId)){
            rowToParent[r] = rowSecConstraint;
            rowToChildren[rowSecConstraint].push(r);
        }
        else if(isSectionParameters(rowId)){
            rowToParent[r]   = rowSecConstraint;
            rowSecParameters = r;
            rowToChildren[rowSecConstraint].push(r);
            sectionToRow[_SEC_PARAMTOP].push(r);
        }
        else if(isParameter(rowId)){
            rowToParent[r] = rowSecParameters;
            rowToChildren[rowSecParameters].push(r);
        }
        else if(isSectionMembers(rowId)){
            rowToParent[r] = rowSecConstraint;
            rowSecMembers  = r;
            rowToChildren[rowSecConstraint].push(r);
            sectionToRow[_SEC_MEMBERSTOP].push(r);
        }
        else if(isMember(rowId)){
            rowToParent[r] = rowSecMembers;
            rowMember      = r;
            rowToChildren[rowSecMembers].push(r);
            sectionToRow[_SEC_MBR].push(r);
        }
        else{//Member parameters
            rowToParent[r] = rowMember;
            rowToChildren[rowMember].push(r);
        }
    }

    return {rowToParent:rowToParent,
            rowToChildren:rowToChildren,
            rowToButtonList:rowToButtonList, //add status to buttonList
            buttonToRow:{buttons:buttonKeys, buttonInfo:buttonToRowList}};
}

function clickAllButtonIf(btnType, action){
    var btns = document.getElementsByClassName("buttons");
    var b = 0;
    var button = 0;
    var isOfType = false;
    var tdButton = 0;
    var row = 0;
    for(b; b < btns.length; b++){
        tdButton = btns[b];
        button = tdButton.children[0];
        switch(btnType){
            case _BTN_ALL: isOfType   = isButtonAll(tdButton);
            break;
            case _BTN_DIFF: isOfType  = isButtonDiff(tdButton);
            break;
            case _BTN_EQUAL: isOfType = isButtonEqual(tdButton);
            break;
            default: isOfType = false;
            break;
        }
        if(isOfType && (action == getAction(button, btnType))){
            clickButton(button);
            row = tdButton.parentElement;
            if(action === _HIDE_CHILDREN){
                if(row.id.substring(0, 4) !== _ID_CONSTRAINT){
                    row.style.display    = _hideRowD;   
                    row.style.visibility = _hideRow;
                }
            }
            else{
                row.style.display    = _visible;   
                row.style.visibility = _visibleD;
            }
        }
    }
}

function headerAll(){
    return document.getElementById(_mainTable).children[0].children[0].children[2];
}

function headerEqual(){
    return document.getElementById(_mainTable).children[0].children[0].children[3];
}

function headerDiff(){
    return document.getElementById(_mainTable).children[0].children[0].children[4];
}

function expandAll(){
    var td = headerAll();
    if(td.innerHTML === _symbMoreAll){
        td.innerHTML = _symbLessAll;
        headerDiff().innerHTML = _symbMoreDiff;
        headerEqual().innerHTML = _symbMoreValid;
        clickAllButtonIf(_BTN_ALL, _SHOW_CHILDREN);
    }
    else{
        hideAll();
    }
}

function expandEqual(){
    hideAll();
    var td = headerEqual();
    if(td.innerHTML === _symbMoreValid){
        td.innerHTML = _symbLessValid;
        headerDiff().innerHTML = _symbMoreDiff;
        headerAll().innerHTML = _symbMoreAll;
        clickAllButtonIf(_BTN_EQUAL, _SHOW_CHILDREN);
    }
    else{
        td.innerHTML = _symbMoreValid;
        clickAllButtonIf(_BTN_EQUAL, _HIDE_CHILDREN);
    }
}

function expandDiff(){
    hideAll();
    var td = headerDiff();
    if(td.innerHTML === _symbMoreDiff){
        td.innerHTML = _symbLessDiff;
        headerEqual().innerHTML = _symbMoreValid;
        headerAll().innerHTML = _symbMoreAll;
        clickAllButtonIf(_BTN_DIFF, _SHOW_CHILDREN);
    }
    else{
        td.innerHTML = _symbMoreDiff;
        clickAllButtonIf(_BTN_DIFF, _HIDE_CHILDREN);
    }
}

function hideAll(){
    if(headerAll().innerHTML === _symbLessAll){
        clickAllButtonIf(_BTN_ALL, _HIDE_CHILDREN);
    }
    else if(headerDiff().innerHTML === _symbLessDiff){
        clickAllButtonIf(_BTN_DIFF, _HIDE_CHILDREN);    
    }
    else if(headerEqual().innerHTML === _symbLessValid){
        clickAllButtonIf(_BTN_EQUAL, _HIDE_CHILDREN);
    }
}

function hideEqual(){
}

function hideDiff(){
}

//Actions
function clickBtn(e){
    clickButton(e.target);
}


function clickButton(button){
    var row = getFirstParentOf(button, _TR);
    var body = getFirstParentOf(row, _TBODY);
    var bodyIndex = _BODY_TO_INDEX_ROW.indexOf(body);
    var rowInfo = _BODY_TO_ROW_SECTION[bodyIndex];
    var rowIndex = rowInfo.buttonToRow.buttonInfo[rowInfo.buttonToRow.buttons.indexOf(button)].row;
    var btnList = rowInfo.rowToButtonList[rowIndex];
    var buttonType = getButtonType(button, rowInfo.rowToButtonList[rowIndex]);
    var action = getAction(button, buttonType);
    var btnToHide;
    if(buttonType === _BTN_DIFF){ btnToHide = _BTN_EQUAL; }
    else if(buttonType === _BTN_EQUAL){ btnToHide = _BTN_DIFF; }
    //todo update button all only if buttonAll click or if only diff or only equals
    var needTxtUpdate = (button === btnList.btnAll) || !btnList.btnDiff || !btnList.btnEqual;

    if(action){
    switch(action) {
        case _HIDE_CHILDREN:
            hideChildren(body, rowInfo.rowToChildren[rowIndex], rowInfo, buttonType);
            setBtnTextMore(btnList.btnAll, btnList); 
            if(buttonType === _BTN_DIFF){       setBtnTextMore(btnList.btnDiff, btnList); }
            else if(buttonType === _BTN_EQUAL){ setBtnTextMore(btnList.btnEqual, btnList); }
            if(needTxtUpdate){ 
                setBtnTextMore(btnList.btnDiff, btnList);
                setBtnTextMore(btnList.btnEqual, btnList);
            }
            break;
        case _HIDE_ALL_CHILDREN:
            break;
        case _SHOW_CHILDREN:
            if(buttonType !== _BTN_ALL){ hideChildren(body, rowInfo.rowToChildren[rowIndex], rowInfo, btnToHide); }

            showChildren(body, rowInfo.rowToChildren[rowIndex], rowInfo, buttonType);

            if(buttonType === _BTN_DIFF){ 
                setBtnTextLess(btnList.btnDiff, btnList); 
                setBtnTextMore(btnList.btnEqual, btnList);
                setBtnTextMore(btnList.btnAll, btnList);           
            }
            else if(buttonType === _BTN_EQUAL){
                setBtnTextLess(btnList.btnEqual, btnList);
                setBtnTextMore(btnList.btnDiff, btnList);
                setBtnTextMore(btnList.btnAll, btnList);
            }
            else if(buttonType === _BTN_ALL){
                setBtnTextLess(btnList.btnAll, btnList);
                if(btnList.btnDiff && btnList.btnEqual){
                    setBtnTextMore(btnList.btnDiff, btnList);
                    setBtnTextMore(btnList.btnEqual, btnList);
                }
            }
            if(!btnList.btnDiff || !btnList.btnEqual){
                setBtnTextLess(btnList.btnAll, btnList);
                setBtnTextLess(btnList.btnDiff, btnList);
                setBtnTextLess(btnList.btnEqual, btnList);
            }
        break;
        case _SHOW_ALL_CHILDREN:
        break;
    }
    }
}

function getButtonType(btn, btnList){
    if(btn === btnList.btnAll){ return _BTN_ALL; }
    if(btn === btnList.btnEqual){ return _BTN_EQUAL; }
    if(btn === btnList.btnDiff){  return _BTN_DIFF; }
}

function getAction(btn, btnType){
    switch(btnType){
        case _BTN_ALL:
        return btn.innerHTML === _symbMoreAll ? _SHOW_CHILDREN : _HIDE_CHILDREN;
        case _BTN_EQUAL:
        return btn.innerHTML === _symbMoreValid ? _SHOW_CHILDREN : _HIDE_CHILDREN;
        case _BTN_DIFF:
        return btn.innerHTML === _symbMoreDiff ? _SHOW_CHILDREN : _HIDE_CHILDREN;
    }
    return _NO_ACTION;
}

function showChildren(body, children, rowInfo, btnType){
    var c = 0;
    var rowIndex = 0;
    var row;
    var btnList;
    for(c; c < children.length; c++){
        rowIndex = children[c];
        row = body.rows[rowIndex];
        btnList = rowInfo.rowToButtonList[rowIndex];
        if(     (btnType === _BTN_ALL)
            || ((btnType === _BTN_EQUAL) && isRowContainsEqual(row, btnList))
            || ((btnType === _BTN_DIFF)  && isRowContainsDiff(row, btnList))){
            row.style.display    = _visibleD;
            row.style.visibility = _visible;
        }
    }
}

function hideChildren(body, children, rowInfo, btnType){
    var c = 0;
    var rowIndex = 0;
    var row;
    var btnList;
    for(c; c < children.length; c++){
        rowIndex = children[c];
        row = body.rows[rowIndex];
        btnList = rowInfo.rowToButtonList[rowIndex];
        body.rows[children[c]].style.display    = _hideRowD;
        body.rows[children[c]].style.visibility = _hideRow;

        if(btnList){
            if(btnType !== _BTN_DIFF) { setBtnTextMore(btnList.btnDiff, btnList);  }
            if(btnType !== _BTN_EQUAL){ setBtnTextMore(btnList.btnEqual, btnList); }
            setBtnTextMore(btnList.btnAll, btnList);
        }

        hideChildren(body, rowInfo.rowToChildren[rowIndex], rowInfo, btnType);// recursive hide
    }
}

function isRowContainsEqual(row, btnList){
    if(btnList){
     return btnList.btnEqual ? true : false;
    }
    else{
        return row.firstChild.classList.contains(_ValidValue);
    }
}

function isRowContainsDiff(row, btnList){
    if(isRowControlledByButton(row)){
     return btnList.btnDiff ? true : false;
    }
    else{
        return row.firstChild.classList.contains(_WrongValue);
    }
}

function setBtnTextMore(button, buttonList){
    if(!buttonList || !button){ return; }
    if(button === buttonList.btnAll){ button.innerHTML = _symbMoreAll; }
    else if(button === buttonList.btnEqual){ button.innerHTML = _symbMoreValid; }
    else if(button === buttonList.btnDiff){ button.innerHTML = _symbMoreDiff; }
}

function setBtnTextLess(button, buttonList){
    if(!buttonList || !button){ return; }
    if(button === buttonList.btnAll){ button.innerHTML = _symbLessAll; }
    else if(button === buttonList.btnEqual){ button.innerHTML = _symbLessValid; }
    else if(button === buttonList.btnDiff){ button.innerHTML = _symbLessDiff; }
}

//////////////////////////////////// END TEST ////////////////////////////////////////////

function isRowControlledByButton(row){
    return row.cells[0].getAttribute(_ColSpan) != 3;
}

/* button functions */

//Retrieve buttons

function getButtonAll(row, isTopSection){
    return isTopSection ? getButtonAll0(row) : getButtonAll1(row);
}

function getButtonValid(row, isTopSection){
    return isTopSection ? getButtonValid0(row) : getButtonValid1(row);
}

function getButtonDiff(row, isTopSection){
    return isTopSection ? getButtonDiff0(row) : getButtonDiff1(row);
}

function getButtonAll0(row){
    return row.cells[2].children[0];
}

function getButtonAll1(row){
    return row.cells[0].children[0];
}

function getButtonValid1(row){
    return row.cells[1].children[0];
}

function getButtonValid0(row){
    return row.cells[3].children[0];
}

function getButtonDiff0(row){
    return row.cells[4].children[0];
}

function getButtonDiff1(row){
    return row.cells[2].children[0];
}
// end Retrieve buttons

////////////////////////////////////////////////////////////////////

function getFirstParentOf(button, parenTagName){
    var parent = button;
    while( parent && !(parent.tagName === parenTagName)){
        parent = parent.parentNode;
    }
    return parent;
}
