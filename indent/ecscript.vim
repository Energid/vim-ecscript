" Vim indent file
" Language:	      EcScript
" Maintainer:	      Peter Lustig <peter.lustig@energid.com>
" Version:            1.2
" Project Repository: https://github.com/Energid/vim-ecscript


" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nosmartindent

" Now, set up our indentation expression and keys that trigger it.
setlocal indentexpr=GetEcScriptIndent()
setlocal indentkeys=0(,0),o,O

" Only define the function once.
if exists("*GetEcScriptIndent")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


" Check if the character at lnum:col is inside a comment.
function s:IsInComment(lnum, col)
  return synIDattr(synID(a:lnum, a:col, 1), 'name') == 'ecsComment'
endfunction

" Check if line 'lnum' has more opening parentheses than closing ones.
function s:LineHasOpeningParen(lnum)
  let open_count = 0
  let line = getline(a:lnum)
  let pos = match(line, '[()]', 0)
  while pos != -1
    let idx = stridx('()', line[pos])
    if idx == 0
      let open_count += 1
    else
      let open_count -= 1
    endif
    let pos = match(line, '[()]', pos + 1)
  endwhile
  return (open_count > 0)
endfunction


function GetEcScriptIndent()
  " Set up variables for restoring position in file.  Could use v:lnum here.
  let vcol = col('.')

  " Work on the current line
  " -------------------------

  " Get the current line.
  let line = getline(v:lnum)
  let ind = -1

  " If we got a closing parenthesis on an empty line, find its match and indent
  " according to it.
  let col = matchend(line, '^\s*)')

  if col > 0 && !s:IsInComment(v:lnum, col)
    call cursor(v:lnum, col)
    let pairline = searchpair('(', '', ')', 'bW')

    if pairline > 0 
      let ind = indent(pairline)
    else
      let ind = virtcol('.') - 1
    endif

    return ind
  endif

  " Work on the previous line.
  " --------------------------

  let lnum = prevnonblank(v:lnum - 1)

  if lnum == 0
    return 0
  endif

  " Set up variables for current line.
  let line = getline(lnum)
  let ind = indent(lnum)

  " If the previous line contained an opening parenthesis, and we are still in it,
  let col = match(line, '(')
  if col >= 0 && !s:IsInComment(lnum, col)
    if s:LineHasOpeningParen(lnum)
      return ind + &sw
    else
      call cursor(v:lnum, vcol)
    end
  endif

  return ind
endfunction


let &cpo = s:cpo_save
unlet s:cpo_save
