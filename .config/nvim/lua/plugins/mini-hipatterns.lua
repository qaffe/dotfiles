return {
	{
		"echasnovski/mini.hipatterns",
		dependencies = {
		},
		opts = function()
			return {
				highlighters = {
					hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack  = { pattern = "%f[%w]()HACK()%f[%W]",  group = "MiniHipatternsHack"  },
					todo  = { pattern = "%f[%w]()TODO()%f[%W]",  group = "MiniHipatternsTodo"  },
					note  = { pattern = "%f[%w]()NOTE()%f[%W]",  group = "MiniHipatternsNote"  },
				},
			}
		end,
	}
}
