" log.vim: logging library
" Last Change: 2008-08-05
" Maintainer: Yukihiro Nakadaira <yukihiro.nakadaira@gmail.com>
" License: This file is placed in the public domain.
"
" Installation:
"   Put this file in autoload directory in your 'runtimepath'.
"
" Usage:
"   " in .vimrc
"   call log#init('ALL', ['/dev/stdout', '~/.vim/log.txt'])
"
"   " in script
"   let s:log = log#getLogger(expand('<sfile>:t'))
"
"   function s:func()
"     call s:log.trace('start of func()')
"     if s:log.isDebugEnabled()
"       call s:log.debug('debug information')
"     endif
"     call s:log.trace('end of func()')
"   endfunction
"
"   " If you want to distribute your script without log.vim, use :silent! or
"   " exists().
"   silent! let s:log = log#getLogger(expand('<sfile>:t'))
"   function s:func()
"     silent! call s:log.info('aaa')
"     if exists('s:log')
"       call s:log.info('bbb')
"     endif
"   endfunction
"
" Reference:
"
"   function log#init(level, targets [, format [, filter]])
"   @param level [String]
"     Log level.  One of 'ALL|TRACE|DEBUG|INFO|WARN|ERROR|FATAL|NONE'.
"     For example, when level is 'WARN', output of log.warn(), log.error() and
"     log.fatal() will appear in log.
"   @param targets [mixed]
"     Output target.  Filename or Function or Dictionary or List of these
"     values.
"     Filename:
"       Log is appended to the file.
"     Function:
"       function Log(str)
"         echo a:str
"       endfunction
"     Dictionary:
"       let Log = {}
"       function Log.__call__(str)
"         echohl Error
"         echo a:str
"         echohl None
"       endfunction
"   @param format [String]
"     Log format.  {expr} is replaced by eval(expr).  For example, {getpid()}
"     is useful to detect session.  Following special variables are available.
"     {level}   log level like DEBUG, INFO, etc...
"     {name}    log name specified by log#getLogger(name)
"     {msg}     log message
"     If this is 0, '', [] or {} (empty(format) is true), default is used.
"     default:  [{level}][{strftime("%Y-%m-%d %H:%M:%S")}][{name}] {msg}
"   @param filter [mixed]
"     Pattern (String) or Function or Dictionary to filter log session.
"     Filter is applied to name that specified by log#getLogger(name).  If
"     result is false, logging session do not output any text.
"     Pattern (String):
"       name =~ Pattern
"     Function:
"       function Filter(name)
"         return a:name == 'mylib'
"       endfunction
"     Dictionary:
"       let Filter = {}
"       let Filter.filter = ['alib', 'blib', 'clib']
"       function Filter.__call__(name)
"         return index(self.filter, a:name) != -1
"       endfunction
"   @return void
"
"   function log#getLogger(name)
"   @param name [String] Log name
"   @return Logger object

function log#import()
  return s:lib
endfunction

function log#init(...)
  call call(s:lib.init, a:000, s:lib)
endfunction

function log#getLogger(name)
  return s:lib.Logger.new(a:name)
endfunction

let s:lib = {}

let s:lib.ALL = 0
let s:lib.TRACE = 1
let s:lib.DEBUG = 2
let s:lib.INFO = 3
let s:lib.WARN = 4
let s:lib.ERROR = 5
let s:lib.FATAL = 6
let s:lib.NONE = 999999

let s:lib.config = {}
let s:lib.config.level = s:lib.NONE
let s:lib.config.format = ''
let s:lib.config.filter = ''
let s:lib.config.targets = []

function s:lib.init(level, targets, ...)
  let tmp = {}    " for E704
  let format = get(a:000, 0, '')
  let tmp.filter = get(a:000, 1, '')
  if empty(format)
    let format = '[{level}][{strftime("%Y-%m-%d %H:%M:%S")}][{name}] {msg}'
  endif
  if empty(tmp.filter)
    let tmp.filter = ''
  endif
  let self.config.level = self[toupper(a:level)]
  let self.config.targets = []
  let self.config.format = format
  for tmp.target in (type(a:targets) == type([])) ? a:targets : [a:targets]
    if type(tmp.target) == type("")
      call add(self.config.targets, self.FileAppender.new(tmp.target))
    elseif type(tmp.target) == type(function("tr"))
      call add(self.config.targets, self.FuncAppender.new(tmp.target))
    elseif type(tmp.target) == type({})
      if !self.is_callable(tmp.target)
        throw "log#init(): target object must have __call__(str) method"
      endif
      call add(self.config.targets, tmp.target)
    else
      throw "log#init(): not supported target object"
    endif
    unlet tmp.target   " for E706
  endfor
  if type(tmp.filter) == type("")
    let self.config.filter = self.PatternFilter.new(tmp.filter)
  elseif type(tmp.filter) == type(function("tr"))
    let self.config.filter = self.FuncFilter.new(tmp.filter)
  elseif type(tmp.filter) == type({})
    if !self.is_callable(tmp.filter)
      throw "log#init(): filter object must have __call__(name) method"
    endif
    let self.config.filter = tmp.filter
  else
    throw "log#init(): not supported filter object"
  endif
