<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1" a="E"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="leo.20171218141522.1"><vh>報告章節規劃</vh></v>
<v t="yen.20170429103742.1" a="E"><vh>@path ./../</vh>
<v t="yen.20170429103940.1" a="E"><vh>@path markdown</vh>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1" a="E"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1"><vh>@clean cover_and_abstract.md</vh></v>
</v>
<v t="leo.20171119234822.1" a="E"><vh>各章節內容</vh>
<v t="yen.20170429214845.1" a="E"><vh>@path paragraph</vh>
<v t="yen.20170429214838.1" a="E"><vh>@clean introduction.md</vh>
<v t="yen.20170429214838.3"><vh>前言內容</vh></v>
</v>
<v t="yen.20170429215041.1" a="E"><vh>@clean portable_system.md</vh>
<v t="yen.20170429215130.1"><vh>可攜程式系統介紹</vh></v>
</v>
<v t="yen.20170429215416.1" a="E"><vh>@clean pyqt5_introduction.md</vh>
<v t="yen.20170429215446.2"><vh>PyQt5 介紹</vh></v>
</v>
<v t="yen.20170429215617.1" a="E"><vh>@clean calculator.md</vh>
<v t="yen.20170429215851.1"><vh>計算機程式內容</vh></v>
</v>
<v t="yen.20170429215922.1" a="E"><vh>@clean discussion.md</vh>
<v t="yen.20170429220001.1"><vh>程式開發心得</vh></v>
</v>
<v t="yen.20170429220128.1" a="E"><vh>@clean results.md</vh>
<v t="yen.20170429220137.1"><vh>期末報告結論</vh></v>
</v>
<v t="yen.20170429220335.1" a="E"><vh>@clean appendix.md</vh>
<v t="yen.20170429220335.2"><vh>附錄</vh></v>
</v>
</v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report"
import os, platform
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
g.es("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
"introduction.md",
"portable_system.md", 
"python_introduction.md", 
"pyqt5_introduction.md", 
"discussion.md", 
"results.md", 
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
g.es(os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag)))
g.es("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
g.es('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: '國立虎尾科技大學'
institute_zh: '機械設計工程系'
category_zh: '計算機程式 bg7 期末報告'
title_zh: 'PyQt5 事件導向計算器'
title_en: 'PyQt5 Event-Driven Calculator Project'
author:
- 設計一乙 40623237
- 設計一乙 40623238 
- 設計一乙 40623239
- 設計一乙 40623246
- 設計一乙 40623247
- 設計一乙 40623248
advisor_zh: '嚴家銘'
date: '2018.1.08'
---

@others
</t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20171218141522.1">標題頁 - 含報告標題、作者、日期與所屬單位
目錄 - 列出全文章節與所屬頁面連結
摘要 - 解釋報告編寫動機、報告重點、結論、建議與關鍵字

前言 - 簡要描述全文意旨與背景, 說明報告目標與報告內容組成架構

內文 - 依照章節標題, 詳細說明報告內容, 包括方法、操作步驟與所得結果的詳細說明

結論 - 條列所獲致的重要成果, 與摘要及導言中的目標互相呼應

討論與建議 - 說明後續值得進行的方向、方法與可能遭遇問題的討論

參考 - 詳列所引用的參考內容

附錄 - 附加值得參考的詳細內容</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

各自選擇要編輯的 .md 檔案, 可以使用 @edit 或 @clean 節點編輯指令

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214838.1">前言
===

第七組計算器程式期末報告前言

@others</t>
<t tx="yen.20170429214838.3">
前言內容:
--
何謂機械設計?

所謂機械設計, 就是透過詳細思慮考量, 完成包括固體、流體與軟體等互動元件間之精巧配置, 使其展現特定功能之具體規劃表達.

工程師有那六種表達方式? 口語, 文字, 2D, 3D, 數學理論與實作表達.

創造力的三個基本要素: 自學力, 執行力與想像力.

自學力在提升自我解題能力, 執行力則在運用所學解決問題, 當累積一定經驗後, 就能透過想像、自學與執行過程之整合運用, 創造出具效能的創新產品.

接下來將要練習如何開啟 Leo Editor, 開啟 Leo Editor 專案, 如何使用 Fossil SCM 與 Eric6 IDE, 請大家要仔細筆記, 並且透過實際操作, 了解各種系統的特性與用法.
</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">可攜程式系統介紹
===

可攜程式系統介紹

@others</t>
<t tx="yen.20170429215130.1">啟動與關閉
---

Windows 的內容

有一張圖片：

![Kmol][]

稱為圖 {@fig:駱駝}。

各 md 檔案可以在 images 目錄下自訂與 md 檔案名稱相同的子目錄存放影像檔案

啟動與關閉2
---</t>
<t tx="yen.20170429215416.1"> PyQt5 簡介
===

@others</t>
<t tx="yen.20170429215446.2">PyQt5 架構
---
大部分所見的圖形化介面程式語言都是由有物件導向的程式語言開發的，例如 C++、Java、C#、Python 等。

直接使用 C++ 語言「寫出」圖形介面是一件滿費心的差事，因此有滿多圖形介面的函式庫 (library) 可以使用，例如 Qt、Tk、wxWidgets、GTK+ 等。使用簡單的函式 (function) 就可創造視窗介面，並且有很多函式庫盡力克服「跨平台」的障礙。由於可以包含的部件極多，稱得上圖形介面「框架 (framework)」一詞。

其中 Qt 是由 Qt Project 開發。Qt 支援平台種類眾多，除了常見的 Windows、Linux、Mac 以外，還有非 X Window System 的作業系統。授權方面也十分自由，採用 GNU 較寬鬆通用公共許可證 (GNU Lesser General Public License, LGPL)、GNU 通用公共許可證 (GNU General Public License, GPL)、商業授權三種模式，可以讓開發者應需求選擇。

Qt 程式庫中甚至支援開發圖形介面的「周邊」功能，如網路通訊、OpenGL、OpenVG、SQL 與 XML 直譯器、圖片格式轉檔、Linux 的輸入法開發、瀏覽器引擎（使用 Google Chromium）、各式圖表等。
由於 Qt 的功能極為強大，英國的 Riverbank Computing 公司率先為其撰寫 Python 語言的套件，甚至開發了 SIP 這套工具將 C 與 C++ 程式庫包裝為 Python 套件。

PyQt 幾乎支援 Qt 大部分的功能，並且將較專門的功能另外分成 PyQt Chart（2D 圖表）、PyQt Data Visualization（3D 圖表）、PyQt Purchasing（應用程式購買功能）。

另外 QScintilla 是一個將 Scintilla 連結至 PyQt 的套件（在 C++ 可以直接用 Qt 和 Scintilla 即可），用途是辨識文字中的程式語言，以亮顯 (highlight) 的方式呈現，可以用作程式語言的辨識功能。

PyQt 的版本與 Qt 相同（除了小版號），採用 GPL 和商業授權。需要注意的是，若作為軟體釋出，沒有商業授權是需要公開原始碼的。</t>
<t tx="yen.20170429215617.1">Calculator 程式
===

Calculator 程式說明

@others</t>
<t tx="yen.20170429215851.1">按鍵分類
---
0 ~9 數字按建, 點按後由 digitClicked() 方法槽承接處理
直接運算元, 包括 Sqrt, x^2 與 1/x, 點按後由 unaryOperatorClicked() 方法槽承接處理
加或減運算元, 包括 + 與 - 運算, 點按後由 additiveOperatorClicked() 方法槽承接處理
乘或除運算元, 包括 * 與 / 運算, 點按後由 multiplicativeOperatorClicked() 方法槽承接處理
其餘按鍵則各自以特定的方法槽承接處理
變數與運算流程考量

數字按鍵以 zero, one, two, three, four, five, six, seven, eight, nine 命名
顯示幕以 display 命名
等號以 equalButton 命名
與 MS, M+, 或 MC 按鍵相關的計算機記憶體數值, 存入 sumInMemory 變數對應的記憶空間
以 sumSoFar 儲存累計數值, 使用者按下等號後, sumSoFar 重新計算結果, 並顯示在 display 幕, Clear All 按鍵則重置 sumSoFar 為 0
以 factorSoFar 儲存乘或除運算子運算過程所得的暫存數值
以 pendingAdditiveOperator 儲存使用者最後點按的加或減運算子字串
以 pendingMultiplicativeOperator 儲存使用者最後點按的乘或除運算子字串
以 waitingForOperand 界定使用者是否處理運算數輸入階段, 若 waitingForOperand 為 True, 表示計算機正在等待使用者"開始"輸入運算數
waitingForOperand 起始值為 True, 只有重新進入 digitClicked 方法, display 才會 clear(), 否則在顯示幕非為 0 的情況下, 將堆疊數字字串
因為考量先乘除後加減運算順序, 將加減與乘除處理方法分開, 若使用者輸入加減運算子後, 緊接乘除運算子, 計算機會先乘除運算後再加減
直接運算元可以在使用者按下按鍵後, 直接對 display 中的數值進行處理, 無需其他暫存需求
pendingAdditiveOperator, pendingMultiplicativeOperator, sumSoFar, factorSoFar 與 waitingForOperand, 在 Dialog 類別建構子中設定起始值
數字按鍵點按處理

使用者點按數字按鍵, 將會送出該按鍵的 clicked() 訊號
按鍵的 clicked() 訊號將會根據設定, 觸發 digitClicked() 方法槽
由於 PyQt5 的 Push Button 以 Qt5 中的 QObject::sender() 送出訊號, 此函式會傳回 sender 作為 QObject 的指標
因為此一與 Push Button 配合的 sender 為 Button 物件, 因此可以在 digitClicked() 函式中, 利用 sender().text() 取得按鍵的 text 字串
假如使用者點按 0, display 顯示字串 0, 但是若一開始輸入兩個以上的 0, digitClicked() 應該仍只顯示 0 字串
但是若計算機處於等待新運算數輸入時 (以 waitingForOperand 判定), 新數字在顯示前, display 應該要清除先前所顯示的數字
最後, 除了在顯示幕為 0 之後的 0 按鍵輸入, digitClicked() 方法槽不會繼續判定是否清除顯示幕或堆疊數字字串外, 所按的數字將會堆疊顯示
直接運算按鍵處理

Sqrt, x^2 與 1/x 等按鍵的處理方法為 unaryOperatorClicked(), 與數字按鍵的點按回應相同, 透過 sender().text() 取得按鍵上的 text 字串
unaryOperatorClicked() 方法隨後根據 text 判定運算子後, 利用 display 上的運算數進行運算後, 再將結果顯示在 display 顯示幕
若進行運算 Sqrt 求數值的平方根時, 顯示幕中為負值, 或 1/x 運算時, x 為 0, 都視為無法處理的情況, 以呼叫 abortOperation() 處理
abortOperation() 方法則重置所有起始變數, 並在 display 中顯示 "####"
直接運算子處理結束前, 運算結果會顯示在 display 中, 而且運算至此告一段落, 計算機狀態應該要回復到等待新運算數的階段, 因此 waitingForOperand 要重置為 True
加或減按鍵處理

使用者按下加或減運算子按鍵時, 程式設定以 additiveOperatorClicked() 處理
進入 additiveOperatorClicked() 後, 必須先查是否有尚未運算的乘或除運算子, 因為必須先乘除後才能加減
先處理乘與除運算後, 再處理加或減運算後, 將 sumSoFar 顯示在 display 後, 必須重置 sumSoFar 為 0, 表示運算告一段落
乘或除按鍵處理

使用者按下乘或除運算子按鍵時, 程式設定以 multiplicativeOperatorClicked() 處理
進入 multiplicativeOperatorClicked() 後, 無需檢查是否有尚未運算的加或減運算子, 因為乘除運算有優先權
先處理乘與除運算後, 再處理加或減運算, 將 sumSoFar 顯示在 display 後, 必須重置 sumSoFar 為 0, 表示運算告一段落
小數點按鍵處理

使用者按下小數點按鍵後, 以 pointClicked() 方法處理, 直接在 display 字串中加上 "." 字串
數值變號按鍵處理

使用者按下變號按鍵後, 由 changeSignClicked() 處理, 若顯示幕上為正值, 則在 display 字串最前面, 疊上 "-" 字串
假如顯示幕上為負值, 則設法移除 display 上字串最前方的 "-" 字元
退格按鍵處理

使用者按下退格按鍵後, 由 backspaceClicked() 處理, 這時可以利用 Python 字串數列中的 [:-1], 保留除了最後一個字元的字串
離開 backspaceClicked() 前 ,將顯示幕中原有字串的 [:-1] 字串, 顯示在 display 上
若退格後 display 上為空字串, 則顯示 0, 並且將 waitingForOperand 起始設為 True, 表示等待新運算數中
清除按鍵處理

使用者按下 Clear 按鍵後, 以 clear() 方法處理, 進入函式後, 將現有的運算數重置為 0
離開 clear() 前, 將 waitingForOperand 起始設為 True, 表示等待新運算數中
ClearAll 按鍵, 則將所有變數全部重置為起始狀態
記憶體按鍵處理

clearMemory() 方法與 "MC" 按鍵對應, 清除記憶體中所存 sumInMemory 設為 0
readMemory() 方法與 "MR" 按鍵對應, 功能為讀取記憶體中的數值, 因此將 sumInMemory 顯示在 display, 作為運算數
setMemory() 方法則與 "MS" 按鍵對應, 功能為設定記憶體中的數值，因此取 display 中的數字, 存入 sumInMemory
addToMemory() 方法與 "M+" 按鍵對應, 功能為加上記憶體中的數值, 因此將 sumInMemory 加上 display 中的數值
因為 setMemory() 與 addToMemory() 方法, 都需要取用 display 上的數值, 因此必須先呼叫 equalClicked(), 以更新 sumSoFar 與 display 上的數值
calculate() 方法

calculate() 方法中的運算, 以 rightOperand 為右運算數
當執行加或減運算時, 左運算數為 sumSoFar
當執行乘或除運算時, 左運算數為 factorSoFar
若運算過程出現除與 0 時, 將會回傳 False

</t>
<t tx="yen.20170429215922.1">心得
===

期末報告心得

@others
</t>
<t tx="yen.20170429220001.1">Fossil SCM
---
剛開始接觸都不太熟，甚至連fossil也不知道是甚麼。但經過幾個禮拜老師的教學後，不但都能了解，也能實際應用。
Fossil SCM相關指令:
fossil init 倉儲名稱.fossil
fossil ui
fossil open
fossil clone
fossil add .
fossil commit -m --no-warnings
fossil update

網誌心得
---
第一次上傳到自己的網誌總是困難重重，近端遠端常常上傳不了。後來與同學老師互相討論才擁有現在管理得不錯的網誌。

Github 協同倉儲
---
與組員的協同總是特別好，很有分工合作的感覺，當完成屬於大家的計算機後成就感十足。

學員心得
---
剛開始協同時常常出問題,後來藉由組長的教學還有老師的影片,才慢慢了解其中操作的過程。
                                                                                                                                            by40623246
</t>
<t tx="yen.20170429220128.1">結論
===

期末報告結論

@others</t>
<t tx="yen.20170429220137.1">結論與建議:
---
結論:
組員們一起努力協同此份報告，很有成就感。大家一起煩惱著拼命著就是為了完成自己被分配的任務。

建議:
希望能不要將每個禮拜的主題換來換去，專心處理某個部份的問題，都處理完了解完後，在來進行下一個部分。一方面大家會對課程比較了解，一方面也學得不會痛苦。
</t>
<t tx="yen.20170429220335.1">附錄
===

附錄內容

@others</t>
<t tx="yen.20170429220335.2">專案執行會議紀錄
---

操作過程照片
---

操作過程照片</t>
</tnodes>
</leo_file>
