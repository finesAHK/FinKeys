#NoEnv
#SingleInstance Force
SetBatchLines, -1

htmlCode =
(
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<style>
    body {
        background-color: #010101;
        color: #ffffff;
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 8px;
        overflow: hidden;
        -ms-user-select: none;
        user-select: none;
        cursor: move;
    }
    .hint {
        font-size: 11px;
        color: #87CEEB;
        margin-bottom: 6px;
        font-weight: bold;
        text-shadow: 1px 1px 2px #000000;
    }
    .container {
        display: flex;
        align-items: flex-start;
    }
    .kb-block {
        float: left;
    }
    .row {
        clear: both;
        margin-bottom: 5px;
        height: 36px;
    }
    .key {
        float: left;
        width: 36px;
        height: 36px;
        line-height: 34px;
        text-align: center;
        background-color: #141414;
        border: 2px solid #4a4a4a;
        border-radius: 6px;
        font-weight: 800;
        font-size: 13px;
        margin-right: 5px;
        box-sizing: border-box;
    }
    .key-wide { width: 54px; font-size: 11px; }
    .key-shift { width: 68px; font-size: 11px; }
    .key-space { width: 158px; font-size: 11px; }
    .active {
        background-color: #87CEEB !important;
        color: #000000 !important;
        border-color: #ffffff !important;
    }
    .mouse-block {
        float: left;
        margin-left: 16px;
        width: 96px;
    }
    .mouse-top {
        height: 58px;
        margin-bottom: 5px;
    }
    .m-btn {
        float: left;
        width: 36px;
        height: 58px;
        line-height: 56px;
        text-align: center;
        background-color: #141414;
        border: 2px solid #4a4a4a;
        font-weight: 800;
        font-size: 11px;
        box-sizing: border-box;
    }
    .m-lmb { border-radius: 18px 4px 4px 4px; }
    .m-rmb { border-radius: 4px 18px 4px 4px; }
    .m-mmb {
        float: left;
        width: 14px;
        height: 32px;
        margin: 13px 3px 0 3px;
        background-color: #141414;
        border: 2px solid #4a4a4a;
        border-radius: 6px;
        box-sizing: border-box;
    }
    .mouse-body {
        clear: both;
        width: 92px;
        height: 62px;
        background-color: #141414;
        border: 2px solid #4a4a4a;
        border-radius: 4px 4px 26px 26px;
        box-sizing: border-box;
        padding: 6px;
        text-align: center;
    }
    .cps-text {
        font-size: 11px;
        font-weight: bold;
        color: #87CEEB;
        margin-top: 14px;
    }
    .side-keys {
        margin-top: 6px;
    }
    .m-side {
        float: left;
        width: 43px;
        height: 24px;
        line-height: 20px;
        text-align: center;
        background-color: #141414;
        border: 2px solid #4a4a4a;
        border-radius: 5px;
        font-size: 10px;
        font-weight: bold;
        box-sizing: border-box;
        margin-right: 4px;
    }
</style>
<script>
    function startDrag() {
        document.title = "cmd:drag";
    }
    function setKey(id, isDown) {
        var el = document.getElementById(id);
        if (!el) return;
        if (isDown) {
            if (el.className.indexOf('active') === -1) el.className += ' active';
        } else {
            el.className = el.className.replace(' active', '');
        }
    }
    function setCPS(val) {
        document.getElementById('cpsBox').innerHTML = 'CPS: ' + val;
    }
</script>
</head>
<body onmousedown="startDrag()">
    <div class="hint">Тяни за кнопки мышкой</div>
    <div class="container">
        <div class="kb-block">
            <div class="row">
                <div id="k_1" class="key">1</div>
                <div id="k_2" class="key">2</div>
                <div id="k_3" class="key">3</div>
                <div id="k_4" class="key">4</div>
                <div id="k_5" class="key">5</div>
            </div>
            <div class="row">
                <div id="k_Tab" class="key key-wide">TAB</div>
                <div id="k_Q" class="key">Q</div>
                <div id="k_W" class="key">W</div>
                <div id="k_E" class="key">E</div>
                <div id="k_R" class="key">R</div>
            </div>
            <div class="row">
                <div id="k_LShift" class="key key-shift">SHIFT</div>
                <div id="k_A" class="key">A</div>
                <div id="k_S" class="key">S</div>
                <div id="k_D" class="key">D</div>
                <div id="k_F" class="key">F</div>
            </div>
            <div class="row">
                <div id="k_LCtrl" class="key key-wide">CTRL</div>
                <div id="k_Space" class="key key-space">SPACE</div>
            </div>
        </div>

        <div class="mouse-block">
            <div class="mouse-top">
                <div id="k_LButton" class="m-btn m-lmb">ЛКМ</div>
                <div id="k_MButton" class="m-mmb"></div>
                <div id="k_RButton" class="m-btn m-rmb">ПКМ</div>
            </div>
            <div class="mouse-body">
                <div id="cpsBox" class="cps-text">CPS: 0</div>
            </div>
            <div class="side-keys">
                <div id="k_XButton1" class="m-side">X1</div>
                <div id="k_XButton2" class="m-side" style="margin-right:0;">X2</div>
            </div>
        </div>
    </div>
</body>
</html>
)

SysGet, Mon, MonitorWorkArea
WinW := 395
WinH := 200
StartX := MonLeft + 15
StartY := MonBottom - WinH - 15

Gui, -DPIScale -Caption +AlwaysOnTop +ToolWindow
Gui, Color, 010101
Gui, Margin, 0, 0

Gui, Add, ActiveX, w%WinW% h%WinH% vWB, Shell.Explorer
WB.Navigate("about:blank")
while WB.ReadyState != 4
    Sleep, 10
WB.Document.write(htmlCode)
WB.Refresh()

Gui, Show, x%StartX% y%StartY% w%WinW% h%WinH%, FinesKeys
WinSet, TransColor, 010101 235, FinesKeys

Keys := ["1","2","3","4","5","Tab","Q","W","E","R","LShift","A","S","D","F","LCtrl","Space","LButton","RButton","MButton","XButton1","XButton2"]
PrevState := {}
ClickTimes := []

SetTimer, UpdateKeys, 15
SetTimer, WatchDrag, 30
return

WatchDrag:
    try {
        if (WB.Document.title = "cmd:drag") {
            WB.Document.title := ""
            PostMessage, 0xA1, 2,,, FinesKeys
        }
    }
return

UpdateKeys:
    for idx, k in Keys
    {
        isDown := GetKeyState(k, "P") ? 1 : 0
        if (PrevState[k] != isDown)
        {
            PrevState[k] := isDown
            try WB.Document.parentWindow.setKey("k_" . k, isDown)
            if (k = "LButton" && isDown = 1)
                ClickTimes.Push(A_TickCount)
        }
    }

    now := A_TickCount
    while (ClickTimes.Length() > 0 && now - ClickTimes.1 > 1000)
        ClickTimes.RemoveAt(1)

    if (LastCPS != ClickTimes.Length())
    {
        LastCPS := ClickTimes.Length()
        try WB.Document.parentWindow.setCPS(LastCPS)
    }
return

GuiClose:
    ExitApp
