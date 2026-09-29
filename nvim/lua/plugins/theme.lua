-- Follow the OS appearance: GrokNight when dark, GrokDay when light.
-- Set GROK_APPEARANCE=dark or GROK_APPEARANCE=light to pin a mode.

local function scheme_for(mode)
	return mode == "light" and "grokday" or "groknight"
end

local function from_output(kind, obj)
	local out = obj.stdout or ""
	if kind == "mac" then
		if obj.code == 0 and out:find("Dark") then
			return "dark"
		end
		return "light"
	end
	if out:find("prefer%-dark") then
		return "dark"
	end
	if out:find("prefer%-light") then
		return "light"
	end
	return nil
end

local function detect_kind()
	if vim.env.GROK_APPEARANCE == "dark" or vim.env.GROK_APPEARANCE == "light" then
		return "env"
	end
	if vim.fn.has("mac") == 1 then
		return "mac"
	end
	if vim.fn.executable("gsettings") == 1 then
		return "gnome"
	end
	return nil
end

local function detect_sync()
	local kind = detect_kind()
	if kind == "env" then
		return vim.env.GROK_APPEARANCE
	end
	if kind == "mac" then
		local result = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()
		return from_output("mac", result)
	end
	if kind == "gnome" then
		local result = vim.system(
			{ "gsettings", "get", "org.gnome.desktop.interface", "color-scheme" },
			{ text = true }
		):wait()
		local mode = from_output("gnome", result)
		if mode then
			return mode
		end
		local gtk = vim.system({ "gsettings", "get", "org.gnome.desktop.interface", "gtk-theme" }, { text = true })
			:wait()
		if (gtk.stdout or ""):lower():find("dark") then
			return "dark"
		end
		return "light"
	end
	return "dark"
end

local function apply(mode)
	local name = scheme_for(mode)
	if vim.g.colors_name == name and vim.o.background == mode then
		return
	end
	vim.g.grok_appearance = mode
	vim.cmd.colorscheme(name)
end

local function watch()
	if vim.g.grok_appearance_watch then
		return
	end
	vim.g.grok_appearance_watch = true

	local pending = false
	local function check()
		if pending then
			return
		end
		local kind = detect_kind()
		if kind == "env" then
			apply(vim.env.GROK_APPEARANCE)
			return
		end
		if kind ~= "mac" and kind ~= "gnome" then
			return
		end
		pending = true
		local cmd = kind == "mac" and { "defaults", "read", "-g", "AppleInterfaceStyle" }
			or { "gsettings", "get", "org.gnome.desktop.interface", "color-scheme" }
		vim.system(cmd, { text = true }, function(obj)
			local mode = from_output(kind, obj)
			pending = false
			if not mode then
				return
			end
			vim.schedule(function()
				apply(mode)
			end)
		end)
	end

	local timer = vim.uv.new_timer()
	timer:start(2000, 2000, vim.schedule_wrap(check))
	vim.api.nvim_create_autocmd("FocusGained", {
		group = vim.api.nvim_create_augroup("GrokAppearance", { clear = true }),
		callback = check,
	})
end

return {
	name = "groknight",
	dir = vim.fn.stdpath("config"),
	lazy = false,
	priority = 1000,
	config = function()
		apply(detect_sync())
		watch()
	end,
}
