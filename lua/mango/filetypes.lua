vim.filetype.add({
    extension = {
        asm = 'nasm', -- simple fix for nasm
    },
    filename = {
        [".bashrc.user"] = "bash",
    }
})

vim.lsp.enable('hls')
