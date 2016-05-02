
<script type="text/javascript">

jQuery(function ($) {

	'use strict';

	(function () {
	var $frame  = $('#basic');
	var $slidee = $frame.children('ul').eq(0);
	var $wrap   = $frame.parent();

	var options = {
	  horizontal: 1,
		itemNav: 'basic',
		smart: 1,
		activateOn: 'click',
		mouseDragging: 1,
		touchDragging: 1,
		releaseSwing: 1,
		scrollBar: $wrap.find('.scrollbar'),
		scrollBy: 2,
		scrollTrap: true,
		pagesBar: $wrap.find('.pages'),
		activatePageOn: 'click',
		speed: 200,
		moveBy: 300,
		elasticBounds: 1,
		dragHandle: 1,
		dynamicHandle: 1,
		clickBar: 1,
		keyboardNavBy: 'items',
		prevPage: $wrap.find('.prevPage'),
		nextPage: $wrap.find('.nextPage')

  	};


  	var sly = new Sly('#basic', options, {
    	load: function () {
    		this.activate(this.getIndex($wrap.find('.active')));
		},
		move: [
			function () {},
	        function () {}
		]
    }).init();

	}());
});


</script>

<div class="slynav">
<div class="scrollbar visible-xs">
	<div class="handle">
		<div class="mousearea"></div>
	</div>
</div>

<div id="basic" class="frame text-center pagination-container">
<ul class="slidee">
		<!-- BEGIN categories -->
		<li class="page" style="{function.generateCategoryBackground};">
			<a href="{config.relative_path}/category/{categories.slug}" itemprop="url" style="color: #fff;"><i class="fa fa-fw {categories.icon}"></i></a>
		</li>
		<!-- BEGIN categories.children -->
				<li class="page" style="{function.generateCategoryBackground};">
			 		<a href="{config.relative_path}/category/{categories.children.slug}" itemprop="url" style="color: #fff;"><i class="fa fa-fw {categories.children.icon}"></i></a>
				</li>
		<!-- END categories.children -->
		<!-- END categories -->

</ul>

</div>
</div>

<div class="category">
<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}">
	<meta itemprop="itemListOrder" content="descending">
	<!-- BEGIN topics -->
	<li component="category/topic" class="row clearfix {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<meta itemprop="name" content="{function.stripTags, title}">

		<div class="col-lg-7 col-md-7 col-sm-9 col-xs-10 content">
			<div class="avatar pull-left">
				<!-- IF showSelect -->
				<div class="select" component="topic/select">
					<!-- IF topics.user.picture -->
					{function.renderTopicImage}
					<!-- ELSE -->
					<div class="user-icon" style="background-color: {topics.user.icon:bgColor};" title="{topics.user.username}">{topics.user.icon:text}</div>
					<!-- ENDIF topics.user.picture -->
					<i class="fa fa-check"></i>
				</div>
				<!-- ENDIF showSelect -->

				<!-- IF !showSelect -->
				<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
					<!-- IF topics.user.picture -->
					{function.renderTopicImage}
					<!-- ELSE -->
					<div class="user-icon" style="background-color: {topics.user.icon:bgColor};" title="{topics.user.username}">{topics.user.icon:text}</div>
					<!-- ENDIF topics.user.picture -->
				</a>
				<!-- ENDIF !showSelect -->
			</div>

			<h2 component="topic/header" class="title">
				<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->"></i>
				<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->"></i>
				<!-- IF !topics.noAnchor -->
				<a href="{config.relative_path}/topic/{topics.slug}" itemprop="url">{topics.title}</a><br />
				<!-- ELSE -->
				{topics.title}<br />
				<!-- ENDIF !topics.noAnchor -->

				<!-- IF !template.category -->
				<small>
					<a href="{config.relative_path}/category/{topics.category.slug}"><span class="fa-stack fa-lg"><i style="color:{topics.category.bgColor};"class="fa fa-circle fa-stack-2x"></i><i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i></span> {topics.category.name}</a> &bull;
				</small>
				<!-- ENDIF !template.category -->

				<!--<span class="tag-list hidden-xs">
					<!-- BEGIN tags -->
					<a href="{config.relative_path}/tags/{topics.tags.value}"><span class="tag" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.value}</span></a>
					<!-- END tags -->
					<!-- IF topics.tags.length --><small>&bull;</small><!-- ENDIF topics.tags.length -->
				</span>
				-->
				<small> {topics.user.username} </small>
				<small class="hidden-xs"><span class="timeago" title="{topics.timestampISO}"></span></small>
				<small class="visible-xs-inline">
					<!-- IF topics.teaser.timestamp -->
					<span class="timeago" title="{topics.teaser.timestampISO}"></span>
					<!-- ELSE -->
					<span class="timeago" title="{topics.timestampISO}"></span>
					<!-- ENDIF topics.teaser.timestamp -->
				</small>
			</h2>
		</div>

		<div class="mobile-stat col-xs-2 visible-xs text-right">
			<span class="human-readable-number">{topics.postcount}</span> <a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"><i class="fa fa-arrow-circle-right"></i></a>
		</div>

		<div class="col-lg-1 col-md-1 hidden-sm hidden-xs stats">
			<span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span><br />
			<small>[[global:posts]]</small>
		</div>

		<div class="col-lg-1 col-md-1 hidden-sm hidden-xs stats">
			<span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span><br />
			<small>[[global:views]]</small>
		</div>

		<div class="col-lg-3 col-md-3 col-sm-3 teaser hidden-xs">
			<div class="card" style="border-color: {topics.category.bgColor}">
				<!-- IF topics.unreplied -->
				<p>
					[[category:no_replies]]
				</p>
				<!-- ELSE -->
				<!-- IF topics.teaser.pid -->
				<p>
					<a href="{config.relative_path}/user/{topics.teaser.user.userslug}">
						{topics.teaser.user.username}
						<!--<!-- IF topics.teaser.user.picture -->
						<img title="{topics.teaser.user.username}" class="user-img" src="{topics.teaser.user.picture}" />
						<!-- ELSE -->
						<span title="{topics.teaser.user.username}" class="user-icon user-img" style="background-color: {topics.teaser.user.icon:bgColor};">{topics.teaser.user.icon:text}</span>
						<!-- ENDIF topics.teaser.user.picture -->
						-->
					</a>
					<a class="permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
						<span class="timeago" title="{topics.teaser.timestampISO}"></span>
					</a>
				</p>
				<div class="post-content">
					{topics.teaser.content}
				</div>
				<!-- ENDIF topics.teaser.pid -->
				<!-- ENDIF topics.unreplied -->
			</div>
		</div>
	</li>
	<!-- END topics -->
</ul>
</div>







<div widget-area="hp-header">
	<!-- BEGIN widgets -->
	{widgets.html}
	<!-- END widgets -->
</div>

<div class="row">
	<div class="col-md-9 col-xs-12" no-widget-class="col-lg-12 col-xs-12" no-widget-target="hp-sidebar">

		<div widget-area="hp-content">
			<!-- BEGIN widgets -->
			{widgets.html}
			<!-- END widgets -->
		</div>
	</div>
	<div class="col-md-3 col-xs-12">
		<div widget-area="hp-sidebar">
			<!-- BEGIN widgets -->
			{widgets.html}
			<!-- END widgets -->
		</div>
	</div>
</div>

<div widget-area="hp-footer">
	<!-- BEGIN widgets -->
	{widgets.html}
	<!-- END widgets -->
</div>
