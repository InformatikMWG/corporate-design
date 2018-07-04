% \iffalse
% (c) 2018 Sebastian Friedl <sfr682k@t-online.de>
% This class is currently under construction and will be finished soon.
%
% This work currently consisting of the file InformatikMWGArticle.cls
% is subject to the LaTeX Project Public License, Version 1.3c or - at your option - any later version.
%
% The work has the LPPL status 'maintained'
% Current maintainer of the work is Sebastian Friedl
% \fi


\PassOptionsToPackage{10pt, DIV=11}{scrartcl}


\LoadClass{scrartcl}


\RequirePackage{iftex}

\newif\if@informatikmwgarticle@xeorluatex
\@informatikmwgarticle@xeorluatexfalse
\ifXeTeX\@informatikmwgarticle@xeorluatextrue\fi
\ifLuaTeX\@informatikmwgarticle@xeorluatextrue\fi

\typeout{}
\if@informatikmwgarticle@xeorluatex\typeout{Xe- or LuaLaTeX detected}
\else\typeout{Classical (pdf)LaTeX detected}
\fi
\typeout{}


\if@informatikmwgarticle@xeorluatex\PassOptionsToPackage{unicode}{hyperref}\fi
\PassOptionsToPackage{pdfborder={0 0 0}}{hyperref}


\RequirePackage{environ}


\RequirePackage{xcolor}
\definecolor{MWGRed}{RGB}{100,29,27}



\AtBeginDocument{%
    \RequirePackage{hyperref}%
    \RequirePackage{bookmark}%
}





% \subsection*{Load the Fira fonts}
% The way the fonts are loaded depends on the used engine.
%    \begin{macrocode}
\if@informatikmwgarticle@xeorluatex
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
    \def\setmainfont#1{\ClassWarning{InformatikMWGArticle}%
        {\noexpand\setmainfont command ignored. Stick to our corporate design!}}
    \def\setsansfont#1{\ClassWarning{InformatikMWGArticle}%
        {\noexpand\setsansfont command ignored. Stick to our corporate design!}}
    \def\setmonofont#1{\ClassWarning{InformatikMWGArticle}%
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


\parindent0pt

\def\and{\unskip,~}

\def\maketitle{%
    \clearpage\leavevmode%
    \vskip 1\bigskipamount
    {\color{MWGRed}\rule{\textwidth}{2.5pt}}
    \begin{center}
        {\color{MWGRed}\bfseries\LARGE\@title} \par\medskip
        {\color{MWGRed}\bfseries\Large\@subtitle} \par\bigskip
        {\large\@author} \par\smallskip
        {\large\@date}
    \end{center}
    {\color{MWGRed}\rule{\textwidth}{2.5pt}}\leavevmode%
    \vskip 2.5\bigskipamount}




\let\abstract\@undefined
\let\endabstract\@undefined


\NewEnviron{abstract}{%
    \begin{quotation}\small\noindent\hfuzz=18pt%
        \textbf{\normalsize\scshape\color{MWGRed}Abstract}\par\smallskip\noindent%
        \colorbox{MWGRed}{\hfuzz=0pt%
            \colorbox{white}{\parbox{\linewidth}{\hfuzz=0pt%
                \BODY%
            }}%
        }%
    \end{quotation}%
    \vskip 3\bigskipamount}