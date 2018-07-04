% \iffalse
% (c) 2018 Sebastian Friedl <sfr682k@t-online.de>
% This class is currently under construction and will be finished soon.
%
% This work currently consisting of the file InformatikMWGBeamer.cls and InformatikMWGBeamer-doc.dtx
% is subject to the LaTeX Project Public License, Version 1.3c or - at your option - any later version.
%
% The work has the LPPL status 'maintained'
% Current maintainer of the work is Sebastian Friedl
% \fi
%
%
%
%
% \subsection*{Initialisation}
% Provide some information about the class:
%    \begin{macrocode}
\ProvidesClass{InformatikMWGBeamer}%
    [2018/07/04 v0.2 InformatikMWG Corporate Design Presentation Class]
%    \end{macrocode}
%
% Print some \enquote{advertising} to the log:
%    \begin{macrocode}
\typeout{}
\typeout{=================================================}
\typeout{InformatikMWG Corporate Design Presentation Class}
\typeout{Version 2018/07/04 v0.2}
\typeout{}
\typeout{(c) 2018 Sebastian Friedl}
\typeout{Licensed under LPPL 1.3c or later}
\typeout{=================================================}
\typeout{}
%    \end{macrocode}
%
% Require \LaTeXe. Anyway, who is still using the old \LaTeX\ 2.09 \dots
%    \begin{macrocode}
\NeedsTeXFormat{LaTeX2e}
%    \end{macrocode}
%
% Detect whether one of the \enquote{newer,} \enquote{enhanced} engines is used:
%    \begin{macrocode}
\RequirePackage{iftex}
\newif\if@informatikmwgbeamer@xeorluatex
\@informatikmwgbeamer@xeorluatexfalse
\ifXeTeX\@informatikmwgbeamer@xeorluatextrue\fi
\ifLuaTeX\@informatikmwgbeamer@xeorluatextrue\fi
%    \end{macrocode}
%
% Print the insight from above to the log (that might come in handy when debugging this sh**):
%    \begin{macrocode}
\typeout{}
\if@informatikmwgbeamer@xeorluatex\typeout{Xe- or LuaLaTeX detected}
\else\typeout{Classical (pdf)LaTeX detected}
\fi
\typeout{}
%    \end{macrocode}
%
%
%
%
% \subsection*{Loading the \texttt{beamer} class}
% Force an aspect ratio of 16:9 and a font size of 10pt:
%    \begin{macrocode}
\PassOptionsToClass{aspectratio=169, 10pt}{beamer}
%    \end{macrocode}
%
% Instruct "hyperref" to use "utf8"-encoding when \hologo{XeLaTeX} or \hologo{LuaLaTeX} is used:
%    \begin{macrocode}
\if@informatikmwgbeamer@xeorluatex\PassOptionsToClass{hyperref=unicode}{beamer}\fi
%    \end{macrocode}
%
% Load "beamer", switch to presentation mode and start defining the theme:
%    \begin{macrocode}
\LoadClass{beamer}
\mode<presentation>
%    \end{macrocode}
%
% Override "beamer"'s commands changing the way things look for disabling changes to the corporate design:
%    \begin{macrocode}
\def\usetheme#1{\ClassWarning{InformatikMWGBeamer}%
    {\noexpand\usetheme command ignored. Stick to our corporate design!}}
\def\usefonttheme#1{\ClassWarning{InformatikMWGBeamer}%
    {\noexpand\usefonttheme command ignored. Stick to our corporate design!}}
\def\usecolortheme#1{\ClassWarning{InformatikMWGBeamer}%
    {\noexpand\usecolortheme command ignored. Stick to our corporate design!}}
\def\useinnertheme#1{\ClassWarning{InformatikMWGBeamer}%
    {\noexpand\useinnertheme command ignored. Stick to our corporate design!}}
\def\useoutertheme#1{\ClassWarning{InformatikMWGBeamer}%
    {\noexpand\useoutertheme command ignored. Stick to our corporate design!}}
