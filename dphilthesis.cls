%
% dphilthesis class
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dphilthesis}[2016/02/02 Oxford thesis class]

\LoadClass[openright,11pt]{report}
%\LoadClass[twoside, 11pt]{report}

\newif\ifmc@nobind
\mc@nobindfalse

\DeclareOption{nobind}{\mc@nobindtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\setlength{\parskip}{0pt plus 1pt}
\setlength{\parfillskip}{0pt plus .7\textwidth}

\newlength{\singlebaselineskip}
\newlength{\frontmatterbaselineskip}
\newlength{\textbaselineskip}

\setlength{\singlebaselineskip}{\baselineskip}
\setlength{\frontmatterbaselineskip}{17pt plus1pt minus1pt}
\setlength{\textbaselineskip}{22pt plus2pt}


%\frenchspacing
%\raggedbottom
\flushbottom


% smaller footnotes
% \newcommand{\captionsize}{\footnotesize}
% \renewcommand{\footnotesize}{\scriptsize}


% Thesis declarations
\def\unicrest#1{\gdef\@unicrest{#1}}
\def\institute#1{\gdef\@institute{#1}}
\def\college#1{\gdef\@college{#1}}
\def\submitted#1{\gdef\@submitted{#1}}
\def\university#1{\gdef\@university{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\degreedate#1{\gdef\@degreedate{#1}}


% Draft note
\def\draftnote#1{\gdef\@draftnote{\color{gray} #1}}


% Bibliography
\RequirePackage{natbib}


% Equation numbers per section (2.3.12), instead of per chapter (2.18)
 %\numberwithin{equation}{subsection}


% Define text area of page and margin offsets
\ifmc@nobind
\usepackage[includehead,
			hmargin={3.0cm, 3.0cm},
			vmargin={2.5cm,2.5cm},
			headsep=0.5cm,
			footskip=1cm]
			{geometry}
\else
\usepackage[includehead,
			hmargin={3.4cm, 2.6cm},
			vmargin={2.25cm,2.5cm},
			headsep=0.75cm,
			footskip=1cm]
			{geometry}
\fi



% line spacing
\usepackage{setspace}


% widows/orphans
\usepackage[defaultlines=3,all]{nowidow}


% colours
\usepackage[usenames,dvipsnames,x11names]{xcolor}
\definecolor{marine}{RGB}{0,32,96}
\definecolor{oxblue}{RGB}{0,33,71}
\definecolor{oxgray}{RGB}{145,154,156}
\definecolor{darkgray}{RGB}{50,50,50}


% Graphics
\usepackage{graphicx}
%\usepackage[draft]{graphicx}


% Misc packages
%\usepackage{todonotes}
%\usepackage[pdftex]{graphicx}
\usepackage{ifthen}
\usepackage{float}
%\usepackage{subfig}
\usepackage{nth}
\usepackage{url}
\usepackage{xspace}




% no hyphenation in titles
\usepackage[raggedright]{titlesec}
% space after paragraph
\titlespacing*{\paragraph} {0pt}{0.333\baselineskip}{0.5em}


% Tables & enumeration
\usepackage{longtable}
\usepackage{multicol,multirow,array}
\usepackage{blkarray}
\usepackage{rotating}
\usepackage{tabularx}
\usepackage{booktabs}
%\usepackage[flushleft]{threeparttable}
\usepackage{threeparttable}

\setlength\heavyrulewidth{1pt}
\newcommand{\otoprule}{\midrule[0.9pt]}

\newcolumntype{Y}{>{\centering\arraybackslash}X}


% enumeration
\usepackage[inline]{enumitem}
\setlist[description]{leftmargin=\parindent}
\setlist[itemize]{leftmargin=\parindent}

\usepackage{notoccite}


% caption
\usepackage{setspace}
\usepackage[%
font={small,stretch=1.1},%
labelfont=bf,%
margin=2mm,%
singlelinecheck=false%
]{caption}

\usepackage{subcaption}

\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}



% footnotes
\usepackage[perpage,multiple,hang]{footmisc}
\renewcommand{\thefootnote}{\bfseries\fnsymbol{footnote}}
\renewcommand{\footnotelayout}{\raggedright} % for having raggedright footnotes
\setlength{\footnotemargin}{0.5em}


% Chapter formatting
\usepackage[nogrey,utopia]{quotchap}
\colorlet{chaptergrey}{oxgray}
%\renewcommand*\sectfont{\sffamily}
\usepackage[nottoc]{tocbibind}


