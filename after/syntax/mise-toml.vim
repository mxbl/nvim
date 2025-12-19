"runtime! syntax/toml.vim
"syntax case match

syn match tomlDotInKey /\v[^.]+\zs\./ contained display
syn match tomlKey /\v(^|[{,])\s*\zs[[:alnum:]._-]+\ze\s*\=/ contains=tomlDotInKey display
syn region tomlKeyDq oneline start=/\v(^|[{,])\s*\zs"/ end=/"\ze\s*=/

syn region tomlTable oneline start=/^\s*\[[^\[]/ end=/\]/ contains=tomlKey,tomlDotInKey,tomlKeyDq

syn region tomlArray start=/\[/ end=/\]/ contains=@tomlValue

syn cluster tomlValue contains=tomlArray,tomlString

"Strings
syn region tomlString oneline start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=miseBlock
syn region tomlString oneline start=/'/ end=/'/ contains=miseBlock

syn keyword miseStatement containedin=miseBlock contained env vars exec
syn keyword miseTaskProperty run description

syn region miseBlock matchgroup=miseDelim start=/{{-\?/ end=/-\?}}/

syn keyword miseTodo TODO FIXME contained containedin=miseComment
syn match miseComment /#.*/ contains=@Spell,miseTodo

hi def link miseComment Comment
hi def link tomlString String
hi def link miseBlock PreProc
hi def link miseTodo Todo
hi def link miseStatement Special
hi def link tomlKey Identifier
hi def link tomlKeyDq Identifier
hi def link tomlTable Title
hi def link miseTaskProperty @property

