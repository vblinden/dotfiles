vim.filetype.add({
	extension = {
		env = "conf",
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