% Font & Language
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{helvet}
%\usepackage{lmodern}
%\usepackage{PTSerifCaption}
\usepackage[scaled=.8]{beramono}
\usepackage[scaled=.8]{berasans}
\usepackage[nott,nosf,widermath]{kpfonts}
%\usepackage[greek,latin,UKenglish]{babel}
\usepackage[UKenglish]{babel}
%\usepackage{textcomp}
\usepackage[letterspace=-50]{microtype}
\microtypesetup{protrusion=true}
%\usepackage{fontspec}
\usepackage[abbreviations,phrases,UKenglish]{foreign}

\usepackage{relsize}


% Math
\usepackage{xfrac}
\usepackage{amsmath}
\usepackage{amssymb}
%\usepackage{nicefrac}
%\usepackage{mathtools}


\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\rmsle}{RMSLE}


% algorithm
% \usepackage[chapter]{algorithm}
% \usepackage{algorithmicx}
% \usepackage{algpseudocode}
% \captionsetup[algorithm]{font=small,margin=2mm}
% \algrenewcommand\textproc{\texttt}


% drawing
\usepackage{tikz}
\usetikzlibrary{%
arrows,%
calc,%
decorations.pathmorphing,%
fit,%
shapes,%
shapes.geometric,%
shapes.misc,%
trees}

\usepackage{chemfig,xstring}


% Number setting
\usepackage{fmtcount}


% standard units
\usepackage{etoolbox}
\usepackage[group-separator={,},group-minimum-digits={3}]{siunitx}
\robustify\bfseries
\sisetup{%
round-mode=places,%
round-precision=3,%
detect-weight=true,%
detect-inline-weight=math,%
list-final-separator={, and }%
}




% Date format
\usepackage[UKenglish]{isodate}
\cleanlookdateon



% corrections
\usepackage{soulutf8}
\soulregister\citep7
\soulregister\citet7
\soulregister\Citep7
\soulregister\Citet7
\soulregister\ref7
\soulregister\cref7
\soulregister\ctref7
\soulregister\cpref7
\soulregister\Cpref7
\soulregister\pref7
\soulregister\xspace7
\soulregister\eg7
\soulregister\ie7
\soulregister\gls7
\soulregister\glsentryfull7
\soulregister\fk7
\soulregister\SI7
\soulregister\rom7
\soulregister\dec7
\setulcolor{yellow}
\setstcolor{red}
\setul{0.5ex}{0.3ex}