endfunction

function s:lib.is_callable(d)
  return type(a:d) == type({})
        \ && has_key(a:d, '__call__')
        \ && type(a:d.__call__) == type(function('tr'))
endfunction


let s:lib.Logger = {}

let s:lib.Logger.level = s:lib.NONE
let s:lib.Logger.name = ''

function s:lib.Logger.new(name)
  let res = copy(self)
  let res.name = a:name
  if s:lib.config.filter.__call__(a:name)
    let res.level = s:lib.config.level
  endif
  return res
endfunction

function s:lib.Logger.log(level, args)
  let level = a:level
  let name = self.name
  let msg = (len(a:args) == 1) ? a:args[0] : call('printf', a:args)
  " sub-replace-\= does not work recursively.
  "let str = substitute(s:lib.config.format, '{\([^}]\+\)}', '\=eval(submatch(1))', 'g')
  let str = ''
  let m = s:lib.Matcher.new(s:lib.config.format, '{\([^}]\+\)}')
  while m.find()
    let str .= m.head() . eval(m[1])
  endwhile
  let str .= m.tail()
  for t in s:lib.config.targets
    call t.__call__(str)
  endfor
endfunction

function s:lib.Logger.trace(...)
  if self.isTraceEnabled()
    call self.log('TRACE', a:000)
  endif
endfunction

function s:lib.Logger.debug(...)
  if self.isDebugEnabled()
    call self.log('DEBUG', a:000)
  endif
endfunction

function s:lib.Logger.info(...)
  if self.isInfoEnabled()
    call self.log('INFO', a:000)
  endif
endfunction

function s:lib.Logger.warn(...)
  if self.isWarnEnabled()
    call self.log('WARN', a:000)
  endif
endfunction

function s:lib.Logger.error(...)
  if self.isErrorEnabled()
    call self.log('ERROR', a:000)
  endif
endfunction

function s:lib.Logger.fatal(...)
  if self.isFatalEnabled()
    call self.log('FATAL', a:000)
  endif
endfunction

function s:lib.Logger.isTraceEnabled()
  return self.level <= s:lib.TRACE
endfunction

function s:lib.Logger.isDebugEnabled()
  return self.level <= s:lib.DEBUG
endfunction

function s:lib.Logger.isInfoEnabled()
  return self.level <= s:lib.INFO
endfunction

function s:lib.Logger.isWarnEnabled()
  return self.level <= s:lib.WARN
endfunction

function s:lib.Logger.isErrorEnabled()
  return self.level <= s:lib.ERROR
endfunction

function s:lib.Logger.isFatalEnabled()
  return self.level <= s:lib.FATAL
endfunction


let s:lib.FileAppender = {}

function s:lib.FileAppender.new(filename)
  let res = copy(self)
  let res.filename = a:filename
  return res
endfunction

function s:lib.FileAppender.__call__(str)
  execute printf('redir >> %s', self.filename)
  silent echo a:str
  redir END
endfunction


let s:lib.FuncAppender = {}

function s:lib.FuncAppender.new(log)
  let res = copy(self)
  let res.__call__ = a:log
  return res
endfunction


let s:lib.PatternFilter = {}

function s:lib.PatternFilter.new(pattern)
  let res = copy(self)
  let res.pattern = a:pattern
  return res
endfunction

function s:lib.PatternFilter.__call__(name)
  return a:name =~ self.pattern
endfunction


let s:lib.FuncFilter = {}

function s:lib.FuncFilter.new(filter)
  let res = copy(self)
  let res.__call__ = a:filter
  return res
endfunction


let s:lib.Matcher = {}

function s:lib.Matcher.new(expr, pat)
  let res = copy(self)
  let res.expr = a:expr
  let res.pat = a:pat
  let res.submatch = []
  let res.last = 0
  let res.start = 0
  return res
endfunction

function s:lib.Matcher.find()
  if self.start == -1
    return 0
  endif
  if self.submatch != []
    let self.last = matchend(self.expr, self.pat, self.start)
  endif
  let self.start = match(self.expr, self.pat, self.last)
  if self.start == -1
    return 0
  endif
  let self.submatch = matchlist(self.expr, self.pat, self.start)
  for i in range(len(self.submatch))
    let self[i] = self.submatch[i]
  endfor
  return 1
endfunction

function s:lib.Matcher.head()
  return strpart(self.expr, self.last, self.start - self.last)
endfunction

function s:lib.Matcher.tail()
  if self.start != -1
    return strpart(self.expr, matchend(self.expr, self.pat, self.start))
  endif
  return strpart(self.expr, self.last)
endfunction

