import {
	getSupportedThinkingLevels,
	type ThinkingLevel,
} from "@earendil-works/pi-ai";
import type {
	ExtensionAPI,
	ExtensionCommandContext,
} from "@earendil-works/pi-coding-agent";
import { DynamicBorder } from "@earendil-works/pi-coding-agent";
import {
	Container,
	getKeybindings,
	Input,
	type SelectItem,
	SelectList,
	Text,
} from "@earendil-works/pi-tui";

export default function (pi: ExtensionAPI) {
	async function pickThinkingLevel(ctx: ExtensionCommandContext) {
		const model = ctx.model;
		if (!model?.reasoning) {
			ctx.ui.notify("Current model doesn't support thinking", "info");
			return;
		}

		const levels = getSupportedThinkingLevels(model);
		const current = pi.getThinkingLevel();
		const items: SelectItem[] = levels.map((level) => ({
			value: level,
			label: level,
		}));

		const result = await ctx.ui.custom<ThinkingLevel | null>(
			(tui, theme, _kb, done) => {
				const container = new Container();
				container.addChild(new DynamicBorder((s) => theme.fg("accent", s)));
				container.addChild(
					new Text(theme.fg("accent", theme.bold("Thinking Level")), 1, 0),
				);

				const selectList = new SelectList(items, Math.min(items.length, 10), {
					selectedPrefix: (t) => theme.fg("accent", t),
					selectedText: (t) => theme.fg("accent", t),
					description: (t) => theme.fg("muted", t),
					scrollInfo: (t) => theme.fg("dim", t),
					noMatch: (t) => theme.fg("warning", t),
				});
				selectList.onSelect = (item) => done(item.value as ThinkingLevel);
				selectList.onCancel = () => done(null);
				const currentIndex = items.findIndex((i) => i.value === current);
				if (currentIndex !== -1) selectList.setSelectedIndex(currentIndex);

				const input = new Input();
				container.addChild(input);
				container.addChild(selectList);
				container.addChild(new DynamicBorder((s) => theme.fg("accent", s)));

				return {
					render: (w) => container.render(w),
					invalidate: () => container.invalidate(),
					handleInput: (data) => {
						const kb = getKeybindings();
						if (
							kb.matches(data, "tui.select.up") ||
							kb.matches(data, "tui.select.down") ||
							kb.matches(data, "tui.select.confirm") ||
							kb.matches(data, "tui.select.cancel")
						) {
							selectList.handleInput(data);
						} else {
							input.handleInput(data);
							selectList.setFilter(input.getValue());
						}
						tui.requestRender();
					},
				};
			},
		);

		if (result) pi.setThinkingLevel(result);
	}

	pi.registerCommand("thinking", {
		description: "Pick thinking level",
		handler: (_args, ctx) => pickThinkingLevel(ctx),
	});

	pi.registerShortcut("alt+t", {
		description: "Pick thinking level",
		handler: (ctx) => pickThinkingLevel(ctx),
	});
}
