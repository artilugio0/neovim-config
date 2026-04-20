local grepprg = "rg --vimgrep -uu"
grepprg = grepprg .. " -g '!node_modules/*'"
grepprg = grepprg .. " -g '!*/node_modules/*'"
grepprg = grepprg .. " -g '!.next/*'"
grepprg = grepprg .. " -g '!package-lock.json'"
grepprg = grepprg .. " -g '!.git/*'"
grepprg = grepprg .. " -g '!build/*'"
grepprg = grepprg .. " -g '!coverage/*'"
grepprg = grepprg .. " -g '!.terraform/*'"
grepprg = grepprg .. " -g '!*/.terraform/*'"

vim.o.grepprg = grepprg
