%%
%% This is file `YZUthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% YZUthesis.dtx  (with options: `cls')
%% -----------------------------------------------------------------
%% 扬州大学学位论文LaTeX模板
%% 版本 2.0
%% 作者: Haifeng XU
%% 2026年1月
%% -----------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 扬州大学学位论文LaTeX模板
%%   数学科学学院
%% Yangzhou University thesis style
%% Dept. of Math.
%%
%% 版本：v2.0
%% 修改：基于CASthesis和Dalhousie University thesis style
%% 最后更新：2026年1月
%%
%% 许可证：
%% MIT License
%%
%% Author: H. Xu
%% Date: March 2007
%%       January 2026
%%



\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{YZUthesis}
  [2024/01/01 v2.0 Yangzhou University Thesis Template]

\newif\ifYZUT@typeinfo \YZUT@typeinfofalse
\newif\ifYZU@bachelor \YZU@bachelorfalse
\newif\ifYZU@master \YZU@masterfalse
\newif\ifYZU@doctor \YZU@doctorfalse
\newif\ifYZU@print \YZU@printfalse
\newif\ifYZU@electronic \YZU@electronicfalse

\newcommand{\YZU@degree}{}
\newcommand{\YZU@inlinedegree}{}

\newif\ifname@single    \name@singlefalse
\def\singlename{\name@singletrue}
\newif\ifenglish@thesis \english@thesisfalse
\def\englishthesis{\english@thesistrue}

\newif\ifthird@reader   \third@readerfalse
\newif\iffourth@reader  \fourth@readerfalse
\newif\iffifth@reader   \fifth@readerfalse
\newif\iftwo@supervisors \two@supervisorsfalse

\DeclareOption{bachelor}{\YZU@bachelortrue\YZU@masterfalse\YZU@doctorfalse}
\DeclareOption{master}{\YZU@bachelorfalse\YZU@mastertrue\YZU@doctorfalse}
\DeclareOption{doctor}{\YZU@bachelorfalse\YZU@masterfalse\YZU@doctortrue}
\DeclareOption{print}{\YZU@printtrue\YZU@electronicfalse}
\DeclareOption{electronic}{\YZU@printfalse\YZU@electronictrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}%

\ExecuteOptions{master,electronic} % 默认硕士论文, 电子版
\ProcessOptions\relax
\LoadClass[a4paper,oneside,openany,zihao=-4]{ctexbook}[2022/07/01]

\RequirePackage{iftex}
\newcommand{\setupmodernfonts}{%
  \RequirePackage{fontspec}
  \RequirePackage{textcomp} % to help with TS1 encoding

  % 设置英文字体（包括罗马字符、阿拉伯数字）
  \setmainfont{Times New Roman}     % 正文英文
  \setsansfont{Arial}               % 无衬线字体
  \setmonofont{Courier New}         % 等宽字体

  % 设置中文字体
  \setCJKmainfont{SimSun}[          % 正文中文
    BoldFont = {SimHei},            % 粗体
    ItalicFont = {KaiTi}            % 斜体
  ]
  \setCJKsansfont{SimHei}           % 中文无衬线
  \setCJKmonofont{FangSong}         % 中文等宽
}

\ifXeTeX
  % XeLaTeX引擎
  \setupmodernfonts
\else
  \ifLuaTeX
    % LuaLaTeX引擎
    \setupmodernfonts
  \else
    % pdfLaTeX引擎
    \RequirePackage{newtxtext}        % Times New Roman字体
    %\RequirePackage{newtxmath}        % Times New Roman数学字体
    % 注意 newtxmath 包和amsthm包在定义\openbox时会发生冲突, 故这里不使用
    % 注意：在pdfLaTeX下, ctexbook会自动处理中文字体
    % 默认就是宋体, 无需额外设置
  \fi
\fi
\RequirePackage{amsmath,amssymb,bm}
\RequirePackage{mathtools}
\RequirePackage{amsthm}   % 推荐
\RequirePackage{thmtools} % 功能更强大

\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{float} % 图表浮动
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{makecell}
\RequirePackage{tabularx} %
\RequirePackage{booktabs}

\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage[noend]{algpseudocode}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec} % 设置标题格式
\RequirePackage{titletoc}
\RequirePackage{enumitem}
\RequirePackage{setspace} % setspace 包用于控制间距
\RequirePackage{parskip}  % 段落间距
\RequirePackage{footmisc} % 脚注

\RequirePackage{makeidx}% added by xhf
\makeindex
%%使用宏包tocbibind可以将参考文献或索引等放置到目录中去, 需要stdclsdv宏包
\RequirePackage{stdclsdv,tocbibind}

\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{datetime2}
\RequirePackage{microtype} % microtype包主要用于微调字体间距, 改善排版效果. 放在 footmisc后面.
\RequirePackage{ragged2e}
\RequirePackage{url}
\RequirePackage{appendix}
\RequirePackage{indentfirst}
\RequirePackage[normalem]{ulem} % for \uline, normalem 选项防止改变 \emph 的行为

\RequirePackage[sort&compress]{natbib}
\RequirePackage{gbt7714}

\RequirePackage{listings}
\RequirePackage{courier}

\RequirePackage{caption} % 图标标题设置

\RequirePackage[titles]{tocloft} % 设置目录

\RequirePackage{xcolor}
\RequirePackage{bookmark} % 书签
\RequirePackage{hyperref} % 放在所有宏包最后, 可以避免一些问题(主要是Warning)
\newcommand{\songfive}{\zihao{5}\songti}

\geometry{
  a4paper,           % A4纸张 (21.0 cm × 29.7 cm)
  %textwidth=158mm,   % 版芯宽度：210mm - 26mm(左) - 26mm(右) + 装订线0mm = 158mm
  %textheight=242mm,  % 版芯高度：297mm - 30mm(上) - 25mm(下) = 242mm
  left=26mm,         % 左边距26mm
  right=26mm,        % 右边距26mm
  top=30mm,          % 上边距30mm（含页眉区域）
  bottom=25mm,       % 下边距25mm（含页脚区域）
  headheight=10mm,   % 页眉区域高度
  headsep=0mm,       % 页眉与正文间距（页眉基线距纸张顶部20mm：30mm-20mm-页眉高度10mm=0mm）
  %footskip=7.5mm,    % 页脚基线到版芯底部的距离（页脚距边界17.5mm：25mm-17.5mm=7.5mm）
  bindingoffset=0mm, % 装订线0mm
  %includeheadfoot,   % 包含页眉页脚在版芯内
  heightrounded,
}



