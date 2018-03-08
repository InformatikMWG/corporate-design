% (c) 2018 Sebastian Friedl <sfr682k@t-online.de>
% This class is currently under construction and will be finished soon.
%
% This work currently consisting of the file InformatikMWGBeamer.cls
% is subject to the LaTeX Project Public License, Version 1.3c or - at your option - any later version.
%
% This work has the LPPL status 'maintained'
% Current maintainer of the work is Sebastian Friedl



\ProvidesClass{InformatikMWGBeamer}[2018/03/08 Still in Development Informatik MWG Corporate Design Presentation Class]

\PassOptionsToClass{aspectratio=169}{beamer}


\RequirePackage{iftex}

\newif\if@informatikmwgbeamer@xeorluatex
\@informatikmwgbeamer@xeorluatexfalse

\ifXeTeX\@informatikmwgbeamer@xeorluatextrue\fi
\ifLuaTeX\@informatikmwgbeamer@xeorluatextrue\fi

\if@informatikmwgbeamer@xeorluatex\PassOptionsToClass{hyperref=unicode}{beamer}\fi

\LoadClass{beamer}
\NeedsTeXFormat{LaTeX2e}


% Switches to presentation mode
\mode<presentation>


\typeout{}
\typeout{===========================================}
\typeout{Informatik MWG Corporate Presentation Class}
\typeout{Version 2018/03/08}
\typeout{}
\typeout{(c) 2018 Sebastian Friedl}
\typeout{Licensed under LPPL 1.3c or later}
\typeout{===========================================}
\typeout{}




\def\usetheme#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\usetheme command ignored. Stick to our corporate design!}}
\def\usefonttheme#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\usefonttheme command ignored. Stick to our corporate design!}}
\def\usecolortheme#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\usecolortheme command ignored. Stick to our corporate design!}}
\def\useinnertheme#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\useinnertheme command ignored. Stick to our corporate design!}}
\def\useoutertheme#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\useoutertheme command ignored. Stick to our corporate design!}}





% REQUIRED PACKAGES -----------------------------------------------------------------------------------------------------------------------------

% Requires basically required packages
\RequirePackage{appendixnumberbeamer}   % Stops frame counting when the \appendix command is used
\RequirePackage{etoolbox}               % Enables access on e-TeX primitives
\RequirePackage{tikz}                   % Frontend for PGF -- required for inner-/outerstyling and option management
\usetikzlibrary{fadings}


% OPTION DECLARATIONS ---------------------------------------------------------------------------------------------------------------------------
% The headline uses dynamic declaration with pgfkeys (provided by tikz) so one can switch between toc and metainformation during presentation

% Option for not setting the logo
\newif\ifbeamer@showlogo
\beamer@showlogotrue
\DeclareOptionBeamer{nologo}{\beamer@showlogofalse}

% Option for activating draft mode
\newif\ifbeamer@draft
\beamer@draftfalse
\DeclareOptionBeamer{draft}{\beamer@drafttrue}

% Option for using an external logo
\newif\ifbeamer@externallogo
\beamer@externallogofalse
\DeclareOptionBeamer{externallogo}{
    \beamer@externallogotrue
    \beamer@showlogofalse}

% Option for not using the simplified logo
\newif\ifbeamer@simplifiedlogo
\beamer@simplifiedlogotrue
\DeclareOptionBeamer{hqlogo}{
    \beamer@externallogofalse
    \beamer@showlogotrue
    \beamer@simplifiedlogofalse}

% Option for not using smallcaps fontshape
\newif\ifbeamer@smallcaps
\beamer@smallcapstrue
\DeclareOptionBeamer{nosmallcaps}{\beamer@smallcapsfalse}

% Option for using an small footline
\newif\ifbeamer@smallfootline
\beamer@smallfootlinefalse
\DeclareOptionBeamer{smallfootline}{
    \beamer@smallfootlinetrue
    \beamer@externallogotrue}

% Option for not showing a table of contents in the frame's headline
\newif\ifbeamer@showtoc
\beamer@showtoctrue
\DeclareOptionBeamer{notoc}{\beamer@showtocfalse}