%    \end{macrocode}
%
% Remove those nasty navigation symbols:
%    \begin{macrocode}
\setbeamertemplate{navigation symbols}{}
%    \end{macrocode}
%
%
%
%
% \subsection*{Require Packages}
% Require really required packages:
% \begin{description}
%     \item[\texttt{etoolbox}] for obtaining access to some useful \hologo{eTeX} commands.
%     \item[\texttt{ifthen}]   for handling exceptions
%     \item[\texttt{tikz}]     for drawing stuff and taking over absolute placement on title, part, \dots\ frames.
%                              "tikz"'s "fadings" library is also loaded for drawing the faded title, part, \dots\ frame's separation line.
% \end{description}
%    \begin{macrocode}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{tikz}
    \usetikzlibrary{fadings}
%    \end{macrocode}
%
% Frame numbering business: \\
% "beamer", version 3.49 and later declares some nice commands (and templates) useful for numbering frames.
% However, version 3.48 and newer lack of this feature; so another package is required: "appendixnumberbeamer".
%
% \smallskip
% To detect "beamer" 3.48 and older, we check whether "\insertmainframenumber", introduced with version 3.49, is undefined:
%    \begin{macrocode}
\ifx\insertmainframenumber\@undefined%
\RequirePackage{appendixnumberbeamer}%
\def\insertmainframenumber{\insertframenumber}
\def\insertframenumberinappendix{\insertframenumber}
\def\insertappendixframenumber{\inserttotalframenumber}
\fi
%    \end{macrocode}
%
%
%
%
% \subsection*{Load the Fira fonts}
% The way the fonts are loaded depends on the used engine.
%    \begin{macrocode}
\if@informatikmwgbeamer@xeorluatex
%    \end{macrocode}
% \hologo{XeLaTeX} and \hologo{LuaLaTeX}: Require "fontspec" and load the OpenType fonts
%    \begin{macrocode}
    \RequirePackage[no-math]{fontspec}
    \setmainfont[Numbers=Lining]{FiraSans}
    \setsansfont[Numbers=Lining]{FiraSans}
    \setmonofont{FiraMono}
%    \end{macrocode}
% Disable "fontspec"'s commands for switching fonts:
%    \begin{macrocode}
    \def\setmainfont#1{\ClassWarning{InformatikMWGBeamer}%
        {\noexpand\setmainfont command ignored. Stick to our corporate design!}}
    \def\setsansfont#1{\ClassWarning{InformatikMWGBeamer}%
        {\noexpand\setsansfont command ignored. Stick to our corporate design!}}
    \def\setmonofont#1{\ClassWarning{InformatikMWGBeamer}%
        {\noexpand\setmonofont command ignored. Stick to our corporate design!}}
\else
%    \end{macrocode}
% Ok. We're dealing with somebody using (pdf)\LaTeX, so we have to load some font packages:
%    \begin{macrocode}
    \RequirePackage[lining, sfdefault]{FiraSans}
    \RequirePackage[lining]{FiraMono}
    \let\rmdefault\sfdefault
    \RequirePackage[T1]{fontenc}
