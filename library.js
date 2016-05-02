(function(Plugin) {
	"use strict";

	var categories = require.main.require('./src/categories');
	var topics = require.main.require('./src/topics');
	var meta = require.main.require('./src/meta');
	// init hook
	Plugin.serveHomepage = function(params){
		renderExampleCategories(params.req, params.res, params.next);
		//renderExampleRecent(params.req, params.res, params.next);
	};

	function renderExampleCategories(req, res, next) {
		// Get all the visible categories.
		var stop = (parseInt(meta.config.topicsPerList, 10) || 20) - 1;

		categories.getCategoriesByPrivilege('cid:0:children', req.uid, 'find', function(err, categoryData) {
			if (err) return next(err);

			// Put the categories in a tree format.
			categories.flattenCategories([], categoryData);
			var categoriasLocales = {};
			categoriasLocales.cat = categoryData;
			topics.getTopicsFromSet('topics:recent', req.uid, 0, stop, function(err, data) {
			if (err) return next(err);
			categoriasLocales.topics= data.topics;

			res.render('homepage', {
				template: { name: 'homepage' },
				topics: categoriasLocales.topics,
				categories: categoriasLocales.cat
			});

		});
	});
	}

	function renderExampleRecent(req, res, next){

		var stop = (parseInt(meta.config.topicsPerList, 10) || 20) - 1;

		topics.getTopicsFromSet('topics:recent', req.uid, 0, stop, function(err, data) {
			if (err) return next(err);

		/*	res.render('homepage', {
				template: { name: 'homepage' },
				topics: data.topics
			});
		*/
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

}(exports));
