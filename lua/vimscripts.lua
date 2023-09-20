-- To call a function from this file at runtime, enter following command
-- :lua require"vimscripts".some_function()

local function compdb_formatter()
    vim.cmd([[
        function! FormatCompdb()
            execute "%s-\"command\": \"-\"arguments\": [ -g"
            execute "normal! gg"

            " go to first instance
            let l:previousLine = 0
            execute "/\"arguments\": [ "
            let l:currentLine = line('.')

            while l:currentLine > l:previousLine
                execute "normal! A\<BS>\<BS> ],\<ESC>0"
                execute "normal! WWW"
                " while the character under cursor does not match ']'
                while matchstr(getline('.'), '\%' . col('.') . 'c.') != "]"
                    execute "normal! i\"\<ESC>Ea\",\<ESC>"
                    execute "normal! W"
                endwhile
                execute "normal! bex"

                " go to next instance
                let l:previousLine = l:currentLine
                execute "/\"arguments\": [ "
                let l:currentLine = line('.')
            endwhile
        endfunction
    ]])

    vim.cmd('call FormatCompdb()')
end

return {
    compdb_formatter = compdb_formatter
}

