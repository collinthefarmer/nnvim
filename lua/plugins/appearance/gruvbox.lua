return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	opts = {
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		overrides = {
			SignColumn = { link = "GruvboxBg0" },
			GruvboxRedSign = { link = "GruvboxRed" },
			GruvboxGreenSign = { link = "GruvboxGreen" },
			GruvboxYellowSign = { link = "GruvboxYellow" },
			GruvboxBlueSign = { link = "GruvboxBlue" },
			GruvboxPurpleSign = { link = "GruvboxPurple" },
			GruvboxAquaSign = { link = "GruvboxAqua" },
			GruvboxOrangeSign = { link = "GruvboxOrange" },
		},
		inverse = true,
		contrast = "soft",
		transparent_mode = true,
	},
}