% Option for not showing the headline
\newif\ifbeamer@showheadline
\beamer@showheadlinetrue
\DeclareOptionBeamer{noheadline}{\beamer@showheadlinefalse}

% Processes the options passed to the theme
\ProcessOptionsBeamer



% FONTS -----------------------------------------------------------------------------------------------------------------------------------------

\if@informatikmwgbeamer@xeorluatex
    \RequirePackage[no-math]{fontspec}
    \setmainfont[Scale=.85]{FiraSans}
    \setsansfont[Scale=.85]{FiraSans}
    \setmonofont[Scale=.85]{FiraMono}
    
    \def\setmainfont#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\setmainfont command ignored. Stick to our corporate design!}}
    \def\setsansfont#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\setsansfont command ignored. Stick to our corporate design!}}
    \def\setmonofont#1{\ClassWarning{InformatikMWGBeamer}{\noexpand\setmonofont command ignored. Stick to our corporate design!}}
\else
    \RequirePackage[lf,sfdefault, scale=.85]{FiraSans}
    \RequirePackage[lf, scale=.85]{FiraMono}
    \let\rmdefault\sfdefault
    \RequirePackage[T1]{fontenc}
\fi

% Math support
\usepackage{newtxsf}



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

% Template for "no headline"
\defbeamertemplate*{headline}{none}{}

% Defines the two possible styles for the headline
\defbeamertemplate{mwgheadline}{toc}{\insertsectionnavigationhorizontal{\linewidth}{}{\hskip0pt plus1filll}}
\defbeamertemplate{mwgheadline}{notoc}{}

% Defines the basic headline style
\defbeamertemplate*{headline}{MWG}{\begin{beamercolorbox}[ht=2.75ex,dp=1.125ex]{section in head/foot}
    \usebeamertemplate{mwgheadline}
\end{beamercolorbox}}

% Decides which style to use -- depending, whether the "notoc" or "noheadline" option has been passed to the theme
\ifbeamer@showheadline
    \setbeamertemplate{headline}[MWG]
    \ifbeamer@showtoc
        \setbeamertemplate{mwgheadline}[toc]
    \else
        \setbeamertemplate{mwgheadline}[notoc]
    \fi
\else
    \setbeamertemplate{headline}[none]
\fi

% Lengths and commands for the frame title
\newlength{\MWG@frametitle@padding}
\setlength{\MWG@frametitle@padding}{2.2ex}
\newcommand{\MWG@frametitlestrut@start}{
	\rule{0pt}{\MWG@frametitle@padding + \totalheightof{\ifcsdef{MWG@frametitleformat}{\MWG@frametitleformat X}{X}}}}
\newcommand{\MWG@frametitlestrut@end}{\rule[-\MWG@frametitle@padding]{0pt}{\MWG@frametitle@padding}}

% Frame title template
\defbeamertemplate{frametitle}{MWG}{%
	\nointerlineskip%
	\begin{beamercolorbox}[wd=\paperwidth,sep=0pt,leftskip=\MWG@frametitle@padding,rightskip=\MWG@frametitle@padding,]{frametitle}%
		\MWG@frametitlestrut@start\insertframetitle\MWG@frametitlestrut@end%
	\end{beamercolorbox}}

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

% A small footline that comes without the logo but saves space
\defbeamertemplate*{footline}{MWGsmall}{%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.125ex,leftskip=3ex,rightskip=3ex]{footline}
        \usebeamerfont*{meta information}
        \insertshortauthor
        \ifx\beamer@shortauthor\@empty\else
            \ifx\beamer@shorttitle\@empty\else
                :
            \fi
        \fi
        \insertshorttitle
        \hfill\usebeamertemplate{frame numbering}
    \end{beamercolorbox}
}

