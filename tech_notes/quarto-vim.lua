-- 2023-04-22
-- Install plugin to identify quarto files and allow syntax highlighting
--
return {
	"quarto-dev/quarto-vim",
	requires = {
		{ "vim-pandoc/vim-pandoc-syntax" },
	},
	ft = { "quarto" },
}