\setstretch{1.0} % 重置为单倍行距, 使用了 setspace 宏包
\setlength{\baselineskip}{22pt} % 固定值22磅行距
\setlength{\parskip}{0pt}       % 段前段后不空行
\setlength{\parindent}{2em}     % 首行缩进2字符（根据中文排版要求）


\renewcommand{\footnotesize}{\songfive}
\setlength{\footnotesep}{0pt}   % 脚注间无额外间距
\renewcommand{\footnotelayout}{\setlength{\baselineskip}{\normalbaselineskip}}

\renewcommand{\thefootnote}{\arabic{footnote}}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrule}{%
  \vspace{2mm}%
  \hrule width \textwidth height 0.75pt%
  \vspace{1.5mm}%
}
\renewcommand{\headrulewidth}{0pt} % 禁用默认页眉线

\makeatletter
\if@twoside
  % 偶数页页眉："扬州大学【博士/硕士/学士】学位论文"
  \fancyhead[CE]{\songfive\centering 扬州大学{\YZUT@value@inlinedegree}学位论文}
  % 奇数页页眉：章节标题
  \fancyhead[CO]{\songfive\centering\leftmark}
  % 页脚：页码（根据是否正文部分自动切换罗马/阿拉伯数字）
  \fancyfoot[CE,CO]{\songfive\centering\thepage}
\else
  % 单面打印（按双面处理以确保奇偶页不同）
  \fancyhead[C]{\songfive\centering 扬州大学{\YZUT@value@inlinedegree}学位论文}
  \fancyfoot[C]{\songfive\centering\thepage}
\fi
\makeatother


\makeatletter
\newif\if@frontmatter

\renewcommand{\frontmatter}{
  \@frontmattertrue
  \pagenumbering{Roman}
  \pagestyle{fancy}
}
\renewcommand{\mainmatter}{
  \@frontmatterfalse
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \pagestyle{fancy}
}
\makeatother







\makeatletter
\renewcommand{\cleardoublepage}{%
  \clearpage
  \if@twoside
    \ifodd\c@page
    \else
      \thispagestyle{empty}%
      \hbox{}%
      \newpage
      \if@twocolumn
        \hbox{}%
        \newpage
      \fi
    \fi
  \fi
}
\makeatother

\makeatletter
\newcommand\YZUTspace{%
  \ifdefined\CTEX@spaceChar
    \protect\CTEX@spaceChar\protect\CTEX@spaceChar
  \else
    \hspace{2em}% 后备方案
  \fi
}
\makeatother