% The default footline -- fist with a logo, then without it
\defbeamertemplate*{footline}{MWG}{%
    \ifbeamer@showlogo
        \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=.5ex,leftskip=10ex,rightskip=3ex]{footline}
            \usebeamerfont*{meta information}
            \insertshortinstitute
            \hfill {\usebeamerfont{frame number} \usebeamertemplate{frame numbering}}
        \end{beamercolorbox}
        \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.125ex,leftskip=10ex,rightskip=3ex]{footline}
            \usebeamerfont*{meta information}
            \insertshortauthor
            \ifx\beamer@shortauthor\@empty\else
                    \ifx\beamer@shorttitle\@empty\else
                            :
                    \fi
            \fi
            \insertshorttitle
            \hfill \ifx\insertshortdate\@empty\else \insertshortdate \fi
        \end{beamercolorbox}
        \ifbeamer@draft\else	% TODO: Logo
        \fi
    \else
        \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=.5ex,leftskip=3ex,rightskip=3ex]{footline}
            \usebeamerfont*{meta information}
            \insertshortinstitute
            \hfill {\usebeamerfont{frame number} \usebeamertemplate{frame numbering}}
        \end{beamercolorbox}
        \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.125ex,leftskip=3ex,rightskip=3ex]{footline}
            \usebeamerfont*{meta information}
            \insertshortauthor
            \ifx\beamer@shortauthor\@empty\else
                \ifx\beamer@shorttitle\@empty\else
                    :
                \fi
            \fi
            \insertshorttitle
            \hfill \ifx\insertshortdate\@empty\else \insertshortdate \fi
        \end{beamercolorbox}
    \fi
}

% Uses -- if the "smallfootline" option is passed to the theme, a small footline
\ifbeamer@smallfootline
    % TODO: Logo stuff
\else
    % TODO: Logo stuff
\fi

% Removes the logo from the right sidebar if it's ought to be shown in the footline
\ifbeamer@externallogo\else
    \defbeamertemplate*{sidebar right}{MWG}{%
        \vfill%
        \llap{\usebeamertemplate***{navigation symbols}\hskip0.1cm}%
        \vskip2pt%
    }
\fi




% FONT THEME PART -------------------------------------------------------------------------------------------------------------------------------

% Title frame
\setbeamerfont*{title}{size=\Large, series=\bfseries}
\setbeamerfont*{subtitle}{family=\sffamily}
\setbeamerfont*{author}{size=\small}
\setbeamerfont*{institute}{size=\small}
\setbeamerfont*{date}{size=\small}

% Frame title & subtitle
\setbeamerfont*{frametitle}{size=\Large, series=\bfseries, parent=structure}
\setbeamerfont*{framesubtitle}{size=\footnotesize}

% Footline
\setbeamerfont*{meta information}{}
\setbeamerfont*{frame number}{size=\tiny}

% Font styles for part pages
\setbeamerfont*{part name}{size=\LARGE, series=\bfseries}
\setbeamerfont*{part title}{size=\LARGE, series=\bfseries}

% Font styles for section pages
\setbeamerfont*{section name}{size=\Large}
\setbeamerfont*{section title}{size=\Large}

% Font styles for subsecion pages
\setbeamerfont*{subsection name}{size=\large, shape=\itshape}
\setbeamerfont*{subsection title}{size=\large, shape=\itshape}

% Font styles for table of contents
\setbeamerfont*{section number projected}{size=\small, parent={section in toc,projected text}}
\setbeamerfont*{section in toc}{parent=structure, size=\large}
\setbeamerfont*{section in toc shaded}{parent=section in toc}
\setbeamerfont*{subsection in toc}{size=\small}
\setbeamerfont*{subsection in toc shaded}{parent=subsection in toc}
\setbeamerfont*{subsubsection in toc}{size=\footnotesize}
\setbeamerfont*{subsubsection in toc shaded}{parent=subsubsection in toc}

\setbeamerfont*{section in head/foot}{size=\tiny}

% Caption styles
\setbeamerfont*{caption}{size=\small, shape=\itshape}
\setbeamerfont*{caption name}{size=\small, parent={structure}}

% Button styles
\setbeamerfont*{button}{size=\tiny}

% Block styles
\setbeamerfont*{block title}{size=\large, parent={structure,block body}}
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

% Uses -- unless deactivated -- small capitals for some font styles
\ifbeamer@smallcaps
	\setbeamerfont{title}{shape=\scshape}
	\setbeamerfont{meta information}{shape=\scshape}
	\setbeamerfont{frame number}{shape=\scshape}
	\setbeamerfont{caption name}{shape=\scshape}
	\setbeamerfont{block title}{shape=\scshape}
	\setbeamerfont{block title alerted}{shape=\scshape}
	\setbeamerfont{block title example}{shape=\scshape}
	\setbeamerfont{part name}{shape=\scshape}
	\setbeamerfont{part title}{shape=\scshape}
	\setbeamerfont{section name}{shape=\scshape}
	\setbeamerfont{section title}{shape=\scshape}
	\setbeamerfont{section in toc}{shape=\scshape}