\fi
%    \end{macrocode}
%
% Increase the line spread
%    \begin{macrocode}
\linespread{1.05}
%    \end{macrocode} 
%
% Require the "newtxsf" package since one may require some math symbols:
%    \begin{macrocode}
\PassOptionsToPackage{scaled=1.176}{newtxsf}
\RequirePackage{newtxsf}
%    \end{macrocode}
%
%
%
%
% \subsection*{Class options}
% Define a \opt{draft} option leaving a blank space instead of a logo:
%    \begin{macrocode}
\newif\ifbeamer@draft
\beamer@draftfalse
\DeclareOptionBeamer{draft}{\beamer@drafttrue}
%    \end{macrocode}
%
% Define a \opt{noheadline} option to be used when a Table of Contents is not necessary:
%    \begin{macrocode}
\newif\ifbeamer@showheadline
\beamer@showheadlinetrue
\DeclareOptionBeamer{noheadline}{\beamer@showheadlinefalse}
%    \end{macrocode}
%
% Define some internal variables and initialize them:
%    \begin{macrocode}
\newif\ifbeamer@showframenrs
\beamer@showframenrstrue
%    \end{macrocode}
%
% Processes the options passed to the class:
%    \begin{macrocode}
\ProcessOptionsBeamer
%    \end{macrocode}
%
%
%
%
% \subsection*{Appendix stuff}
%    \begin{macrocode}
\newif\ifbeamer@insideappendix
\beamer@insideappendixfalse
\AtBeginDocument{\apptocmd{\appendix}{%
    \beamer@insideappendixtrue
    \beamer@showframenrsfalse
%     \ifbeamer@showheadline \setbeamertemplate{mwgheadline}[notoc] \fi
    \setbeamertemplate{part page}[InformatikMWGAppendix]
    \frame{\partpage}
    \addtocounter{framenumber}{-1}
    \beamer@showframenrstrue}{}{}
}
%    \end{macrocode}
%
% \subsection*{Innerstyling, Part I (Item templates)}
% Reset the style of all items
%    \begin{macrocode}
\setbeamertemplate{items}[default]
%    \end{macrocode}
%
% Itemization template: triangle / dash / bullet points
%    \begin{macrocode}
\setbeamertemplate{itemize item}[default]
\setbeamertemplate{itemize subitem}{--}
\setbeamertemplate{itemize subsubitem}[circle]
%    \end{macrocode}
%
% Table of Contents: Draw boxes around section numbers
%    \begin{macrocode}
\setbeamertemplate{sections/subsections in toc}[square]
%    \end{macrocode}
%
% Use the bibliography items as specified by the bibliography package. \\
% See "beamer"'s user guide, section 10.6 (\enquote{Adding a Bibliography}) for an instruction how to get the cute little icons back.
%    \begin{macrocode}
\setbeamertemplate{bibliography item}{\insertbiblabel}
%    \end{macrocode}
%
%
%
%
% \subsection*{Innerstyling, Part II (Frame templates)}
% Define the title frame template:
%    \begin{macrocode}
\defbeamertemplate*{title page}{InformatikMWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    %
    \begin{tikzpicture}[remember picture, overlay]
        \draw (current page.west) ++(2em,  0.6em)
            node[anchor=base west, align=left]%
                {{\usebeamerfont*{title}\usebeamercolor*{title}%
                    \ifx\inserttitle\@empty\else\inserttitle\fi}%
                \ifx\inserttitle\@empty\else%
                    \ifx\insertsubtitle\@empty\else\\\fi\fi%
                 {\usebeamerfont*{subtitle}\usebeamercolor*{subtitle}%
                    \ifx\insertsubtitle\@empty\else\insertsubtitle\fi}};
        
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0)
            -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading)
            -- (current page.east);
        
        \draw (current page.west) ++(2em, -0.3em) node[anchor=north west, align=left]%
            {\begin{minipage}{\linewidth}
                {\usebeamerfont*{author}\usebeamercolor*{author}%
                    \ifx\beamer@shortauthor\@empty\else\insertauthor\fi}\\[\smallskipamount]%
                {\usebeamerfont*{institute}\usebeamercolor*{institute}%
                    \ifx\insertinstitute\@empty\else\insertinstitute \fi}%
                \ifx\insertinstitute\@empty\else%
                    \ifx\insertdate\@empty\else\\[\medskipamount]\fi\fi%
                {\usebeamerfont*{date}\usebeamercolor*{date}%
                    \ifx\insertdate\@empty\else\insertdate\fi}
             \end{minipage}};
    \end{tikzpicture}}
%    \end{macrocode}
%
% Define a part frame template
%    \begin{macrocode}
\defbeamertemplate*{part page}{InformatikMWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    %
    \begin{tikzpicture}[remember picture, overlay]
        \draw (current page.west) ++(2em,  0.6em)
            node[anchor=base west, align=left]%
                {\usebeamerfont*{part title}\usebeamercolor*{title}%
                    \insertromanpartnumber.~ \insertpart};
        
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0)
            -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading)
            -- (current page.east);
    \end{tikzpicture}}
%    \end{macrocode}
%
% Define a sectin frame template
%    \begin{macrocode}
\defbeamertemplate*{section page}{InformatikMWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    %
    \begin{tikzpicture}[remember picture, overlay]
        \draw (current page.west) ++(2em,  0.6em)
            node[anchor=base west, align=left]%
                {\usebeamerfont*{section title}\usebeamercolor*{title}%
                    \thesection.~ \insertsection};
            
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0)
            -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading)
            -- (current page.east);
    \end{tikzpicture}}
%    \end{macrocode}
%
% Define a subsection frame template
%    \begin{macrocode}
\defbeamertemplate*{subsection page}{InformatikMWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    %
    \begin{tikzpicture}[remember picture, overlay]
        \draw (current page.west) ++(2em,  0.6em)
            node[anchor=base west, align=left]%
                {\usebeamerfont*{section title}\usebeamercolor*{title}%
                    \thesection.~ \insertsection};
        
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0)
            -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading)
            -- (current page.east);
        
        \draw (current page.west) ++(2em, -0.3em)
            node[anchor=north west, align=left]%
                {\usebeamerfont*{subsection title}\usebeamercolor*{title}%
                    \thesection.\thesubsection~ \insertsubsection};
    \end{tikzpicture}}
