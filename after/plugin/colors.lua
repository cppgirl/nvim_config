function ColorMyPencils(colorstr, color)
	color = color or colorstr
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

--ColorMyPencils("rose-pine")
ColorMyPencils("github_dark_high_contrast")
