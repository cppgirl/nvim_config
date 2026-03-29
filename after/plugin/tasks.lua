local Path = require('plenary.path')

local function getOS()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh, _ = assert(io.popen("uname -o 2>/dev/null","r"))
    local osname
    if fh then
        osname = fh:read()
    end

	return osname or "Windows"
end

local getKit = function ()
    if getOS() == 'Windows' then
        return 'mingw'
    else
        return 'default'
    end
end

require('tasks').setup({
    default_params = {
      cmake = {
        cmd = 'cmake',
        build_type = 'Debug',
        build_kit = getKit(),
        dap_name = 'codelldb',
        build_dir = tostring(Path:new('{cwd}', 'build')),
        cmake_kits_file = vim.fn.stdpath("config") .. "/after/plugin/configs/buildTypes.json",
        cmake_build_types_file = nil,
        clangd_cmdline = {
          'clangd',
          '--background-index',
          '--clang-tidy',
          '--header-insertion=never',
          '--completion-style=detailed',
          '--offset-encoding=utf-8',
          '-j=4',
        },
        ignore_presets = false,
        restart_clangd_after_configure = true,
      },
      make = {
        cmd = 'make',
        args = {
          all = { '-j10', 'all' },
          build = {},
          nuke = { 'clean' },
        },
      },
    },
    save_before_run = true,
    params_file = 'neovim.json',
    quickfix = {
      pos = 'botright',
      height = 12,
      only_on_error = false,
    },
    dap_open_command = function() return require('dap').repl.open() end,
})

local opts = { silent = true }

local function setup(x)
    vim.keymap.set('n', '<leader>tkC', ':Task start '..x..' configure<cr>', opts)
    vim.keymap.set('n', '<leader>tkD', ':Task start '..x..' configureDebug<cr>', opts)
    vim.keymap.set('n', '<leader>tkb', ':Task start '..x..' build<cr>', opts)
    vim.keymap.set('n', '<leader>tkB', ':Task start '..x..' build_all<cr>', opts)
    vim.keymap.set('n', '<leader>tkr', ':Task start '..x..' run<cr>', opts)
    vim.keymap.set('n', '<leader>tkR', ':Task start '..x..' run ', opts)
    vim.keymap.set('n', '<leader>tkK', ':Task start '..x..' clean<cr>', opts)
    vim.keymap.set('n', '<leader>tkT', ':Task start '..x..' ctest --test-dir test --output-on-failure<cr>', opts)
    vim.keymap.set('n', '<leader>tkp', ':Task start '..x..' purge<cr>', opts)
    vim.keymap.set('n', '<leader>tkP', ':Task start '..x..' reconfigure<cr>', opts)

    vim.keymap.set('n', '<leader>tkt', ':Task set_module_param '..x..' target<cr>', opts)

    vim.keymap.set('n', '<C-c>', ':Task cancel<cr>', opts)
    vim.keymap.set('n', '<F7>', ':Task start '..x..' debug<cr>', opts)
end

setup('cmake')

vim.keymap.set('n', '<leader>mc', ':make clean<cr>', opts)
vim.keymap.set('n', '<leader>ma', ':make all<cr>', opts)
vim.keymap.set('n', '<leader>mr', ':make run<cr>', opts)