%    \end{macrocode}
%
% Define a part frame template for used inside the appendix
%    \begin{macrocode}
\defbeamertemplate{part page}{InformatikMWGAppendix}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    %
    \begin{tikzpicture}[remember picture, overlay]
        \draw (current page.west) ++(2em,  0.6em)
            node[anchor=base west, align=left]%
                {\usebeamerfont*{part title}\usebeamercolor*{title}\insertpart};
        
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0)
            -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading)
            -- (current page.east);
    \end{tikzpicture}}
%    \end{macrocode}
%
%
%
%
% \subsection*{Outerstyling (Frame components)}
% \subsubsection*{Headline}
% Activate "beamer"'s "compress" option so miniframes are shown in the same row:
%    \begin{macrocode}
\beamer@compresstrue
%    \end{macrocode}
%
% Define the headline template. Since we are inserting a "\hskip0pt plus1filll" at the right of the section navigation,
% the section headings are strung together:
%    \begin{macrocode}
\defbeamertemplate*{headline}{informatikmwg}{%
    \begin{beamercolorbox}[ht=2.75ex,dp=1.125ex]{section in head/foot}
        \insertsectionnavigationhorizontal{\linewidth}{}{\hskip0pt plus1filll}%
    \end{beamercolorbox}}
%    \end{macrocode}
%
% Remove the headline when the \opt{noheadline} option is used:
%    \begin{macrocode}
\ifbeamer@showheadline\else\setbeamertemplate{headline}{}\fi
%    \end{macrocode}
%
%
% \subsubsection*{Footline}
% \textit{Meta information} \\
% The footline consists of two lines: the upper one containing information about the institute
% and the lower one containing information about author(s) and presentation title. \\
% Author and title are separated by a colon followed by a "\quad"
%    \begin{macrocode}
\defbeamertemplate*{footline}{InformatikMWG}{%
    \begin{beamercolorbox}%
            [wd=\paperwidth,ht=2.75ex,dp=.5ex,leftskip=10ex,rightskip=3ex]{footline}
        \usebeamerfont*{meta information}
        \insertshortinstitute
    \end{beamercolorbox}%
    \begin{beamercolorbox}%
            [wd=\paperwidth,ht=2.75ex,dp=1.125ex,leftskip=10ex,rightskip=3ex]{footline}
        \usebeamerfont*{meta information}
        \insertshortauthor
        \ifx\beamer@shortauthor\@empty\else\ifx\beamer@shorttitle\@empty\else
            :\quad%
        \fi\fi
        \insertshorttitle
    \end{beamercolorbox}%
%    \end{macrocode}
%
% \medskip
% \textit{The logo} \\
% \textbf{TODO:} Insert the logo
%    \begin{macrocode}
    \ifbeamer@draft\else\begin{tikzpicture}[overlay]
        \clip (0,0) rectangle (\paperwidth,5.5ex);
        \node[above right] at (0,0) {\textless{}Logo\textgreater};
    \end{tikzpicture}\fi%
%    \end{macrocode}
%
% \medskip
% \textit{Frame numbers} \\
% Use an "overlay"ed "tikzpicture" for placing the frame numbers.
% The content has to be "\clip"ped to the requested dimension:
%    \begin{macrocode}
    \ifbeamer@showframenrs\begin{tikzpicture}[overlay]\large
        \clip ({\paperwidth-6ex},0) rectangle (\paperwidth,5ex);
%    \end{macrocode}
%
% Draw the outer circle not covered by the progress bar.
% When being inside the appendix, use the color of the progress bar, so the progress bar is \enquote{invisible}.
%    \begin{macrocode}
        \ifbeamer@insideappendix
            \fill[fill=MWGRed]    (\paperwidth-2.5ex,1.8125ex) circle (3.0ex);
        \else
            \fill[fill=MWGRed!40] (\paperwidth-2.5ex,1.8125ex) circle (3.0ex);
        \fi
%    \end{macrocode}
%
% Draw an inner white circle as background for the frame numbers:
%    \begin{macrocode}
        \fill[fill=white]         (\paperwidth-2.5ex,1.8125ex) circle (2.5ex);
%    \end{macrocode}
%
% Insert the current frame number and draw the progress bar if the presentation has got more than 0 frames in the main part.
%    \begin{macrocode}
        \node[anchor=mid,MWGRed] at (\paperwidth-2.5ex,1.8125ex)
            {\ifbeamer@insideappendix+\,\insertframenumberinappendix%
             \else\insertframenumber%
             \fi};
        \ifbeamer@insideappendix\else\ifthenelse{\insertmainframenumber > 0}{%
            \draw[MWGRed,line width=.5125ex] ({\paperwidth-2.5ex},-.9375ex)
                arc (270:{226.5-202*(\insertframenumber/\insertmainframenumber)}:2.75ex);}{}\fi
    %    \end{macrocode}
%
% At last, draw a \enquote{replacement} for the progress bar in the non-covered range:
%    \begin{macrocode}
        \draw[MWGRed,line width=.5125ex] ({\paperwidth-2.5ex},-.9375ex)
            arc (270:384.5:2.75ex);
    \end{tikzpicture}\fi}
