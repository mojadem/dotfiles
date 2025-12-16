hs.alert.show("Hammerspoon config loaded")

hs.pathwatcher
	.new(os.getenv("HOME") .. "/.hammerspoon/", function()
		hs.reload()
	end)
	:start()
