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
    [2018/04/03 v0.0 InformatikMWG Corporate Design Presentation Class]
%    \end{macrocode}
%
% Print some \enquote{advertising} to the log:
%    \begin{macrocode}
\typeout{}
\typeout{=================================================}
\typeout{InformatikMWG Corporate Design Presentation Class}
\typeout{Version 2018/04/03 v0.0}
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
% Force an aspect ratio of 16:9:
%    \begin{macrocode}
\PassOptionsToClass{aspectratio=169}{beamer}
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
%     \item[\texttt{tikz}]     for drawing stuff and taking over absolute placement on title, part, \dots\ frames.
%                              "tikz"'s "fadings" library is also loaded for drawing the faded title, part, \dots\ frame's separation line.
% \end{description}
%    \begin{macrocode}
\RequirePackage{etoolbox}
\RequirePackage{tikz}
    \usetikzlibrary{fadings}
%    \end{macrocode}
%
% Frame numbering business: \\
% "beamer", version 3.49 and later declares some nice commands (and templates) useful for numbering frames.
% However, version 3.48 and newer lack of this feature; so another package is required: "appendixnumberbeamer".
%
% \smallskip
% To detect "beamer" 3.48 and older, we check wheter "\insertmainframenumber", introduced with version 3.49, is undefined:
%    \begin{macrocode}
\ifx\insertmainframenumber\@undefined\RequirePackage{appendixnumberbeamer}\fi
%    \end{macrocode}
%
%
%
%
% \subsection*{Fonts}
% The way the fonts are loaded depends on the used engine.
%    \begin{macrocode}
\if@informatikmwgbeamer@xeorluatex
%    \end{macrocode}
% \hologo{XeLaTeX} and \hologo{LuaLaTeX}: Require "fontspec" and load the OpenType fonts
%    \begin{macrocode}
    \RequirePackage[no-math]{fontspec}
    \setmainfont[Scale=.85]{FiraSans}
    \setsansfont[Scale=.85]{FiraSans}
    \setmonofont[Scale=.85]{FiraMono}
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
    \RequirePackage[lf,sfdefault, scale=.85]{FiraSans}
    \RequirePackage[lf, scale=.85]{FiraMono}
    \let\rmdefault\sfdefault
    \RequirePackage[T1]{fontenc}
\fi
%    \end{macrocode}
%
% Require the "newtxsf" package since one may require some math symbols:
%    \begin{macrocode}
\usepackage{newtxsf}
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
% Define a \opt{noheadline} option to be used when a table of contents is not necessary
%    \begin{macrocode}
\newif\ifbeamer@showheadline
\beamer@showheadlinetrue
\DeclareOptionBeamer{noheadline}{\beamer@showheadlinefalse}
%    \end{macrocode}
%
% Processes the options passed to the class
%    \begin{macrocode}
\ProcessOptionsBeamer
%    \end{macrocode}
%
%
%
% \subsection*{Stuff not converted to docstrip yet}
% It may require some additional time until the following code has been properly converted to something "docstrip"-friendly. \\
% Please stay patient.
%    \begin{macrocode}
% APPENDIX SETTINGS -----------------------------------------------------------------------------------------------------------------------------

% Changes the frame numbering to "Appendix" when the command \appendix is used
\AtBeginDocument{\apptocmd{\appendix}{%
    \setbeamertemplate{frame numbering}[none]                           % No frame numbers for the separation frame
    \ifbeamer@showheadline \setbeamertemplate{mwgheadline}[notoc] \fi   % No navigation in the headlines -- if headlines are shown
    \setbeamertemplate{part page}[appendix]                             % Removes the counter from the part frames
    \frame{\partpage}                                                   % Inserts a separation frame
    \addtocounter{framenumber}{-1}
    \setbeamertemplate{frame numbering}[appendix]}{}{}                  % Frame numbering for appendix slides
}



% INNERSTYLING I (Itemizations, enumerations, table of contents) --------------------------------------------------------------------------------

% Resets the style of all items
\setbeamertemplate{items}[default]

% Templates used for itemizations
\setbeamertemplate{itemize item}[default]
\setbeamertemplate{itemize subitem}{--}
\setbeamertemplate{itemize subsubitem}[circle]

% Table of contents
\setbeamertemplate{sections/subsections in toc}[square]

% "Normal" bibliography items
\setbeamertemplate{bibliography item}{\insertbiblabel}



% INNERSTYLING II (Title & stucture frames) -----------------------------------------------------------------------------------------------------