%    \end{macrocode}
%
%
% \subsubsection*{Sidebars}
% Don't show the logo in the right sidebar since it's placed in the footline:
%    \begin{macrocode}
\defbeamertemplate*{sidebar right}{InformatikMWG}{%
    \vfill%
    \llap{\usebeamertemplate***{navigation symbols}\hskip0.1cm}%
    \vskip2pt}
%    \end{macrocode}
%
%
%
%
% \subsection*{Font theme}
% Define the font for elements on the title frame:
%    \begin{macrocode}
\setbeamerfont*{title}{size=\Large, series=\bfseries, shape=\scshape}
\setbeamerfont*{subtitle}{series=\bfseries}
\setbeamerfont*{author}{size=\small}
\setbeamerfont*{institute}{size=\small}
\setbeamerfont*{date}{size=\small}
%    \end{macrocode}
%
% Use a bold font for the frame title:
%    \begin{macrocode}
\setbeamerfont*{frametitle}{size=\Large, series=\bfseries, parent=structure}
\setbeamerfont*{framesubtitle}{size=\footnotesize}
%    \end{macrocode}
%
% Use tiny small caps for content in the head- and footline:
%    \begin{macrocode}
\setbeamerfont*{headline}{size=\tiny}
\setbeamerfont*{section in head/foot}{size=\tiny}
\setbeamerfont*{footline}{size=\tiny, shape=\scshape}
\setbeamerfont*{meta information}{parent=footline}
\setbeamerfont*{frame number}{size=\tiny, shape=\scshape}
%    \end{macrocode}
%
% Use large bold small caps for part headings on part frames:
%    \begin{macrocode}
\setbeamerfont*{part name}{size=\LARGE, series=\bfseries, shape=\scshape}
\setbeamerfont*{part title}{size=\LARGE, series=\bfseries, shape=\scshape}
%    \end{macrocode}
%
% Use large small caps for section headings on (sub-)section frames:
%    \begin{macrocode}
\setbeamerfont*{section name}{size=\Large, shape=\scshape}
\setbeamerfont*{section title}{size=\Large, shape=\scshape}
%    \end{macrocode}
%
% Use the italic font shape for subsection headings on subsection frames:
%    \begin{macrocode}
\setbeamerfont*{subsection name}{size=\large, shape=\itshape}
\setbeamerfont*{subsection title}{size=\large, shape=\itshape}
%    \end{macrocode}
%
% Table of Contents: "\large" small caps for section headings, "\small" subsection headings and "\footnotesize"d subsection headings:
%    \begin{macrocode}
\setbeamerfont*{section in toc}{parent=structure, size=\large, shape=\scshape}
\setbeamerfont*{section in toc shaded}{parent=section in toc}
\setbeamerfont*{section number projected}%
    {size=\small, parent={section in toc,projected text}}