% correction
\newcommand{\Correct}[1]{\hl{#1}}
\newcommand{\CorrectNote}[1]{%
\vspace{2.5mm}%
\noindent{%
\footnotesize\texttt{
\fcolorbox{YellowOrange}{white}{%
\colorbox{yellow}{%
\textcolor{black}{CORRECTION}%
} %
\quad #1 \quad%
}%
\vspace{2.5mm}%
}}}
\def\CorrectLabel{\quad\mbox{\colorbox{yellow}{\footnotesize\texttt{CORRECTED}}}\xspace}

% addition
\newcommand{\Addition}[1]{{\hl{#1}}}
\newcommand{\AdditionNote}[1]{%
\vspace{2.5mm}%
\noindent{%
\footnotesize\texttt{
\fcolorbox{YellowOrange}{white}{%
\colorbox{yellow}{%
\textcolor{black}{ADDITION}%
} %
\quad #1 \quad%
}%
\vspace{2.5mm}%
}}}
\def\AdditionLabel{\quad\mbox{\colorbox{yellow}{\footnotesize\texttt{ADDITION}}}\xspace}

% deletion
\newcommand{\Delete}[1]{\textcolor{gray}{\st{#1}}}
\newcommand{\DeleteNote}[1]{%
\vspace{5mm}%
\noindent{%
\footnotesize\texttt{%
\fcolorbox{red}{white}{%
\colorbox{red}{%
\textcolor{white}{REMOVED}%
} %
\quad #1 \quad%
}%
\vspace{5mm}%
}}}


% Headers/Footers
\usepackage{fancyhdr}
\addtolength\headheight{6.7pt}
\setlength{\headheight}{15pt}
\fancyhf{}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{\thechapter. #1}}
\renewcommand{\sectionmark}[1]{\markright{\thesection. #1}}
% \fancyhead[LO]{\footnotesize{\leftmark}}
% \fancyhead[RE]{\footnotesize{\rightmark}}
% \fancyhead[RO,LE]{\footnotesize\bfseries\thepage}
\fancyhead[LO]{\footnotesize\textsl{\leftmark}}
\fancyhead[RE]{\footnotesize\textsl{\rightmark}}
\fancyhead[RO,LE]{\footnotesize\bfseries\thepage}
%\fancyfoot[C]{\footnotesize\texttt{\@draftnote}}

\fancypagestyle{plain}
{
	\fancyhf{}
	\fancyhead[L]{\footnotesize\textsl{\let\\=\relax \@title}}
	\fancyhead[R]{\footnotesize\bfseries\thepage}
	%\fancyfoot[C]{\footnotesize\texttt{\@draftnote}}
}

\fancypagestyle{front}
{
	\fancyhf{}
	%\fancyfoot[C]{\footnotesize\texttt{\@draftnote}}
}


% Fix header on cleared pages for openright
\def\cleardoublepage{
	\clearpage\if@twoside \ifodd\c@page \else
	\hbox{}
	\fancyhead[RE,LO]{}
	\newpage
	\if@twocolumn\hbox{}\newpage
	\fi
	\fancyhead[LO]{\footnotesize\textsl{\leftmark}}
	\fancyhead[RE]{\footnotesize\textsl{\rightmark}}
	\fi\fi
}


% Chapter-specific TOC
\usepackage{minitoc}
\setcounter{minitocdepth}{2}
\setlength{\mtcindent}{0em}
\renewcommand{\mtcSfont}{\small\rm}
\renewcommand{\mtifont}{\small\bf}
\mtcsetoffset{minitoc}{-1ex}
% \let\oldmtc@verse\mtc@verse
% \renewcommand{\mtc@verse}[1]{\oldmtc@verse{#1}\setlength{\baselineskip}{\z@}}
\mtcsetfeature{minitoc}{open}{\vspace{0.5ex}}






% Always single column for front matter
\newenvironment{alwayssingle}{
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}


% Define title page
\renewcommand{\maketitle}{
	\begin{alwayssingle}
	\null
	\renewcommand{\footnotesize}{\small}
	\renewcommand{\footnoterule}{\relax}
	\thispagestyle{empty}
	\begin{center}
		{\LARGE {\bfseries {\@title}} \par}
		{\large \vspace*{1mm} {\includegraphics{\@unicrest} \par} \vspace*{1mm}}
		{{\Large \bfseries {\@author}} \par}
		{
			\large \vspace*{1ex}
			{{\@institute} \par}
			\vspace*{1ex}
			{{\@college} \par}
			\vspace*{1ex}
			{\Large {\@university} \par}
			\vspace*{6ex}
			{{\@supervisor} \par}
			\vspace*{6ex}
			{\normalsize {\@submitted} \par}
			{\Large \textit{\@degree} \par}
			\vspace*{6ex}
			{\@degreedate}
		}
	\end{center}
	\vfill\null
\end{alwayssingle}%
}


% Dedication
\newenvironment{dedication}
{
	\begin{alwayssingle}
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
}
{
	\end{center}
	\vspace*{\fill}
	\vspace*{\fill}
	\end{alwayssingle}
}


% Acknowledgements
\newenvironment{acknowledgements}
{
	\begin{alwayssingle}
	\chapter*{Acknowledgements}
	% \thispagestyle{front}
	% \pagestyle{front}
	% \thispagestyle{empty}
	\setlength{\baselineskip}{\frontmatterbaselineskip}
}
{
	\end{alwayssingle}
}


% Abstract
\renewenvironment{abstract}
{
	\begin{alwayssingle}
	\chapter*{Abstract}
	% \thispagestyle{front}
	% \pagestyle{front}
	%\thispagestyle{empty}
	\setlength{\baselineskip}{\frontmatterbaselineskip}
}
{
	\end{alwayssingle}
}


% Separate abstract
\newenvironment{abstractseparate}
{
	% \newgeometry{margin=3cm,top=2.5cm,bottom=2cm}
	\thispagestyle{empty}
	\begin{alwayssingle}
	{\centering %\begin{center}
    {\large \bfseries \@title \par}
	{{\large \vspace*{1.5ex} \@author} \par}
	{
		\small
		\vspace*{0.5ex}
		{\@institute} \par
		{\@college} \par
		{\@university} \par
		\vspace*{1ex}
	    %{\@supervisor} \par
	    %\vspace*{2ex}
	    {\@submitted}\par
	    \textit{\@degree}\par
		\vspace*{1ex}
		{\@degreedate} \par
	}
	%\vfill
	%{\Large \bfseries Abstract}
	}%\end{center}
	\vspace{1ex}
	\setlength{\baselineskip}{\z@}}
{
	\vfill\end{alwayssingle}%\restoregeometry
}


% Front matter with roman numerals
\newenvironment{romanpages}
{
	\cleardoublepage
	\setlength{\baselineskip}{\frontmatterbaselineskip}
	\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}
	\small
	%\fontsize{9pt}{12pt}
	\onehalfspacing
}
{
	\cleardoublepage\setcounter{page}{1}
	\renewcommand{\thepage}{\arabic{page}}
}


% summary per chapter
\newenvironment{summary}%
{%
	\small%
	\setstretch{1.1}%
	\setlength{\parindent}{0cm}%
	\textbf{Summary.}
}%
{%
	\newpage%
}

% Figure placement on page
%  This is to help prevent too many figures on their own pages. From:
%  http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#captfont
% \renewcommand{\topfraction}{0.85}
% \renewcommand{\textfraction}{0.1}
% \renewcommand{\floatpagefraction}{0.75}

%\setlength{\textfloatsep}{20pt plus15pt minus4pt} % Flexible spacing around floats
%\setlength{\intextsep}{20pt plus15pt minus10pt} % floats inserted inside text (using h)

% \renewcommand{\totalnumber}{2}
% \renewcommand{\topnumber}{1}
% \renewcommand{\bottomnumber}{1}
\renewcommand{\topfraction}{0.75}
\renewcommand{\bottomfraction}{0.75}
\renewcommand{\textfraction}{0.25}
\renewcommand{\floatpagefraction}{0.75}
\setlength{\floatsep}{20pt plus15pt minus5pt}
\setlength{\textfloatsep}{20pt plus15pt minus5pt}
\setlength{\intextsep}{20pt plus15pt minus5pt}



% Hyphenation and pagebreak
\hyphenpenalty=5000
\tolerance=1000
\widowpenalty=50000
\clubpenalty=50000



% Fix paragraph spacing within quotes for multi-par quotes
% \renewenvironment{savequote}[1][8cm]{%
% \begin{lrbox}{\@quotebox}
% \begin{minipage}[t]{#1}\footnotesize\slshape%
% \setlength{\parskip}{6px}}{%
% \unskip\end{minipage}\end{lrbox}
% \global\setbox\@quotebox\copy\@quotebox
% \global\let\@printcites\@iprintcites
% \ignorespacesafterend}
% \renewcommand{\qauthor}[1]{\par
% {\raggedleft\upshape #1\qquad\hbox{}\par}\bigskip}


% Headers in sections are not uppercase
\let\@ldtoc\tableofcontents
\renewcommand*\tableofcontents{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldtoc}}
\let\@ldlof\listoffigures
\renewcommand*\listoffigures{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlof}}
\let\@ldlot\listoftables
\renewcommand*\listoftables{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlot}}
\let\@ldbib\bibliography
\renewcommand*\bibliography[1]{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldbib{#1}}}


% Adjust start-of-chapter spacing
\renewcommand{\chapterheadstartvskip}{\vspace*{1em}}
\renewcommand{\chapterheadendvskip}{\vspace{1em}}


\addtolength{\skip\footins}{2pt}




%%% MUST BE LAST

\usepackage{varioref}


% Links
\usepackage[hidelinks]{hyperref}
\hypersetup{
colorlinks=true,
allcolors=black,
%citecolor=darkgray,
urlcolor=marine,
linktoc=all
}



% Referencing
\usepackage[noabbrev,capitalise]{cleveref}


% List of abbreviations
\usepackage[acronym,nopostdot,nonumberlist]{glossaries}
\glstoctrue
\glsnogroupskiptrue

\newglossarystyle{csuper}{
	\setglossarystyle{super}
	\renewcommand{\glossentry}[2]{
	\glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
	\Glossentrydesc{##1}\glspostdescription\space ##2\tabularnewline}
}
\setglossarystyle{csuper}
\renewcommand{\glsnamefont}[1]{\textbf{#1}}
\makeglossaries


\input{macros.sty}
