function activate(content) {
	goby.registerCommand('shodan', function () {
		let config = goby.getConfiguration();
		let key = config.Key.default;
		if (key) {
			let path = __dirname + "/shodan.html"
			goby.showIframeDia(path, "Shodan查询", "666", "500");
		} else {
			goby.showConfigurationDia();
		}
	});
}

exports.activate = activate;