% Title frame layout
\defbeamertemplate*{title page}{MWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    
    \begin{tikzpicture}[remember picture, overlay]
        % Presentation title
        \draw (current page.west) ++(2em,  0.6em) node[anchor=base west, align=left]%
            {{\usebeamerfont*{title}\usebeamercolor*{title}\ifx\inserttitle\@empty\else\inserttitle\fi}%
                \ifx\inserttitle\@empty\else \ifx\insertsubtitle\@empty\else \\ \fi\fi%
                {\usebeamerfont*{subtitle}\usebeamercolor*{subtitle}\ifx\insertsubtitle\@empty\else\insertsubtitle\fi}};
        
        % Separation line
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0) -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading) -- (current page.east);
        
        % Author & institute
        \draw (current page.west) ++(2em, -0.3em) node[anchor=north west, align=left]%
            {{\usebeamerfont*{author}\usebeamercolor*{author}\ifx\beamer@shortauthor\@empty\else\insertauthor\fi} \\%
                {\usebeamerfont*{institute}\usebeamercolor*{institute}\ifx\insertinstitute\@empty\else\insertinstitute \fi}%
                \ifx\insertinstitute\@empty\else \ifx\insertdate\@empty\else \\[\smallskipamount] \fi\fi%
                {\usebeamerfont*{date}\usebeamercolor*{date}\ifx\insertdate\@empty\else\insertdate\fi}};
    \end{tikzpicture}}

% Part frame layout
\defbeamertemplate*{part page}{MWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    
    \begin{tikzpicture}[remember picture, overlay]
        % Part title
        \draw (current page.west) ++(2em,  0.6em) node[anchor=base west, align=left]%
            {\usebeamerfont*{part title}\usebeamercolor*{title}\insertromanpartnumber.~ \insertpart};
        
        % Separation line
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0) -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading) -- (current page.east);
    \end{tikzpicture}}

% Section frame layout
\defbeamertemplate*{section page}{MWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    
    \begin{tikzpicture}[remember picture, overlay]
        % Section title
        \draw (current page.west) ++(2em,  0.6em) node[anchor=base west, align=left]%
            {\usebeamerfont*{section title}\usebeamercolor*{title}\thesection.~ \insertsection};
            
        % Separation line
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0) -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading) -- (current page.east);
    \end{tikzpicture}}

% Subsection frame layout
\defbeamertemplate*{subsection page}{MWG}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    
    \begin{tikzpicture}[remember picture, overlay]
        % Section title
        \draw (current page.west) ++(2em,  0.6em) node[anchor=base west, align=left]%
                {\usebeamerfont*{section title}\usebeamercolor*{title}\thesection.~ \insertsection};
        
        % Separation line
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0) -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading) -- (current page.east);
        
        % Subsection title
        \draw (current page.west) ++(2em, -0.3em) node[anchor=north west, align=left]%
            {\usebeamerfont*{subsection title}\usebeamercolor*{title}\thesection.\thesubsection~ \insertsubsection};
    \end{tikzpicture}}

% Appendix part frame layout
\defbeamertemplate{part page}{appendix}{%
    \ifx\insertframetitle\@empty \frametitle{~} \fi
    
    \begin{tikzpicture}[remember picture, overlay]
        % "Appendix" label
        \draw (current page.west) ++(2em,  0.6em) node[anchor=base west, align=left]%
            {\usebeamerfont*{part title}\usebeamercolor*{title}\insertpart};
        
        % Separation line
        \draw[MWGRed, very thick] (current page.west) ++(2.2em,0) -- ++(.5\textwidth,0) coordinate (startfading);
        \draw[MWGRed, very thick, path fading=east] (startfading) -- (current page.east);
    \end{tikzpicture}}



% OUTERSTYLING (Frame layout) -------------------------------------------------------------------------------------------------------------------

% Activates the "compress" option; this results in miniframes being shown in the same row
\beamer@compresstrue

% Defines the basic headline style
\defbeamertemplate*{headline}{informatikmwg}{\begin{beamercolorbox}[ht=2.75ex,dp=1.125ex]{section in head/foot}
    \insertsectionnavigationhorizontal{\linewidth}{}{\hskip0pt plus1filll}%
\end{beamercolorbox}}

% Decides which style to use -- depending, whether the "notoc" or "noheadline" option has been passed to the theme
\ifbeamer@showheadline\else\setbeamertemplate{headline}{}\fi


% Template for framenumbers:
% none         no framenumbers are shown (not recommened!)
% counter      a simple frame counter (Example: 1)
% fraction     framenumbers are shown as  current frame / total frames  (Example:  1 / 10)
% appendix     An "Appendix" remark instead of frame numbers on appendix frames
\defbeamertemplate{frame numbering}{none}{}
\defbeamertemplate{frame numbering}{counter}{\insertframenumber}
\defbeamertemplate{frame numbering}{fraction}{\insertframenumber\ / \inserttotalframenumber}
\defbeamertemplate{frame numbering}{appendix}{\appendixname}

% Selects default template: current frame / total frames
\setbeamertemplate{frame numbering}[fraction]