\setbeamerfont*{subsection in toc}{size=\small}
\setbeamerfont*{subsection in toc shaded}{parent=subsection in toc}
\setbeamerfont*{subsubsection in toc}{size=\footnotesize}
\setbeamerfont*{subsubsection in toc shaded}{parent=subsubsection in toc}
%    \end{macrocode}
%
% Small caps for the caption name, italics for the caption content:
%    \begin{macrocode}
\setbeamerfont*{caption}{size=\small, shape=\itshape}
\setbeamerfont*{caption name}{parent={structure}, size=\small, shape=\scshape}
%    \end{macrocode}
%
% Use "\tiny" button captions:
%    \begin{macrocode}
\setbeamerfont*{button}{size=\tiny}
%    \end{macrocode}
%
% Use small caps for block titles and the normal font for block bodies:
%    \begin{macrocode}
\setbeamerfont*{block title}%
    {parent={structure,block body}, size=\large, shape=\scshape}
\setbeamerfont*{block body}{}
\setbeamerfont*{block body example}{}
\setbeamerfont*{block title example}{parent={block title,example text}}
\setbeamerfont*{block title alerted}{parent={block title,alerted text}}
\setbeamerfont*{block body alerted}{}
%    \end{macrocode}
%
% Use italics for enumerate items:
%    \begin{macrocode}
\setbeamerfont*{item}{parent=structure}
\setbeamerfont*{itemize item}{parent=item}
\setbeamerfont*{enumerate item}{shape=\itshape, parent=item}
\setbeamerfont*{itemize/enumerate body}{}
%    \end{macrocode}
%
% Apply the items' font settings to subitems:
%    \begin{macrocode}
\setbeamerfont*{subitem}{parent=item}
\setbeamerfont*{itemize subitem}{parent=subitem}
\setbeamerfont*{enumerate subitem}{shape=\itshape, parent=subitem}
\setbeamerfont*{itemize/enumerate subbody}{size=\small}
%    \end{macrocode}
%
% Apply the subitems' font settings to subsubitems:
%    \begin{macrocode}
\setbeamerfont*{subsubitem}{parent=subitem}
\setbeamerfont*{itemize subsubitem}{parent=subsubitem}
\setbeamerfont*{enumerate subsubitem}{shape=\itshape, parent=subsubitem}
\setbeamerfont*{itemize/enumerate subsubbody}{size=\footnotesize}
%    \end{macrocode}
%
% Use a bold font for description items:
%    \begin{macrocode}
\setbeamerfont*{description item}{series=\bfseries, parent=item}
%    \end{macrocode}
%
%
%
%
% \subsection*{Color theme}
% Define a set of basic colors:
%    \begin{macrocode}
\definecolor{MWGRed}{RGB}{100,29,27}
\definecolor{MWGGreen}{RGB}{166,214,35}
\definecolor{MWGGrey}{RGB}{80,80,80}
%    \end{macrocode}
%
% Set up the basic color scheme:
%    \begin{macrocode}
\setbeamercolor{normal text}{fg=black,bg=white}
\setbeamercolor{alerted text}{fg=red}
\setbeamercolor{example text}{fg=green!50!black}
%    \end{macrocode}
%
% Use "MWGRed" for structure items:
%    \begin{macrocode}
\setbeamercolor{structure}{fg=MWGRed}
\setbeamercolor{local structure}{parent=structure}
%    \end{macrocode}
%
% Define the color palette:
%    \begin{macrocode}
\setbeamercolor*{palette primary}{fg=white,bg=MWGRed}
\setbeamercolor*{palette secondary}{fg=black,bg=MWGGreen}
\setbeamercolor*{palette tertiary}{fg=black,bg=MWGGrey}
\setbeamercolor*{palette quaternary}{fg=black,bg=white}
%    \end{macrocode}
%
% Use the normal text color for text on the title frame:
%    \begin{macrocode}
\setbeamercolor*{title}{parent=normal text}
\setbeamercolor*{author}{parent=normal text}
\setbeamercolor*{institute}{parent=normal text}
\setbeamercolor*{titlegraphic}{parent=normal text}
%    \end{macrocode}
%
% Apply the primary colors to the navigation bar (headline) and footline:
%    \begin{macrocode}
\setbeamercolor*{section in head/foot}{parent=palette primary}
\setbeamercolor*{footline}{parent=palette primary}
%    \end{macrocode}
%
% Set up the colors used in the Table of Contents:
%    \begin{macrocode}
\setbeamercolor*{section in toc}{parent=structure}
\setbeamercolor*{section in toc shaded}{parent=section in toc}
\setbeamercolor*{section number projected}{parent=item projected}
\setbeamercolor*{subsection in toc}{}
\setbeamercolor*{subsection in toc shaded}{parent=subsection in toc}
\setbeamercolor*{subsection number projected}{parent={subitem projected}}
\setbeamercolor*{subsubsection in toc}{parent=subsection in toc}
\setbeamercolor*{subsubsection in toc shaded}{parent=subsubsection in toc}
\setbeamercolor*{subsubsection number projected}{parent=subsubitem projected}
%    \end{macrocode}
%
% Apply the structure color template to the logo:
%    \begin{macrocode}
\setbeamercolor*{logo}{parent=structure}
%    \end{macrocode}
%
% Apply the primary colors to frametitle and -subtitle:
%    \begin{macrocode}
\setbeamercolor*{frametitle}{parent=palette primary}
\setbeamercolor*{framesubtitle}{parent=palette primary}
%    \end{macrocode}
%
% Use the structure color for footnotes:
%    \begin{macrocode}
\setbeamercolor*{footnote}{parent=structure}
\setbeamercolor*{footnote mark}{fg=.}
%    \end{macrocode}
%
% Apply the structure color to the caption name, but not to the caption itself:
%    \begin{macrocode}
\setbeamercolor*{caption}{}
\setbeamercolor*{caption name}{fg=structure}
%    \end{macrocode}
%
% Let the button color depend on the local structure's color:
%    \begin{macrocode}
\setbeamercolor*{button}{use=local structure,bg=local structure.fg!50!bg,fg=white}
\setbeamercolor*{button border}{use=button,fg=button.bg}
%    \end{macrocode}
%
% Use a lighter "MWGRed" for the navigation symbols:
%    \begin{macrocode}
\setbeamercolor*{navigation symbols}{fg=MWGRed!40!bg}
\setbeamercolor*{navigation symbols dimmed}{fg=MWGRed!40!bg}
%    \end{macrocode}
%
% Let the color of the blocks depend on the primary palette color, example text color and alert text color:
%    \begin{macrocode}
\setbeamercolor*{block title}{parent=palette primary}
\setbeamercolor*{block body}%
    {parent=normal text, use=block title, bg=block title.bg!20!bg}
