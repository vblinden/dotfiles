vim.filetype.add({
	extension = {
		env = "conf",
		templ = "templ",
	},
	filename = {
		[".env"] = "conf",
		["env"] = "conf",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "conf",
	},
})

return {}