\makeatletter
\def\YZUT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\YZUTfiledate{#1}%
  \def\YZUTfileversion{#2}%
  \def\YZUTfileinfo{#3}}%
\expandafter\ifx\csname ver@YZUthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_YZUthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@YZUthesis.cls\endcsname}
\fi \expandafter\YZUT@getfileinfo\reserved@a\relax? ? \relax\relax
\makeatother

\titleformat{\chapter}[block] % 使用 block模式, 可以居中
  {\centering\songti\bfseries\zihao{3}}
  {第\chinese{chapter}章}
  {1em}
  {}

\titlespacing*{\chapter}
  {0pt}
  {2\baselineskip}  % 段前2行
  {2\baselineskip}  % 段后2行

\titleformat{\section}
  {\raggedright\songti\bfseries\zihao{-3}}
  {\thesection}
  {1em}
  {}
\titlespacing*{\section}
  {0pt}
  {1.5\baselineskip}  % 段前1.5行
  {1.5\baselineskip}  % 段后1.5行

\titleformat{\subsection}
  {\raggedright\songti\bfseries\zihao{4}}
  {\thesubsection}
  {1em}
  {}
\titlespacing*{\subsection}
  {0pt}
  {\baselineskip}  % 段前1行
  {\baselineskip}  % 段后1行

\titleformat{\subsubsection}
  {\raggedright\songti\bfseries\zihao{-4}}
  {\thesubsubsection}
  {1em}
  {}
\titlespacing*{\subsubsection}
  {0pt}
  {0pt}  % 段前0行
  {0pt}  % 段后0行

\renewcommand{\thechapter}{\chinese{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}


\DeclareCaptionFont{heiti}{\heiti}
\captionsetup{font=small,labelsep=quad}
\captionsetup[table]{skip=5pt}
\captionsetup[figure]{skip=5pt}

\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

\renewcommand{\cfttoctitlefont}{\centering\songti\bfseries\zihao{3}}% 目\quad录  三号宋体加黑
\setlength{\cftbeforetoctitleskip}{\baselineskip} % “目\quad录”段前间距1行
\setlength{\cftaftertoctitleskip}{\baselineskip} % “目\quad录”段后间距1行

\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

\renewcommand{\cftchapfont}{\songti\zihao{-4}} % 章节字体
\renewcommand{\cftsecfont}{\songti\zihao{-4}}       % 节字体
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}    % 小节字体
\renewcommand{\cftsubsubsecfont}{\songti\zihao{-4}} % 子小节字体

\renewcommand{\cftchappagefont}{\songti\zihao{-4}}  % 章节页码字体
\renewcommand{\cftsecpagefont}{\songti\zihao{-4}}   % 节页码字体
\renewcommand{\cftsubsecpagefont}{\songti\zihao{-4}} % 小节页码字体
\renewcommand{\cftsubsubsecpagefont}{\songti\zihao{-4}} % 子小节页码字体

\setlength{\cftbeforechapskip}{0pt}      % 章节间行距
\setlength{\cftbeforesecskip}{0pt}       % 节间行距
\setlength{\cftbeforesubsecskip}{0pt}    % 小节间行距
\setlength{\cftbeforesubsubsecskip}{0pt} % 子小节间行距

\newenvironment{tocentryspacing}{%
  \setlength{\baselineskip}{20pt}%
  \setlength{\parskip}{0pt}%
  \setlength{\parindent}{0pt}%
}{}

\setlength{\cftchapindent}{0em}      % 章节缩进
\setlength{\cftsecindent}{2em}       % 节缩进
\setlength{\cftsubsecindent}{4em}    % 小节缩进
\setlength{\cftsubsubsecindent}{6em} % 子小节缩进

\setlength{\cftchapnumwidth}{3em}    % 章节编号宽度
\setlength{\cftsecnumwidth}{3em}     % 节编号宽度
\setlength{\cftsubsecnumwidth}{3.5em} % 小节编号宽度
\setlength{\cftsubsubsecnumwidth}{4.5em} % 子小节编号宽度



\makeatletter
\newcommand{\classification}[1]{\renewcommand{\YZUT@value@classification}{#1}}
\newcommand{\serialnumber}[1]{\renewcommand{\YZUT@value@serialnumber}{#1}}
\newcommand{\confidential}[1]{\renewcommand{\YZUT@value@confidential}{#1}}
\newcommand{\UDC}[1]{\renewcommand{\YZUT@value@UDC}{#1}}

\renewcommand\title[2][\YZUT@value@title]{%
  \def\YZUT@value@title{#2}
  \def\YZUT@value@titlemark{\MakeUppercase{#1}}}

\newcommand\inlinetitle[1]{\def\YZUT@value@inlinetitle{#1}}

\renewcommand{\author}[1]{\renewcommand{\YZUT@value@author}{#1}}
\newcommand{\inlineauthor}[1]{\renewcommand{\YZUT@value@inlineauthor}{#1}}
\newcommand{\supervisor}[1]{\renewcommand{\YZUT@value@supervisor}{#1}}
\newcommand{\cosupervisor}[1]{\renewcommand{\YZUT@value@cosupervisor}{#1}}

\newcommand{\major}[1]{\renewcommand{\YZUT@value@major}{#1}}
\newcommand{\submitdate}[1]{\renewcommand{\YZUT@value@submitdate}{#1}}
\newcommand{\defenddate}[1]{\renewcommand{\YZUT@value@defenddate}{#1}}

\newcommand{\institute}[1]{\renewcommand{\YZUT@value@institute}{#1}}

\newcommand{\university}[1]{\renewcommand{\YZUT@value@university}{#1}}
\newcommand{\keywords}[1]{\renewcommand{\YZUT@value@keywords}{#1}}

\newcommand{\funding}[1]{\renewcommand{\YZUT@value@funding}{#1}}
\newcommand{\discipline}[1]{\renewcommand{\YZUT@value@discipline}{#1}}

\newcommand{\supervisordept}[1]{\renewcommand{\YZUT@value@supervisordept}{#1}}

\newcommand{\cosupervisordept}[1]{\renewcommand{\YZUT@value@cosupervisordept}{#1}\two@supervisorstrue}

\newcommand\dept[1]{\def\YZUT@value@dept{#1}}
\newcommand\chairman[1]{\def\YZUT@value@chairman{#1}}
\newcommand\firstreader[1]{\def\YZUT@value@firstreader{#1}}
\newcommand\secondreader[1]{\def\YZUT@value@secondreader{#1}}
\newcommand\thirdreader[1]{\def\YZUT@value@thirdreader{#1}\third@readertrue}
\newcommand\fourthreader[1]{\def\YZUT@value@fourthreader{#1}\fourth@readertrue}
\newcommand\fifthreader[1]{\def\YZUT@value@fifthreader{#1}\fifth@readertrue}
\newcommand\chinesedate[1]{\def\YZUT@value@chinesedate{#1}}
\newcommand\DegreeGrantedDate[1]{\def\YZUT@value@DegreeGrantedDate{#1}}%%扬大有学位授予日期这项

\newcommand{\englishkeywords}[1]{\renewcommand{\YZUT@value@englishkeywords}{#1}}
\newcommand{\englishtitle}[1]{\renewcommand{\YZUT@value@englishtitle}{#1}}
\newcommand{\englishauthor}[1]{\renewcommand{\YZUT@value@englishauthor}{#1}}
\newcommand{\englishsupervisor}[1]{\renewcommand{\YZUT@value@englishsupervisor}{#1}}
\newcommand{\englishcosupervisor}[1]{\renewcommand{\YZUT@value@englishcosupervisor}{#1}}
\newcommand{\englishdept}[1]{\renewcommand{\YZUT@value@englishdept}{#1}}
\newcommand{\englishuniversity}[1]{\renewcommand{\YZUT@value@englishuniversity}{#1}}
\newcommand{\englishdate}[1]{\renewcommand{\YZUT@value@englishdate}{#1}}
\newcommand{\englishdegree}[1]{\renewcommand{\YZUT@value@englishdegree}{#1}}
\newcommand{\englishmajor}[1]{\renewcommand{\YZUT@value@englishmajor}{#1}}


\ifYZU@bachelor
  \gdef\YZUT@value@degree{学\ 士}
  \gdef\YZUT@value@inlinedegree{学士}
\else
  \ifYZU@master
    \gdef\YZUT@value@degree{硕\ 士}
    \gdef\YZUT@value@inlinedegree{硕士}
  \else
    \ifYZU@doctor
      \gdef\YZUT@value@degree{博\ 士}
      \gdef\YZUT@value@inlinedegree{博士}
    \fi
  \fi
\fi

\newcommand{\degree}{\YZUT@value@degree}
\newcommand{\inlinedegree}{\YZUT@value@inlinedegree}

\newcommand{\testdegree}{%
  \typeout{current degree type: \YZUT@value@degree (\YZUT@value@inlinedegree)}%

  % 添加一些调试信息（可选）
\typeout{========================================}
\typeout{YZUthesis options: }
\typeout{  degree type: \YZUT@value@degree, \YZUT@value@inlinedegree}
\ifYZU@print
  \typeout{  output Mode: print}
\else
  \typeout{  output Mode: electronic}
\fi
\typeout{========================================}

}
\testdegree

\newcommand{\@checkdate}{%
  \ifx\YZUT@value@submitdate\empty
    % 使用 ctex 的中文日期
    \renewcommand{\YZUT@value@submitdate}{\CTEX@today}
  \fi
}
\makeatother

\makeatletter
\newcommand{\YZU@underline}[2][]{%
  \if\relax\detokenize{#1}\relax
    \uline{#2}%
  \else
    \uline{\makebox[#1][c]{#2}}%
  \fi
}

\let\YZUTunderline\YZU@underline

\renewcommand\maketitle{%

\typeout{========================================}
\typeout{In maketitle: }
\typeout{  degree type: \YZUT@value@degree, \YZUT@value@inlinedegree}
\ifYZU@print
  \typeout{  output Mode: print}
\else
  \typeout{  output Mode: electronic}
\fi
\typeout{========================================}

  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \songti\zihao{-4}%宋体小四号
      \YZUT@label@classification~
      \YZUTunderline[3.52778cm]{\YZUT@value@classification}
        \hfill
      \YZUT@label@serialnumber~
      \YZUTunderline[3.52778cm]{\YZUT@value@serialnumber}
    \vskip 0.352778cm
      \YZUT@label@UDC~
      \YZUTunderline[3.52778cm]{\YZUT@value@UDC}
        \hfill
      \YZUT@label@confidential~
      \YZUTunderline[3.52778cm]{\YZUT@value@confidential}
    \vskip \stretch{2}
      %\songti\zihao{-1} \YZUT@value@university \\ %扬州大学
      % 插入扬州大学的图片
\begin{figure}[htbp]
  \centering
  % 300px=7.94cm
  \includegraphics[width=7.94cm]{fig/YangzhouUniversity.png}
  %\caption{}\label{}
\end{figure}

      {\kaishu\zihao{-1} \degree\ \YZUT@label@thesis}
    \vskip \stretch{2}
      {\heiti\zihao{3} {~\YZUT@value@title~}}
    \vskip \stretch{1}
      {\kaishu\zihao{4} {~\YZUT@value@author~}}
    \vskip \stretch{2}
    \fangsong\zihao{4}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}

    \begin{tabular}{llcrl}
      \iftwo@supervisors
        \YZUT@label@supervisor &
        \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@supervisor,\quad\YZUT@value@supervisordept}}\\
        \YZUT@label@cosupervisor &
        \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@cosupervisor,\quad\YZUT@value@cosupervisordept}}\\
      \else
        \YZUT@label@supervisor &
        \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@supervisor,\quad\YZUT@value@supervisordept}}\\
      \fi
      %95pt=  3.3513910cm,  5pt=0.1763890cm
      \YZUT@label@degree &
      \YZUTunderline[3.3513910cm]{\YZUT@value@degree} & \hspace{0.1763890cm} &
      \YZUT@label@major &
      \YZUTunderline[3.3513910cm]{\YZUT@value@major}\\
      \YZUT@label@submitdate &
      \YZUTunderline[3.3513910cm]{\YZUT@value@submitdate} & &
      \YZUT@label@defenddate &
      \YZUTunderline[3.3513910cm]{\YZUT@value@defenddate}\\
%%    \\
      \YZUT@label@university &
      \YZUTunderline[3.3513910cm]{\YZUT@value@university} & &
      \YZUT@label@DegreeGrantedDate &
      \YZUTunderline[3.3513910cm]{\YZUT@value@DegreeGrantedDate}\\ %% 扬大有学位授予日期
      \YZUT@label@chairman &
      \YZUTunderline[3.3513910cm]{\YZUT@value@chairman} & & & \\
        \iffifth@reader
            \YZUT@label@readers &
            \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@firstreader\quad\YZUT@value@secondreader\quad
            \YZUT@value@thirdreader}}\\
            & \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@fourthreader\quad\YZUT@value@fifthreader}} \\
        \else
          \iffourth@reader
            \YZUT@label@readers &
            \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@firstreader\quad\YZUT@value@secondreader}}\\
            & \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@thirdreader\quad\YZUT@value@fourthreader}} \\
          \else
            \ifthird@reader
                \YZUT@label@readers &
                \multicolumn{4}{l}{\YZUTunderline[10.58334cm]{\YZUT@value@firstreader\quad\YZUT@value@secondreader\quad
                \YZUT@value@thirdreader}} \\
            \else
                \YZUT@label@readers &
                \YZUTunderline[3.3513910cm]{\YZUT@value@firstreader} & & & \\
                & \YZUTunderline[3.3513910cm]{\YZUT@value@secondreader} & & & \\
            \fi
          \fi
        \fi
    \end{tabular}
          \vskip 0.794cm
      \normalfont\normalsize \YZUT@value@chinesedate  %打印中文日期
  \end{center}
  \clearpage

\if@twoside
  \thispagestyle{empty}
  \ifYZUT@typeinfo
    \vspace*{\stretch{1}}
    \begin{footnotesize}
      \noindent
      Typeset by \LaTeXe{} at \CTEX@todayold \\
      With package $\mathpzc{YZUthesis}$ based on \texttt{CASthesis} and \texttt{Dalhousie University thesis style}.%%\YZUTfileversion{}.
    \end{footnotesize}
  \fi
  \cleardoublepage
\fi
}% end of \maketitle
\makeatother

\makeatletter
\newcommand{\makeenglishtitle}{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    %\vspace*{2cm}

    % 英文校名
    \zihao{1}\bfseries
    YANGZHOU UNIVERSITY

    \vspace{1cm}

    % 学位类型
    \ifYZU@doctor
      \zihao{2}\bfseries
      DOCTORAL DISSERTATION
    \else
      \ifYZU@master
        \zihao{2}\bfseries
        MASTER'S THESIS
      \else
        \zihao{2}\bfseries
        BACHELOR'S THESIS
      \fi
    \fi

    \vspace{2cm}

    % 英文标题
    \begin{minipage}{0.8\textwidth}
      \centering
      \zihao{2}\bfseries
      \YZUT@value@englishtitle
    \end{minipage}

    \vspace{2cm}

    % 作者信息
    \zihao{3}
    \def\arraystretch{1.5}
    \begin{tabular}{@{}p{0.4\textwidth}@{\hspace{2em}}p{0.4\textwidth}@{}}
      Candidate: & \YZUT@value@author \\
      Supervisor: & \YZUT@value@supervisor \\
      \ifx
        \YZUT@label@cosupervisor\empty
      \else
        Co-supervisor: & \YZUT@value@cosupervisor \\
      \fi
      Major: & \YZUT@value@major \\
      Degree: & \YZUT@value@degree \\
      Institute: & \YZUT@value@institute \\
      Submitted Date: & \YZUT@value@submitdate \\
    \end{tabular}

    \vfill

    % 底部信息
    \zihao{4}
    Yangzhou, Jiangsu, P.R.China \\
    \YZUT@value@submitdate

  \end{center}

  \cleardoublepage
}
\makeatother

%%------------------------------------------
%% 学位论文抽检封面
%%------------------------------------------
\makeatletter
\newcommand\checkdegree[1]{\def\YZUT@value@checkdegree{#1}}
\newcommand\checksubject[1]{\def\YZUT@value@checksubject{#1}}
\newcommand\checkcode[1]{\def\YZUT@value@checkcode{#1}}
\newcommand\checkmajor[1]{\def\YZUT@value@checkmajor{#1}}
\newcommand\checkclass[1]{\def\YZUT@value@checkclass{#1}}
\newcommand\checknumber[1]{\def\YZUT@value@checknumber{#1}}
\makeatother
\makeatletter
\newcommand\makechecktitle{%
  \cleardoublepage
  \thispagestyle{empty}

\vspace*{2.5cm}
\begin{figure}[htbp]
  \centering
  \includegraphics[width=7.94cm]{fig/YangzhouUniversity.png}
  %\caption{}\label{}
\end{figure}

\vspace{1.8cm}

%%3. 博士学位论文
\begin{center}
{\kaishu\zihao{-1}{\YZUT@value@checkdegree\ \ \YZUT@label@checkthesis}}
\end{center}
\vspace{2cm}

%%4. 表格
\begin{center}
    \zihao{-3}           %% 四号
    \begin{list}{}{
        \setlength{\leftmargin}{2.0in}%%最初1.2in
        %\setlength{\labelwidth}{0pt}
        \setlength{\labelsep}{\leftmargin}
        }
    %\raggedright  %%也有\raggedleft命令
    %%原来的用法
    %%\item[\hbox to 0pt{\heiti\YZUT@label@checktitle}]   {\kaishu\YZUT@value@checktitle}\\
      \item[]{\heiti\YZUT@label@checktitle}   {\kaishu\YZUT@value@checktitle}\\
      \vspace{0.705556cm}
      \item[]{\heiti\YZUT@label@checksubject} {\kaishu\YZUT@value@checksubject}\\
      \vspace{0.705556cm}
      \item[]{\heiti\YZUT@label@checkcode}    {\kaishu\YZUT@value@checkcode}\\
      \vspace{0.705556cm}
      \item[]{\heiti\YZUT@label@checkmajor}   {\kaishu\YZUT@value@checkmajor}\\
      \vspace{0.705556cm}
      \item[]{\heiti\YZUT@label@checkclass}   {\kaishu\YZUT@value@checkclass}\\
    \end{list}
\end{center}

\vspace{2.116668cm}

%%注意, 不要将这里的 \hspace{0.35cm}\hspace{0.35cm}替换为 \hspace{0.7cm}
%%对于前者, LaTeX 可能将其解释为"弹性长度", 而使用 \hspace{0.7cm} 是固定长度,
%%表格算法可能会压缩它

\begin{center}
    \renewcommand{\arraystretch}{1.4} % 调整行高因子
    \begin{tabular}{|c|c|c|c|c|c|}
      \hline
      % after \\: \hline or \cline{col1-col2} \cline{col3-col4} ...
      {\heiti\YZUT@label@checknumber}&
      \hspace{0.35cm}\hspace{0.35cm}&
      \hspace{0.35cm}\hspace{0.35cm}&
      \hspace{0.35cm}\hspace{0.35cm}&
      \hspace{0.35cm}\hspace{0.35cm}&
      \hspace{0.35cm}\hspace{0.35cm}\\
      \hline
    \end{tabular}
    \renewcommand{\arraystretch}{1} % 恢复默认
\end{center}

  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
\makeatother
%%------------------------------------------

%% 定义设置签字页面的命令.
%% 0.4pt=0.01411112cm, 12pt=0.4233336cm
\def\signature#1#2{\parbox[b]{1in}{\smash{#1}\vskip0.4233336cm}
\hfill \parbox[t]{3in}{\shortstack{\vrule width 3in height 0.01411112cm\\\footnotesize#2}}}
\makeatletter
\newcommand\supervisorsignature{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{quotation}
    \begin{center}
        \huge {\kaishu\YZUT@value@university}\\
        \vspace{0.352778cm}
        \normalsize {\kaishu\YZUT@value@dept}
    \end{center}
    \vskip 0.25in plus 0.4in minus 0.1in
    \hyphenpenalty=10000
    \parindent=36pt
    \begin{sloppypar}
    下述签名者证实其已阅读了作者{\bf\YZUT@value@inlineauthor}的论文
    ``{\bf {\YZUT@value@title}}'', 并认为该论文
    完全符合{\YZUT@value@university}{\YZUT@value@dept}{\bf\YZUT@value@inlinedegree}学位论文的要求, 推荐学位授予单位接收该论文.
    \end{sloppypar}
    \vskip0.2in plus 1fill minus 0.1in
    \begin{flushright}
    日期: \underbar{\ \YZUT@value@submitdate\ }
    \end{flushright}

    \iffourth@reader
        \def\sigskip{\vskip0.15in plus 0.2in minus 0.1in}
        \def\beginskip{\vskip0.3875in plus 0.2in minus 0.1in}
    \else
        \def\sigskip{\vskip0.4in plus 0.1in}
        \def\beginskip{\vskip0.5875in plus 0.1in}
    \fi

        \beginskip
        \signature{答辩委员会主席：}{\YZUT@value@chairman}\\

        \iftwo@supervisors
          \sigskip \signature{指导教师：}{\YZUT@value@supervisor} \\

          \sigskip \signature{副指导教师：}{\YZUT@value@cosupervisor} \\

          \sigskip \signature{论文评阅人：}{\YZUT@value@firstreader} \\

          \sigskip \signature{论文评阅人：}{\YZUT@value@secondreader} \\
        \else
          \sigskip \signature{指导教师：}{\YZUT@value@supervisor}\\

          \sigskip \signature{论文评阅人：}{\YZUT@value@firstreader}\\

          \sigskip \signature{论文评阅人：}{\YZUT@value@secondreader} \\
        \fi
        \ifthird@reader
          \sigskip \signature{论文评阅人：}{\YZUT@value@thirdreader} \\
        \fi
        \iffourth@reader
          \sigskip \signature{论文评阅人：}{\YZUT@value@fourthreader} \\
        \fi
        \iffifth@reader
          \sigskip \signature{论文评阅人：}{\YZUT@value@fifthreader} \\
        \fi
    \end{quotation}
}
\makeatother

\makeatletter
\newcommand\permissionpage{%
  \cleardoublepage
  \thispagestyle{empty}
    {\newpage \parindent=0.75in \hyphenpenalty=10000
    \begin{quotation}
    \begin{center}
        \huge {\kaishu \expandafter{\YZUT@value@university}}
    \end{center}
    \bigskip
    \begin{flushright}
        日期: {\bf\YZUT@value@submitdate}
    \end{flushright}
    \begin{list}{}{
        \setlength{\leftmargin}{1in}
        \setlength{\labelwidth}{0pt}
        \setlength{\labelsep}{\leftmargin}}
    \raggedright
    \item[\hbox to 0pt{作者:}]  \ifname@single
                                    {\bf\YZUT@value@author}
                                \else
                                    {\bf\YZUT@value@inlineauthor}
                                \fi
    \item[\hbox to 0pt{题目:}]  {\bf\YZUT@value@title}
    \item[\hbox to 0pt{院系:}]  {\bf\YZUT@value@dept}
    \item[\hbox to 0pt{学位:}]  {\bf\YZUT@value@degree}
    \end{list}
    %学位: {\bf\YZUT@value@degree\hfil}
        %Convocation: {\bf\@convocationmonth\hfil}
        %Year: {\bf\@convocationyear\hfil} \\
    \bigskip
    \def\baselinestretch{1}\@normalsize
    \parindent=36pt

    \indent
    {\small Permission is herewith granted to Yangzhou University %{\YZUT@value@university}
    to circulate and to have copied for non-commercial purposes, at its
    discretion, the above title upon the request of individuals or
    institutions.}

    \vskip1.5in
    \signature{}{{\footnotesize 作者签名}}

    \bigskip\bigskip

    \begin{sloppypar}
    \footnotesize
    \relax
    THE AUTHOR RESERVES OTHER PUBLICATION RIGHTS, AND NEITHER
    THE THESIS NOR EXTENSIVE EXTRACTS FROM IT MAY BE PRINTED OR
    OTHERWISE REPRODUCED WITHOUT THE AUTHOR'S WRITTEN PERMISSION.
    \medskip

    THE AUTHOR ATTESTS THAT PERMISSION HAS BEEN OBTAINED FOR THE
    USE OF ANY COPYRIGHTED MATERIAL APPEARING IN THIS THESIS (OTHER
    THAN BRIEF EXCERPTS REQUIRING ONLY PROPER ACKNOWLEDGEMENT IN
    SCHOLARLY WRITING) AND THAT ALL SUCH USE IS CLEARLY ACKNOWLEDGED.
    \end{sloppypar}
    \end{quotation}
    } \vfill

}
\makeatother

\makeatletter
\newcommand{\safechapter}{%
  \clearpage
  \thispagestyle{plain}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@safechapter\@ssafechapter%
}

\def\@safechapter[#1]#2{%
  \phantomsection  % 为 hyperref 创建锚点
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \refstepcounter{chapter}%
      \typeout{\@chapapp\space\thechapter.}%
      % 确保目录条目具有正确的超链接
      \addcontentsline{toc}{chapter}{%
        \protect\numberline{\thechapter}#1%
      }%
    \fi
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi
}

\def\@ssafechapter#1{%
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}%
  \chaptermark{#1}%
  \if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]%
  \else
    \@makeschapterhead{#1}%
    \@afterheading
  \fi
}

\newenvironment{abstract}{%
  \cleardoublepage
  \phantomsection
  %\addcontentsline{toc}{chapter}{摘要}
  \safechapter*{摘{\YZUTspace}要} % 不用 \chapter*, 而使用安全的章节命令
  %\markboth{摘要}{摘要}%将摘要加入toc中, 但是这个已经由\safechapter完成, 故省去.
}{%
  \par
  \vspace{2ex}
  \noindent\textbf{关键词：} \YZUT@value@keywords
}

\newenvironment{englishabstract}{%
  \cleardoublepage
  \phantomsection
  %\addcontentsline{toc}{chapter}{Abstract}
  \safechapter*{Abstract}
  %\markboth{Abstract}{Abstract}
}{%
  \par
  \vspace{2ex}
  \noindent\textbf{Keywords:} \YZUT@value@englishkeywords
}
\makeatother

\makeatletter
\renewcommand\tableofcontents{%
  \cleardoublepage
  % 目录标题：三号宋体加黑, 居中, 段前段后各1行
  \renewcommand{\contentsname}{目{\YZUTspace}录}
  \vspace*{\baselineskip}
  \safechapter*{\contentsname}%
    %\addcontentsline{toc}{chapter}{\contentsname}
    %\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%

  %\begin{center}
  %  \songti\bfseries\zihao{3}
  %  \contentsname
  %\end{center}
  \vspace{\baselineskip}

  % 目录内容：小四号宋体, 行距20磅
  \begingroup
    % 设置目录内容行距为20磅
    \setlength{\baselineskip}{20pt}
    \setlength{\parskip}{0pt}
    \setlength{\parindent}{0pt}

    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    %

    \@starttoc{toc}%
    \if@restonecol
        \twocolumn
    \fi
  \endgroup
}
\makeatother

\newcommand{\Nchapter}[1]{%
  \safechapter{#1}%
  \@mkboth{#1}{#1}%
}

\newenvironment{thebibliography2}[1]
     {\safechapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


\makeatletter
\newenvironment{pub}
  {
  \phantomsection
  %\addcontentsline{toc}{chapter}{攻读学位期间取得的研究成果}
  \safechapter*{攻读学位期间取得的研究成果}
  }
  {}
\makeatother

\makeatletter
\newenvironment{pubsection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}

\makeatother
\makeatletter
\newenvironment{publist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}
\makeatother

\makeatletter
\newenvironment{publications}[1]
     {\typeout{调试: 使用标签 = \meaning\YZUT@label@publications}%
     \phantomsection
     %\addcontentsline{toc}{chapter}{发表文章目录}
     %\safechapter{\YZUT@label@publications}%
      \@mkboth{\MakeUppercase\YZUT@label@publications}
              {\MakeUppercase\YZUT@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
\makeatother

\makeatletter
\newenvironment{resume}
  {
  \phantomsection
  %\addcontentsline{toc}{chapter}{简历}
  \safechapter*{\YZUT@label@resume}
  }
  {}
\makeatother
\makeatletter

\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}

\makeatother
\makeatletter
\renewenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}
\makeatother

\makeatletter
%% 致谢, 注意如果使用 XeLaTeX 编译, 则命令(这里是\YZUTspace）后面要跟空格, 或者用{}括起来.
%% 使用 PdfLaTeX则没有关系, 可以写致\YZUTspace谢
\renewenvironment{thanks}{%
  \cleardoublepage
  \phantomsection
  %\addcontentsline{toc}{chapter}{致\YZUTspace 谢}
  \safechapter*{致{\YZUTspace}谢}
  %\markboth{致谢}{致谢}
}{}
\makeatother

%% 定义设置签字页面的命令.
\def\shortsignature#1#2#3{\parbox[b]{1in}{\smash{#1}\vskip5pt}
\parbox[t]{#3}{\shortstack{\vrule width #3 height 0.4pt\\\footnotesize#2}}}
\makeatletter
    \@ifundefined{YZUT@label@OSAC}{%
      \def\YZUT@label@OSAC{扬州大学学位论文原创性声明和版权使用授权书}%
      \def\YZUT@label@OriginalStatement{学位论文原创性声明}%
      \def\YZUT@label@AuthorizationCopyright{学位论文版权使用授权书}%
    }{}

\newcommand\statementpage{%
  \cleardoublepage
  \thispagestyle{empty}
    {
    \ifenglish@thesis
      %英文模式
      %%\addcontentsline{toc}{toc}{\vskip13pt\noindent{\heiti\YZUT@label@OSAC}}
      \addcontentsline{toc}{chapter}{\YZUT@label@OSAC}
      \begin{center}
        {\large\heiti\YZUT@label@OSAC}
      \end{center}
    \else
      \safechapter*{\YZUT@label@OSAC}
    \fi
    %\newpage \parindent=0.75in \hyphenpenalty=10000
    \begin{quotation}
    %\begin{center}
    %   \large {\heiti \expandafter{\YZUT@label@OSAC}}
    %\end{center}
    \bigskip
    \begin{flushright}
        日期: {\bf\YZUT@value@submitdate}
    \end{flushright}
    \begin{list}{}{
        \setlength{\leftmargin}{1in}
        \setlength{\labelwidth}{0pt}
        \setlength{\labelsep}{\leftmargin}}
    \raggedright
    \item[\hbox to 0pt{作者:}]  \ifname@single
                                    {\bf\YZUT@value@author}
                                \else
                                    {\bf\YZUT@value@inlineauthor}
                                \fi
    \item[\hbox to 0pt{题目:}]  {\bf\YZUT@value@inlinetitle}
    \item[\hbox to 0pt{院系:}]  {\bf\YZUT@value@dept}
    \item[\hbox to 0pt{学位:}]  {\bf\inlinedegree}
    \end{list}
    %学位: {\bf\YZUT@value@degree\hfil}
        %Convocation: {\bf\@convocationmonth\hfil}
        %Year: {\bf\@convocationyear\hfil} \\
    %\bigskip
    \def\baselinestretch{1}\@normalsize
    %\parindent=20pt
    \vskip\stretch{1}

    \indent

\noindent{\heiti\YZUT@label@OriginalStatement}
\vskip\stretch{1}
\begin{sloppypar}
\relax
{\kaishu
\noindent \qquad 本人声明: 所呈交的学位论文是在导师指导下独立进行研究工作所取得的研究成果.
除文中已经标明引用的内容外, 本论文不包含其他个人或集体已经发表的研究成果.
对本文的研究做出贡献的个人和集体, 均已在文中以明确方式标明. 本声明的法律
结果由本人承担. }
\end{sloppypar}

    %\vskip0.2in
    \vskip\stretch{1}

    \begin{flushleft}
    \shortsignature{{\small 作者签名:}}{}{1in}
    %\vskip0.352778cm
    \vskip\stretch{1}
    \shortsignature{{\small 签字日期:}}{}{1in}
    \end{flushleft}

    %\bigskip\bigskip
    \vskip\stretch{2}

\noindent{\heiti\YZUT@label@AuthorizationCopyright}
\vskip\stretch{1}
\begin{sloppypar}
\relax
{\kaishu
\noindent \qquad 本人完全了解学校有关保留、使用学位论文的规定,
即: 学校有权保留并向国家有关部门或机构送交学位论文的复印件和电子文档,
允许论文被查阅和借阅. 本人授权扬州大学可以将学位论文的全部或部分内容
编入有关数据库进行检索, 可以采用影印、缩印或扫描等复制手段保存、汇编
学位论文. 同时授权中国科学技术信息研究所将本学位论文收录到《中国学位
论文全文数据库》, 并通过网络向社会公众提供信息服务.}
\end{sloppypar}

\vskip\stretch{1}
\begin{center}
\shortsignature{{\small 作者签名:}}{}{1in}\hfill
\iftwo@supervisors
    \shortsignature{{\small 导师签名:}}{}{2in}
\else
    \shortsignature{{\small 导师签名:}}{}{1in}
\fi
\vskip\stretch{1}
\shortsignature{{\small 签字日期:}}{}{1in}\hfill
\iftwo@supervisors
    \shortsignature{{\small 签字日期:}}{}{2in}
\else
    \shortsignature{{\small 签字日期:}}{}{1in}
\fi
\end{center}

\vskip\stretch{1}
\begin{center}
{\footnotesize(如论文为密件可不授权, 但论文原创必须声明.)}
\end{center}

    \end{quotation}
    } \vfill
}
\makeatother

\makeatletter
\renewcommand{\appendix}{%
  \par
  \cleardoublepage
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  %\setcounter{paragraph}{0}%

  % 章节编号显示格式
  \renewcommand{\thechapter}{附录\chinese{chapter}}
  % 附录中的节编号为1.1, 2.1等
  \renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
  \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
  \renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

  % 修改章节标题格式为"附录一"、"附录二", 使用 block模式以保持与正文一致, 不用display
  \titleformat{\chapter}[block]
    {\centering\songti\bfseries\zihao{3}}
    {附录\chinese{chapter}} % 这里设置附录的标题格式
    {1em}
    {} % 标题后面为空

  % 设置hyperref的锚点, 确保目录链接正确
  \renewcommand{\theHchapter}{appendix.\arabic{chapter}}

  % 标题间距设置（与正文保持一致）
  \titlespacing*{\chapter}
    {0pt}
    {2\baselineskip}
    {2\baselineskip}
}
\makeatother

\makeatletter


\declaretheorem[style=plain,numberwithin=chapter,name=定理]{theorem}
\declaretheorem[style=plain,sibling=theorem,name=引理]{lemma}
\declaretheorem[style=plain,sibling=theorem,name=推论]{corollary}
\declaretheorem[style=plain,sibling=theorem,name=命题]{proposition}
\declaretheorem[style=definition,sibling=theorem,name=定义]{definition}
\declaretheorem[style=definition,sibling=theorem,name=例]{example}
\declaretheorem[style=remark,sibling=theorem,name=注]{remark}
\declaretheorem[style=remark,sibling=theorem,name=假设]{assumption}
\declaretheorem[style=remark,sibling=theorem,name=公理]{axiom}

\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
    \itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\makeatother

\definecolor{mygreen}{rgb}{0,0.5,0}
\newcommand{\tc}[1]{\textcolor{mygreen}{#1}\index{#1}}

\floatname{algorithm}{算法}
\renewcommand{\listalgorithmname}{算法索引}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}

\lstset{
  basicstyle=\small\ttfamily,
  keywordstyle=\color{blue}\bfseries,
  commentstyle=\color{green!50!black},
  stringstyle=\color{red},
  numbers=left,
  numberstyle=\tiny\color{gray},
  stepnumber=1,
  numbersep=5pt,
  backgroundcolor=\color{white},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  captionpos=b,
  breaklines=true,
  breakatwhitespace=true,
  frame=single,
  rulecolor=\color{black},
  escapeinside={\%*}{*)}
}

\AtEndOfPackage{
  \makeatletter
  \input{YZUthesis.cfg}
  \makeatother
  }

  \hypersetup{
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksopenlevel=1,
    pdfstartview=Fit,
    pdfpagemode=UseOutlines,
    colorlinks=true,
    linkcolor=blue,
    anchorcolor=blue,
    citecolor=blue,
    filecolor=blue,
    urlcolor=blue,
    %pdftitle={\YZUT@value@title},
    %pdfauthor={\YZUT@value@author},
    pdfsubject={扬州大学学位论文},
    %pdfkeywords={\YZUT@value@keywords},
    pdfcreator={LaTeX with YZUthesis class}
  }

\newcommand{\centertitle}[1]{%
  \begin{center}
    \zihao{3}\heiti\bfseries #1
  \end{center}
}

\newcommand{\acknowledge}[1]{%
  \footnote{#1}
}

\makeatletter
\newcommand{\fundingnote}{%
  \ifx\YZUT@label@funding
    \empty
  % 如果 \YZUT@label@funding 为空, 什么都不做（跳过基金项目显示）
  \else
  % 否则, 显示基金项目
    \vspace{1ex}
    \noindent
    \begin{minipage}{\textwidth}
      \zihao{-4}\songti  % 宋体小四
      \textbf{基金项目: } \YZUT@value@funding
    \end{minipage}
  \fi
}

\newenvironment{NSFC}{%
  \cleardoublepage
  \thispagestyle{empty}
  %\safechapter*{基金资助}
  \phantomsection
  \addcontentsline{toc}{chapter}{基金资助}

  \begin{center}
  \centering\songti\bfseries\zihao{3}
  \YZUT@value@title
  \end{center}
  \vspace{2cm}
}{}
\makeatother

\makeatletter
\newenvironment{symbols}{%
  \cleardoublepage
  \thispagestyle{empty}
  \safechapter*{符号说明}
  \phantomsection
  %\addcontentsline{toc}{chapter}{符号说明}
  %\begin{center}
  %\centering\songti\bfseries\zihao{3}
  %符号说明
  %\end{center}
  \vspace{2cm}
}{}
\makeatother




%% 下面两个命令通常在文件末尾, 用于输出索引和更改记录
%% 
%%
%% End of file `YZUthesis.cls'.
