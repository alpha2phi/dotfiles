local iron = require("iron")

iron.core.add_repl_definitions({
	clojure = {
		lein_connect = {
			command = { "lein", "repl", ":connect" },
		},
	},
})

iron.core.set_config({
	preferred = {
		clojure = "lein",
	},
})
