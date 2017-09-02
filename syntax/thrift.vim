if exists("b:current_syntax")
    finish
endif

" Todo.
syn keyword thriftTodo TODO todo FIXME fixme XXX xxx contained

" Comments.
syn match thriftComment "#.*" contains=thriftTodo,@Spell
syn region thriftComment start="/\*" end="\*/" contains=thriftTodo,@Spell
syn match thriftComment "//.\{-}\(?>\|$\)\@="

" String.
syn region thriftStringDouble matchgroup=None start=+"+  end=+"+

" Number.
syn match thriftNumber "-\=\<\d\+\>" contained
syn match thriftNumber "\d\+:"

" Keywords.
syn keyword thriftBasicTypes i16 i32 i64 double
syn keyword thriftBasicTypes void bool byte string binary
syn keyword thriftClass union struct exception enum
syn keyword thriftInclude include
syn keyword thriftKeyword cpp_include cpp_type const optional required
syn keyword thriftKeyword xsd_all xsd_optional xsd_nillable xsd_attrs
syn keyword thriftStatement namespace
syn keyword thriftStatement throws typedef
syn keyword thriftType map list set
syn region thriftString start=+"+ end=+"+

" Structure.
syn keyword thriftStructure service oneway extends

command! -nargs=+ HiLink hi def link <args>

HiLink   thriftComment      Comment
HiLink   thriftKeyword      Special
HiLink   thriftBasicTypes   Type
HiLink   thriftType         Type
HiLink   thriftStructure    StorageClass
HiLink   thriftTodo         Todo
HiLink   thriftString       String
HiLink   thriftNumber       Number
HiLink   thriftSpecial      Special
HiLink   thriftStructure    Structure
HiLink   thriftStatement    Statement
HiLink   thriftInclude      Include
HiLink   thriftClass        Type
HiLink   thriftString       String

delcommand HiLink

let b:current_syntax = "thrift"
