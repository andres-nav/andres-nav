% Intro Options
\ProvidesClass{cv}[2021/11/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[lmargin=0.9cm, vmargin=0.3cm, rmargin=0.9cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage[shortlabels]{enumitem}
\usepackage{graphicx}
\usepackage{pifont}
\usepackage[document]{ragged2e}
\usepackage{fontawesome5}

% Multiple Languages

\def\en{en}%
\def\es{es}%
\newcommand{\dumblang}[2]{%
    \ifx\mylang\undefined{
        \PackageError{CV}{Language not set. Please define the language using the environment variable.}{}%
    }\else{
        \ifx\mylang\en{
            #1%
        }\else{
            \ifx\mylang\es{
                #2%
            }\else{
                \PackageError{CV}{Unknown language '\mylang'. Supported languages are '\en' and '\es'.}{}%
            }\fi
        }\fi
    }\fi
}

% Publications
\usepackage{cite}
\renewcommand\refname{\vskip -1.5cm}

% Color definitions
\usepackage[usenames,dvipsnames]{xcolor}
\definecolor{date}{HTML}{666666}
\definecolor{title}{HTML}{1D76E2}
\definecolor{primary}{HTML}{2b2b2b}
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

%% Source Sans Pro Title:
%%%%%%%%%%%%%%%%%%%%%%%%%
\def \pathtitlefont {fonts/sourcesanspro/}
\def \firstnamefont {sourcesanspro-SemiBold}
\def \secondnamefont {sourcesanspro-light}
\def \titlefont {\firstnamefont}
\def \namefontsize {9.5}

%Main Font Definitions
\def \pathmainfont {fonts/inter/}
\def \mainfont {inter-light}
\def \mainfontbold {inter-semibold}
% \def \mainbolditalicfont {}
% \def \mainitalicfont {}
\def \mainfontsize {9}
\def \mainsansfont {inter-light}

%Main Subheading Font Definitions
%Used for company name and sub-skills
\def \pathsubheadingfont {\pathtitlefont}
\def \subheadingfont {\titlefont}
\def \subheadingsize {12}

%Main Job Descriptor and Location Font Definitions
%Used for company name and sub-skills
\def \pathdescriptorfont {\pathsubheadingfont}
\def \descriptorfont {\secondnamefont}
\def \descriptorsize {9}
\def \pathlocationfont {\pathsubheadingfont}
\def \locationfont {\subheadingfont}
\def \locationsize {9}
\def \locationrightsize {10}

%Main Monospace Font Definitions
%Used for Job Title and Contact Line
\def \pathmonofont {fonts/officecodeprod/}
\def \monofont {OfficeCodeProD-Light}


% Set main fonts
\usepackage{fontspec}
\setmainfont[Color=primary, Path = \pathmainfont,BoldFont=\mainfontbold,UprightFeatures={SizeFeatures={Size=\mainfontsize}},
	BoldFeatures={SizeFeatures={Size=\mainfontsize}}]{\mainfont}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = \pathmainfont,UprightFeatures={SizeFeatures={Size=\mainfontsize}}
]{\mainsansfont}

% Date command
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\newcommand{\lastupdated}{\begin{textblock}{60}(155,5)
		\color{date}\fontspec[Path = \pathmainfont]{\mainfont}\fontsize{8pt}{10pt}\selectfont
		Last Updated on \today
	\end{textblock}}

% Name command
\usepackage[]{float}
\usepackage[]{tikz}
\newcommand{\namesection}[4]{
	#4

	\begin{minipage}[t]{0.60\textwidth}
		\RaggedRight{
			\color{title}
			\fontsize{30pt}{30pt}
			\fontspec[Path = \pathtitlefont]{\firstnamefont}\selectfont #1
			\fontspec[Path = \pathtitlefont]{\secondnamefont}\selectfont #2
		} \\[5pt]

		\noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}

	\end{minipage}
	\hfill
	\begin{minipage}[t]{0.35\textwidth}

		\tikz[remember picture,overlay] \node[anchor=north east, inner sep = 0.01\textwidth] at (current page.north east) {
			\includegraphics[width=0.5\textwidth]{#3}\hspace{0.1\textwidth}
		};


		%% \RaggedRight{\fontspec[Path = \pathmonofont]{\monofont}\fontsize{9pt}{10pt}\selectfont #4}

		%% \noindent\makebox[\linewidth]{\color{title}\rule{\paperwidth}{0pt}}
	\end{minipage}
	%% \vspace{-20pt}
}

% Section separators
\usepackage{titlesec}
\titlespacing{\section}{0pt}{10pt}{10pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{5pt}}
\newcommand{\padding}{\hspace{10pt}}

% Headings command
\titleformat{\section}
{\color{title} \scshape\fontspec[Path = \pathtitlefont]{\titlefont}\fontsize{16pt}{24pt}\selectfont \raggedright}
{}{10pt}{}[{\titlerule[1pt]}]

% Subheadings command
\titleformat{\subsection}{
	\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{14pt}\selectfont\bfseries\uppercase}{}{0em}{}

%Subheadings on the right
\newcommand{\runsubsection}[1]{
	\color{subheadings}\fontspec[Path = \pathsubheadingfont ]{\subheadingfont}\fontsize{\subheadingsize}{14pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{
	\color{subheadings}\raggedright\scshape\fontspec[Path = \pathdescriptorfont]{\descriptorfont}\fontsize{\descriptorsize}{13pt}\selectfont {|\hspace{3pt} #1} \normalfont}

% Location command
\newcommand{\locationright}[1]{
	\color{headings}\hfill\fontspec[Path = \pathlocationfont]{\locationfont}\fontsize{\locationrightsize}{12pt}\selectfont {#1} \normalfont \\}

\newcommand{\location}[1]{\vspace{-\topsep}\vspace{2pt}
	\hspace{10pt}\color{headings}\raggedright\fontspec[Path = \pathlocationfont]{\locationfont}\fontsize{\locationsize}{12pt}\selectfont {#1\\} \normalfont \vspace{5pt}}

\newcommand{\hardskills}[1]{\skills{Hard Skills \ding{219}}{#1}}
\newcommand{\softskills}[1]{\vspace{-\topsep}\skills{Soft Skills \ding{219}}{#1}}

\newcommand{\skills}[2]{\vspace{-\topsep}\vspace{10pt}
	\hspace{10pt}\color{headings}\raggedright\fontspec[Path = \pathlocationfont]{\locationfont}\fontsize{\locationsize}{12pt}\selectfont {\uppercase{#1} #2\\} \normalfont \vspace{5pt}}

\newcommand{\tb}[0]{\textbullet{}}

\newcommand{\contact}[3]{
	{\large \color{date} \faIcon[#3]{#2}} \hspace{1pt} {#1} %\\ \vspace{5pt}
}

%Contact Line
\newcommand{\contactline}[5]{
	%% \vspace{\fill}
	%% \begin{flushright}

	\contact{#1}{linkedin}{light}
	\contact{#2}{github}{light}
	\contact{#3}{globe}{solid}
	\contact{#4}{at}{solid}
	\contact{#5}{phone}{solid}

	%% \end{flushright}
	%% \vspace{\fill}
}

%Inline Centered Logo
\newcommand{\vcenteredinclude}[2]{\begingroup
	\setbox0=\hbox{\includegraphics[scale=0.10,trim={0 0.7cm 0cm 0cm}]{#1} {#2}}
	\parbox{\wd0}{\box0}\endgroup}

% Bullet Lists with fewer gaps command

\usepackage[most]{tcolorbox}
\newenvironment{tightemize}{
	\vspace{-10pt}
	\begin{justify}\begin{itemize}[label=\textbullet{}, leftmargin=20pt]
			\itemsep1pt \parskip0pt \parsep0pt
			}
			{\end{itemize}\end{justify}}

% Summery command
\newcommand{\summary}[1]{
	\vspace{-5pt}
	\begin{justify}
		\raggedright
		#1
	\end{justify}
	\vspace{-15pt}
}

% Local Variables:
% TeX-engine: luatex
% End:
