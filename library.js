(function(module) {
	"use strict";

	var Plugin = {};
	Plugin = module.exports;
	var categories = require.main.require('./src/categories');
	// init hook
	Plugin.serveHomepage = function(params){
		renderExampleCategories(params.req, params.res, params.next);
	};

	function renderExampleCategories(req, res, next) {
		// Get all the visible categories.
		categories.getCategoriesByPrivilege('cid:0:children', req.uid, 'find', function(err, categoryData) {
			if (err) return next(err);

			// Put the categories in a tree format.
			categories.flattenCategories([], categoryData);

			// Send the data to the template. `homepage`
			res.render('homepage', {
				template: { name: 'homepage' },
				categories: categoryData
			});
		});
	}

	Plugin.addListing = function(data, callback){
		data.routes.push({
			route: 'customHP',
			name: 'Custom Homepage'
		});
		callback(null, data);
	};

	Plugin.addNavigation = function(header, callback) {
		header.navigation.push(
			{
				route: '/categories',
				class: '',
				text: 'Forum',
				iconClass: 'fa-comments',
				title: 'Forum',
				textClass: 'visible-xs-inline'
			}
		);

		callback(null, header);
	};

	Plugin.defineWidgetAreas = function(areas, callback) {
		areas = areas.concat([
			{
				'name': 'Custom HP Header',
				'template': 'homepage.tpl',
				'location': 'hp-header'
			},
			{
				'name': 'Custom HP Footer',
				'template': 'homepage.tpl',
				'location': 'hp-footer'
			},
			{
				'name': 'Custom HP Sidebar',
				'template': 'homepage.tpl',
				'location': 'hp-sidebar'
			},
			{
				'name': 'Custom HP Content',
				'template': 'homepage.tpl',
				'location': 'hp-content'
			}
		]);

		callback(null, areas);
	};

	module.exports = Plugin;
}(module));