\fi



% COLOR THEME PART ------------------------------------------------------------------------------------------------------------------------------

% Defines the colors of the MWG logo
\definecolor{MWGRed}{RGB}{100,29,27}
\definecolor{MWGGreen}{RGB}{166,214,35}
\definecolor{MWGGrey}{RGB}{80,80,80}
\definecolor{MWGLogo}{RGB}{255,255,255}

% Colors for basic text
\setbeamercolor{normal text}{fg=black,bg=white}
\setbeamercolor{alerted text}{fg=red}
\setbeamercolor{example text}{fg=green!50!black}

% Color for structure items
\setbeamercolor{structure}{fg=MWGRed}
\setbeamercolor{local structure}{parent=structure}

% Palette colors
\setbeamercolor*{palette primary}{fg=white,bg=MWGRed}
\setbeamercolor*{palette secondary}{fg=black,bg=MWGGreen}
\setbeamercolor*{palette tertiary}{fg=black,bg=MWGGrey}
\setbeamercolor*{palette quaternary}{fg=black,bg=white}

% Titleframe colors
\setbeamercolor*{title}{fg=black,bg=white}
\setbeamercolor*{author}{fg=black}
\setbeamercolor*{institute}{fg=black}
\setbeamercolor*{titlegraphic}{fg=black}

% Color for navigation
\setbeamercolor*{section in head/foot}{parent=palette primary}

% Footline colors
\setbeamercolor*{footline}{parent=palette primary}

% Colors for table of contents
\setbeamercolor*{section in toc}{parent=structure}
\setbeamercolor*{section in toc shaded}{parent=section in toc}
\setbeamercolor*{section number projected}{parent=item projected}
\setbeamercolor*{subsection in toc}{}
\setbeamercolor*{subsection in toc shaded}{parent=subsection in toc}
\setbeamercolor*{subsection number projected}{parent={subitem projected}}
\setbeamercolor*{subsubsection in toc}{parent=subsection in toc}
\setbeamercolor*{subsubsection in toc shaded}{parent=subsubsection in toc}
\setbeamercolor*{subsubsection number projected}{parent=subsubitem projected}

% Color for logo text
\setbeamercolor*{logo}{parent=palette secondary}

% Frame (sub-)title colors
\setbeamercolor*{frametitle}{fg=white,bg=MWGRed}
\setbeamercolor*{framesubtitle}{fg=white,bg=MWGRed}

% Footnote colors
\setbeamercolor*{footnote}{fg=MWGRed}
\setbeamercolor*{footnote mark}{fg=.}

% Caption colors
\setbeamercolor*{caption}{}
\setbeamercolor*{caption name}{fg=MWGRed}

% Button colors
\setbeamercolor*{button}{use=local structure,bg=local structure.fg!50!bg,fg=white}
\setbeamercolor*{button border}{use=button,fg=button.bg}

% Colors for navigation symbols
\setbeamercolor*{navigation symbols}{fg=MWGRed!40!bg}
\setbeamercolor*{navigation symbols dimmed}{fg=MWGRed!40!bg}

% Sets the colors for normal blocks
\setbeamercolor*{block title}{parent=palette primary}
\setbeamercolor*{block body}{parent=normal text,use=block title,bg=block title.bg!20!bg}

% Sets the colors for alert blocks
\setbeamercolor*{block title alerted}{use=alerted text,fg=white,bg=alerted text.fg!85!black!80!white}
\setbeamercolor*{block body alerted}{parent=normal text,use=block title alerted,bg=block title alerted.bg!20!bg}

% Sets the colors for example blocks
\setbeamercolor*{block title example}{parent=palette secondary}
\setbeamercolor*{block body example}{parent=normal text,use=block title example,bg=block title example.bg!20!bg}

