 PyQt5 簡介
===
PyQt5 架構
---
大部分所見的圖形化介面程式語言都是由有物件導向的程式語言開發的，例如 C++、Java、C#、Python 等。

直接使用 C++ 語言「寫出」圖形介面是一件滿費心的差事，因此有滿多圖形介面的函式庫 (library) 可以使用，例如 Qt、Tk、wxWidgets、GTK+ 等。使用簡單的函式 (function) 就可創造視窗介面，並且有很多函式庫盡力克服「跨平台」的障礙。由於可以包含的部件極多，稱得上圖形介面「框架 (framework)」一詞。

其中 Qt 是由 Qt Project 開發。Qt 支援平台種類眾多，除了常見的 Windows、Linux、Mac 以外，還有非 X Window System 的作業系統。授權方面也十分自由，採用 GNU 較寬鬆通用公共許可證 (GNU Lesser General Public License, LGPL)、GNU 通用公共許可證 (GNU General Public License, GPL)、商業授權三種模式，可以讓開發者應需求選擇。

Qt 程式庫中甚至支援開發圖形介面的「周邊」功能，如網路通訊、OpenGL、OpenVG、SQL 與 XML 直譯器、圖片格式轉檔、Linux 的輸入法開發、瀏覽器引擎（使用 Google Chromium）、各式圖表等。
由於 Qt 的功能極為強大，英國的 Riverbank Computing 公司率先為其撰寫 Python 語言的套件，甚至開發了 SIP 這套工具將 C 與 C++ 程式庫包裝為 Python 套件。

PyQt 幾乎支援 Qt 大部分的功能，並且將較專門的功能另外分成 PyQt Chart（2D 圖表）、PyQt Data Visualization（3D 圖表）、PyQt Purchasing（應用程式購買功能）。

另外 QScintilla 是一個將 Scintilla 連結至 PyQt 的套件（在 C++ 可以直接用 Qt 和 Scintilla 即可），用途是辨識文字中的程式語言，以亮顯 (highlight) 的方式呈現，可以用作程式語言的辨識功能。

PyQt 的版本與 Qt 相同（除了小版號），採用 GPL 和商業授權。需要注意的是，若作為軟體釋出，沒有商業授權是需要公開原始碼的。