\setbeamercolor*{block title alerted}%
    {use=alerted text, fg=white, bg=alerted text.fg!85!black!80!white}
\setbeamercolor*{block body alerted}%
    {parent=normal text, use=block title alerted, bg=block title alerted.bg!20!bg}
\setbeamercolor*{block title example}{parent=palette secondary}
\setbeamercolor*{block body example}%
    {parent=normal text, use=block title example, bg=block title example.bg!20!bg}
%    \end{macrocode}
%
% Let the items' color depend on the local structure's color:
%    \begin{macrocode}
\setbeamercolor*{item}{parent=local structure}
\setbeamercolor*{item projected}{parent=item,use=item,fg=white,bg=item.fg}
\setbeamercolor*{enumerate item}{parent=item}
\setbeamercolor*{itemize item}{parent=item}
\setbeamercolor*{itemize/enumerate body}{}
%    \end{macrocode}
%
% Apply the items' color to the subitems:
%    \begin{macrocode}
\setbeamercolor*{subitem}{parent=item}
\setbeamercolor*{subitem projected}{parent=item projected}
\setbeamercolor*{enumerate subitem}{parent=subitem}
\setbeamercolor*{itemize subitem}{parent=subitem}
\setbeamercolor*{itemize/enumerate subbody}{}
%    \end{macrocode}
%
% Apply the subitems' color to the subsubitems:
%    \begin{macrocode}
\setbeamercolor*{subsubitem}{parent=subitem}
\setbeamercolor*{subsubitem projected}{parent=subitem projected}
\setbeamercolor*{enumerate subsubitem}{parent=subsubitem}
\setbeamercolor*{itemize subsubitem}{parent=subsubitem}
\setbeamercolor*{itemize/enumerate subsubbody}{}
%    \end{macrocode}
%
% Apply the item's color to description items:
%    \begin{macrocode}
\setbeamercolor*{description item}{parent=item}
%    \end{macrocode}
%
% Use different tints of "MWGRed" for the bibliography:
%    \begin{macrocode}
\setbeamercolor*{bibliography item}{parent=item}
\setbeamercolor*{bibliography entry author}{fg=MWGRed}
\setbeamercolor*{bibliography entry title}{use=normal text}
\setbeamercolor*{bibliography entry location}{fg=MWGRed!65!bg}
\setbeamercolor*{bibliography entry note}{fg=MWGRed!65!bg}
%    \end{macrocode}
%
% Use "MWGRed" for the separation line:
%    \begin{macrocode}
\setbeamercolor*{separation line}{fg=MWGRed}
%    \end{macrocode}
%
% Use "MWGRed" for the abstact's title:
%    \begin{macrocode}
\setbeamercolor*{abstract}{}
\setbeamercolor*{abstract title}{parent=MWGRed}
%    \end{macrocode}
%
% Use no special color for verses:
%    \begin{macrocode}
\setbeamercolor*{verse}{}
%    \end{macrocode}
%
% Use no special colors for quotes:
%    \begin{macrocode}
\setbeamercolor*{quotation}{}
\setbeamercolor*{quote}{parent=quotation}
%    \end{macrocode}
%
% Use "MWGRed" for the qed symbol:
%    \begin{macrocode}
\setbeamercolor*{qed symbol}{fg=MWGRed}
%    \end{macrocode}
%
%
%
%
% \subsection*{Intelligent commands for inserting structure frames}
% \begin{macro}{\maketitle}
% Create an extra frame without a frame number displayed if "\maketitle" is used outside of a frame \\
%    \begin{macrocode}
\def\maketitle{%
    \ifbeamer@inframe\titlepage%
    \else%
        \beamer@showframenrsfalse%
        \frame{\titlepage}%
        \beamer@showframenrstrue%
    \fi}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\partframe}