% Colors for items
\setbeamercolor*{item}{parent=local structure}
\setbeamercolor*{item projected}{parent=item,use=item,fg=white,bg=item.fg}
\setbeamercolor*{enumerate item}{parent=item}
\setbeamercolor*{itemize item}{parent=item}
\setbeamercolor*{itemize/enumerate body}{}

% Colors for subitems
\setbeamercolor*{subitem}{parent=item}
\setbeamercolor*{subitem projected}{parent=item projected}
\setbeamercolor*{enumerate subitem}{parent=subitem}
\setbeamercolor*{itemize subitem}{parent=subitem}
\setbeamercolor*{itemize/enumerate subbody}{}

% Colors for subsubitems
\setbeamercolor*{subsubitem}{parent=subitem}
\setbeamercolor*{subsubitem projected}{parent=subitem projected}
\setbeamercolor*{enumerate subsubitem}{parent=subsubitem}
\setbeamercolor*{itemize subsubitem}{parent=subsubitem}
\setbeamercolor*{itemize/enumerate subsubbody}{}

% Color for description items
\setbeamercolor*{description item}{parent=item}

% Colors for bibliography
\setbeamercolor*{bibliography item}{parent=item}
\setbeamercolor*{bibliography entry author}{fg=MWGRed}
\setbeamercolor*{bibliography entry title}{use=normal text}
\setbeamercolor*{bibliography entry location}{fg=MWGRed!65!bg}
\setbeamercolor*{bibliography entry note}{fg=MWGRed!65!bg}

% Color of seperation line
\setbeamercolor*{separation line}{fg=MWGRed}

% Color for abstract environment
\setbeamercolor*{abstract}{}
\setbeamercolor*{abstract title}{parent=MWGRed}

% Color for verse environment
\setbeamercolor*{verse}{}

% Color for quotation environment
\setbeamercolor*{quotation}{}
\setbeamercolor*{quote}{parent=quotation}

% Color for the qed symbol
\setbeamercolor*{qed symbol}{fg=MWGRed}



% IDIOT-SAFE COMMANDS FOR INSERTING STRUCTURE FRAMES --------------------------------------------------------------------------------------------

% Redefines \maketitle to being idiot safe ... >:)
\renewcommand{\maketitle}{%
	\ifbeamer@inframe
		\titlepage
	\else
		% If \maketitle is used outside a frame the frame number will not be shown on the title frame
		\setbeamertemplate{frame numbering}[none]
		\frame{\titlepage}
		\setbeamertemplate{frame numbering}[fraction]
	\fi
}

% Defines a idiot safe \partframe command
\newcommand{\partframe}{
	\ifbeamer@inframe
		\partpage
	\else
		% Inserts the part frame
		\frame{\partpage}
		\addtocounter{framenumber}{-1}
	\fi
}

% Defines a idiot safe \sectionframe command
\newcommand{\sectionframe}{
	\ifbeamer@inframe
		\sectionpage
	\else
		% Inserts the section frame
		\frame{\sectionpage}
		\addtocounter{framenumber}{-1}
	\fi
}

% Defines a idiot safe \subsectionframe command
\newcommand{\subsectionframe}{
	\ifbeamer@inframe
		\subsectionpage
	\else
		% Inserts the subsection frame
		\frame{\subsectionpage}
		\addtocounter{framenumber}{-1}
	\fi
}



% COMMANDS FOR CHANGING THE THEME'S SETTINGS AND BEHAVIOUR --------------------------------------------------------------------------------------

% Activates / deactivates automatical inserting of part frames
\newcommand{\activatepartframes}{\AtBeginPart{\partframe}}
\newcommand{\deactivatepartframes}{\AtBeginPart{}}

% Activates / deactivates automatical inserting of section frames
\newcommand{\activatesectionframes}{\AtBeginSection{\sectionframe}}
\newcommand{\deactivatesectionframes}{\AtBeginSection{}}

% Activates / deactivates automatical inserting of subsection frames
\newcommand{\activatesubsectionframes}{\AtBeginSubsection{\subsectionframe}}
\newcommand{\deactivatesubsectionframes}{\AtBeginSubsection{}}






% END OF FILE -----------------------------------------------------------------------------------------------------------------------------------

\mode<all>
\endinput