% The footline template, currently without logo
\defbeamertemplate*{footline}{InformatikMWG}{%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=.5ex,leftskip=10ex,rightskip=3ex]{footline}
        \usebeamerfont*{meta information}
        \insertshortinstitute
        \hfill {\usebeamerfont{frame number} \usebeamertemplate{frame numbering}}
    \end{beamercolorbox}
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.125ex,leftskip=10ex,rightskip=3ex]{footline}
        \usebeamerfont*{meta information}
        \insertshortauthor
        \ifx\beamer@shortauthor\@empty\else\ifx\beamer@shorttitle\@empty\else
            :\quad%
        \fi\fi
        \insertshorttitle
        \hfill \ifx\insertshortdate\@empty\else \insertshortdate \fi
    \end{beamercolorbox}
    \ifbeamer@draft\else% TODO: Logo
    \fi
}

% Remove the logo from the right sidebar
\defbeamertemplate*{sidebar right}{InformatikMWG}{%
    \vfill%
    \llap{\usebeamertemplate***{navigation symbols}\hskip0.1cm}%
    \vskip2pt%
}




% FONT THEME PART -------------------------------------------------------------------------------------------------------------------------------

% Title frame
\setbeamerfont*{title}{size=\Large, series=\bfseries, shape=\scshape}
\setbeamerfont*{subtitle}{family=\sffamily}
\setbeamerfont*{author}{size=\small}
\setbeamerfont*{institute}{size=\small}
\setbeamerfont*{date}{size=\small}

% Frame title & subtitle
\setbeamerfont*{frametitle}{size=\Large, series=\bfseries, parent=structure}
\setbeamerfont*{framesubtitle}{size=\footnotesize}

% Footline
\setbeamerfont*{meta information}{shape=\scshape}
\setbeamerfont*{frame number}{size=\tiny, shape=\scshape}

% Font styles for part pages
\setbeamerfont*{part name}{size=\LARGE, series=\bfseries, shape=\scshape}
\setbeamerfont*{part title}{size=\LARGE, series=\bfseries, shape=\scshape}

% Font styles for section pages
\setbeamerfont*{section name}{size=\Large, shape=\scshape}
\setbeamerfont*{section title}{size=\Large, shape=\scshape}

% Font styles for subsection pages
\setbeamerfont*{subsection name}{size=\large, shape=\itshape}
\setbeamerfont*{subsection title}{size=\large, shape=\itshape}

% Font styles for table of contents
\setbeamerfont*{section number projected}%
    {size=\small, parent={section in toc,projected text}}
\setbeamerfont*{section in toc}{parent=structure, size=\large, shape=\scshape}
\setbeamerfont*{section in toc shaded}{parent=section in toc}
\setbeamerfont*{subsection in toc}{size=\small}
\setbeamerfont*{subsection in toc shaded}{parent=subsection in toc}
\setbeamerfont*{subsubsection in toc}{size=\footnotesize}
\setbeamerfont*{subsubsection in toc shaded}{parent=subsubsection in toc}

\setbeamerfont*{section in head/foot}{size=\tiny}

% Caption styles
\setbeamerfont*{caption}{size=\small, shape=\itshape}
\setbeamerfont*{caption name}{parent={structure}, size=\small, shape=\scshape}

% Button styles
\setbeamerfont*{button}{size=\tiny}

% Block styles
\setbeamerfont*{block title}%
    {parent={structure,block body}, size=\large, shape=\scshape}
\setbeamerfont*{block body}{}

% Example block styles
\setbeamerfont*{block body example}{}
\setbeamerfont*{block title example}{parent={block title,example text}}

% Alert block styles
\setbeamerfont*{block title alerted}{parent={block title,alerted text}}
\setbeamerfont*{block body alerted}{}

% Item styles
\setbeamerfont*{item}{parent=structure}
\setbeamerfont*{itemize item}{parent=item}
\setbeamerfont*{enumerate item}{shape=\itshape, parent=item}
\setbeamerfont*{itemize/enumerate body}{}

% Subitem styles
\setbeamerfont*{subitem}{parent=item}
\setbeamerfont*{itemize subitem}{parent=subitem}
\setbeamerfont*{enumerate subitem}{shape=\itshape, parent=subitem}
\setbeamerfont*{itemize/enumerate subbody}{size=\small}

% Subsubitem styles
\setbeamerfont*{subsubitem}{parent=subitem}
\setbeamerfont*{itemize subsubitem}{parent=subsubitem}
\setbeamerfont*{enumerate subsubitem}{shape=\itshape, parent=subsubitem}
\setbeamerfont*{itemize/enumerate subsubbody}{size=\footnotesize}

% Description item styles
\setbeamerfont*{description item}{series=\bfseries, parent=item}

%    \end{macrocode}
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
% Set up the colors used in the table of contents:
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
% Let the item's color depend on the local structure's color:
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
% Create an extra frame without a frame number displayed if "\maketitle" is used outside of a frame
%    \begin{macrocode}
\def\maketitle{%
    \ifbeamer@inframe\titlepage%
    \else%
        \setbeamertemplate{frame numbering}[none]%
        \frame{\titlepage}%
        \setbeamertemplate{frame numbering}[fraction]%
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
%
%
%
% \subsection*{Famous last words}
% The theme is loaded completely, so leave presentation mode and stop collecting input.
%    \begin{macrocode}
\mode<all>
\endinput
%    \end{macrocode}