% Behaves like "\partpage", but creates an extra frame not counted into the (total) number of frames if "\partframe" is used outside of a frame
%    \begin{macrocode}
\newcommand{\partframe}{%
    \ifbeamer@inframe\partpage%
    \else%
        \frame{\partpage}%
        \addtocounter{framenumber}{-1}%
    \fi}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\sectionframe}
% Behaves like "\sectionpage", but creates an extra frame not counted into the (total) number of frames
% if "\sectionframe" is used outside of a frame
%    \begin{macrocode}
\newcommand{\sectionframe}{%
    \ifbeamer@inframe\sectionpage%
    \else%
        \frame{\sectionpage}%
        \addtocounter{framenumber}{-1}%
    \fi}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\subsectionframe}
% Behaves like "\subsectionpage", but creates an extra frame not counted into the (total) number of frames
% if "\subsectionframe" is used outside of a frame
%    \begin{macrocode}
\newcommand{\subsectionframe}{%
    \ifbeamer@inframe\subsectionpage%
    \else%
        \frame{\subsectionpage}%
        \addtocounter{framenumber}{-1}%
    \fi}
%    \end{macrocode}
% \end{macro}
%
%
%
%
% \subsection*{Commands influencing the class' behavior}
% \begin{macro}{\activatepartframes}
% Activate insertion of part frames at the beginning of a part
%    \begin{macrocode}
\newcommand{\activatepartframes}{\AtBeginPart{\partframe}}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\deactivatepartframes}
% Deactivate insertion of part frames at the beginning of a part
%    \begin{macrocode}
\newcommand{\deactivatepartframes}{\AtBeginPart{}}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\activatesectionframes}
% Activate insertion of section frames at the beginning of a section
%    \begin{macrocode}
\newcommand{\activatesectionframes}{\AtBeginSection{\sectionframe}}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\deactivatesectionframes}
% Deactivate insertion of section frames at the beginning of a section
%    \begin{macrocode}
\newcommand{\deactivatesectionframes}{\AtBeginSection{}}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\activatesubsectionframes}
% Activate insertion of subsection frames at the beginning of a subsection
%    \begin{macrocode}
\newcommand{\activatesubsectionframes}{\AtBeginSubsection{\subsectionframe}}
%    \end{macrocode}
% \end{macro}
%
% \begin{macro}{\deactivatesubsectionframes}
% Deactivate insertion of subsection frames at the beginning of a subsection
%    \begin{macrocode}
\newcommand{\deactivatesubsectionframes}{\AtBeginSubsection{}}
%    \end{macrocode}
% \end{macro}
%
% \textbf{TODO:} Enable switching between showtoc/hidetoc
%
%
%
% \subsection*{Famous last words}
% The theme is loaded completely, so leave presentation mode and stop collecting input.
%    \begin{macrocode}
\mode<all>
\endinput
%    \end{macrocode}
