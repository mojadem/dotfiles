hs.alert.show("Hammerspoon config loaded")

hs.pathwatcher
	.new(os.getenv("HOME") .. "/.hammerspoon/", function()
		hs.reload()
	end)
	:start()

transcribe_path = os.getenv("HOME") .. "/.config/scripts/transcribe.fish"
hs.hotkey.bind({ "cmd", "ctrl" }, "w", function()
	hs.task.new("/opt/homebrew/bin/fish", nil, { transcribe_path }):start()
end)
