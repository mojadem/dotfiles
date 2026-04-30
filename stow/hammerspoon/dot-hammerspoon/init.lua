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

hs.hotkey.bind({ "cmd", "shift" }, "6", function()
	hs.task
		.new("/opt/homebrew/bin/ocr", function(exitCode, stdOut, stdErr)
			if exitCode ~= 0 then
				return
			end
			hs.task.new("pbcopy", nil, { stdOut }):start()
		end, {})
		:start()
end)
