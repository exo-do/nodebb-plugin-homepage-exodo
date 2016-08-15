
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

<script>
			$(".hover").mouseleave(
			  function () {
			    $(this).removeClass("hover");
			  }
			);
</script>


<div widget-area="hp-header">
	<!-- BEGIN widgets -->
	{widgets.html}
	<!-- END widgets -->
</div>

<div class="slynav">

	<div class="scrollbar visible-xs visible-sm">
		<div class="handle">
			<div class="mousearea"></div>
		</div>
	</div>

	<div id="basic" class="frame text-center visible-xs visible-sm">
		<ul class="slidee">
			<!-- BEGIN categories -->
			<li style="{function.generateCategoryBackground};">
				<a href="{config.relative_path}/category/{categories.slug}" itemprop="url" style="color: #fff;"><i class="fa fa-fw {categories.icon}"></i></a>
			</li>

			<!-- BEGIN categories.children -->
			<li style="{function.generateCategoryBackground};">
				<a href="{config.relative_path}/category/{categories.children.slug}" itemprop="url" style="color: #fff;"><i class="fa fa-fw {categories.children.icon}"></i></a>
			</li>
			<!-- END categories.children -->
			<!-- END categories -->
		</ul>
	</div>


</div>

<div class="row">
	<div class="col-md-9 col-xs-12" no-widget-target="hp-sidebar">

		<div class="category">
			<div class="category-bar"><p class="hidden-xs">[[pages:recent]]</p></div>
			<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}">
				<meta itemprop="itemListOrder" content="descending">

				<!-- BEGIN topics -->
				<li component="category/topic" class="row clearfix {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
					<meta itemprop="name" content="{function.stripTags, title}">

					<div class="col-lg-7 col-md-7 col-sm-9 col-xs-11 content">
						<div class="avatar pull-left">
							<!-- IF showSelect -->
							<div class="select" component="topic/select">
								<!-- IF topics.thumb -->
 									<img src="{topics.thumb}" class="user-img" />
								<!-- ELSE -->
								<!-- IF topics.user.picture -->
								{function.renderTopicImage}
								<!-- ELSE -->
								<div class="user-icon" style="background-color: {topics.user.icon:bgColor};" title="{topics.user.username}">{topics.user.icon:text}</div>
								<!-- ENDIF topics.user.picture -->
								<!-- ENDIF topics.thumb -->
								<i class="fa fa-check"></i>
							</div>
							<!-- ENDIF showSelect -->

							<!-- IF !showSelect -->
							<a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" class="pull-left">
								<!-- IF topics.thumb -->
								<img src="{topics.thumb}" class="user-img" />
								<!-- ELSE -->
								<!-- IF topics.user.picture -->
								{function.renderTopicImage}
								<!-- ELSE -->
								<div class="user-icon" style="background-color: {topics.user.icon:bgColor};" title="{topics.user.username}">{topics.user.icon:text}</div>
								<!-- ENDIF topics.user.picture -->
								<!-- ENDIF topics.thumb -->
							</a>
							<!-- ENDIF !showSelect -->
						</div>

						<h2 component="topic/header" class="title">

							<!-- IF !topics.noAnchor -->
							<div class="topictitle"><a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">
								<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->"></i>
								<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->"></i> {topics.title}</a></div>
							<!-- ELSE -->
							<div class="topictitle">
								<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->"></i>
								<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->"></i> {topics.title}</div>
							<!-- ENDIF !topics.noAnchor -->

							<!-- IF !template.category -->
							<small class="hidden-xs">
								<a href="{config.relative_path}/category/{topics.category.slug}" title="{topics.category.name}">
									<span> {topics.category.name}</span>
								</a> &bull;
							</small>

							<small class="visible-xs-inline">
								<a href="{config.relative_path}/category/{topics.category.slug}" title="{topics.category.name}">
									<span class="fa-stack fa-lg visible-xs-inline"><i style="color:{topics.category.bgColor};"class="fa fa-circle fa-stack-2x"></i><i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i></span>
								</a>
							</small>
							<!-- ENDIF !template.category -->

							<small><a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.username}</a> &bull;</small>
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

					<div class="mobile-stat col-xs-1 visible-xs text-right">
						<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
							<span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="human-readable-number fa fa-inverse fa-stack-1x">{topics.postcount}</i></span>
						</a>
					</div>

					<div class="col-lg-1 col-md-1 hidden-sm hidden-xs stats">
						<span>
							<!-- IF !template.category -->
							<a href="{config.relative_path}/category/{topics.category.slug}"  title="{topics.category.name}"><span class="fa-stack fa-lg"><i style="color:{topics.category.bgColor};"class="fa fa-circle fa-stack-2x"></i><i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i></span></a>
							<!-- ENDIF !template.category -->
						</span>
					</div>

					<div class="col-lg-1 col-md-1 hidden-sm hidden-xs stats">
						<span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span><br />
						<small>[[global:posts]]</small>
					</div>

					<div class="col-lg-1 col-md-1 hidden-sm hidden-xs stats">
						<span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span><br />
						<small>[[global:views]]</small>
					</div>

					<div class="col-lg-2 col-md-2 col-sm-3 teaser hidden-xs">
						<div class="card" style="border-color: {topics.category.bgColor}">

							<!-- IF topics.unreplied -->
							<p>[[category:no_replies]]</p>
							<!-- ELSE -->

							<!-- IF topics.teaser.pid -->
							<p>
								<a href="{config.relative_path}/user/{topics.teaser.user.userslug}">
									{topics.teaser.user.username}
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


		<div widget-area="hp-content">
			<!-- BEGIN widgets -->
			{widgets.html}
			<!-- END widgets -->
		</div>
	</div>


	<div class="col-md-3 col-xs-12">

				<div id="effect-1"  class="framesidebar text-center hidden-xs hidden-sm">
						<!-- BEGIN categories -->
						<div style="{function.generateCategoryBackground};" class="{categories.class} tiles img">
							<a href="{config.relative_path}/category/{categories.slug}" data-toggle="tooltip" title="{categories.name}" data-placement="top" itemprop="url" style="color: {categories.color}; display: block;">

								<i class="fa fa-fw fa-2x {categories.icon}" style="vertical-align: middle;"></i>

								<div class="overlay">
            				<span style"font-size: 11px vertical-align: middle;">{categories.name}</span>

        				</div>
							</a>
						</div>
						<!-- BEGIN categories.children -->
							<div style="{function.generateCategoryBackground};" class="{categories.class} tiles img">
								<a href="{config.relative_path}/category/{categories.children.slug}" data-toggle="tooltip" title="{categories.children.name}" data-placement="top" itemprop="url" style="color: {categories.children.color}; display: block;">

									<i class="fa fa-fw fa-2x {categories.children.icon}" style="vertical-align: middle;"></i>

									<div class="overlay">
	            				<span style"font-size: 11px vertical-align: middle;">{categories.children.name}</span>

	        				</div>
								</a>
							</div>
						<!-- END categories.children -->
						<!-- END categories -->
		 	</div>

			</br>
			<!-- IF loggedIn -->
			<figure class="snip1344">

				<a href="{config.relative_path}/user/{user.userslug}">
				<!-- IF user.picture -->
					<img src="{user.picture}" class="background" />
					<img src="{user.picture}" class="profile avatar" />
				<!-- ELSE -->
					<img src="http://i.imgur.com/9eKvnnV.jpg" class="background" />
					<div class="profile avatar avatar-lg" style="background-color: {user.icon:bgColor};" >{user.icon:text}</div>
				<!-- ENDIF user.picture -->
				</a>

			  <figcaption>
			    <h3>{user.username}<span>{user.groupTitle}</span></h3>
			    <div class="icons">
						<a href="/user/{user.userslug}/best" title="[[global:reputation]]"> <i class="ion-ios-star-outline"></i></a>
						<small class="human-readable-number" title="{user.reputation}">{user.reputation}</small>
						<a href="/user/{user.userslug}/topics" title="[[global:topics]]"><i class="ion-ios-chatbubble-outline"></i></a>
						<small class="human-readable-number" title="{user.topiccount}">{user.topiccount}</small>
						<a href="/user/{user.userslug}/posts" title="[[global:posts]]"> <i class="ion-ios-compose-outline"></i></a>
						<small class="human-readable-number" title="{user.postcount}">{user.postcount}</small>
					</div>

			  </figcaption>
			</figure>
			<!-- ENDIF loggedIn -->
			</br>

			<div id="home_tools">
				<!-- IF loggedIn -->
				<button id="new_topic" class="btn btn-primary">[[category:new_topic_button]]</button>
				<!-- ELSE -->
				<a href="{config.relative_path}/login" class="btn btn-primary">[[global:login]]</a>
				<!-- ENDIF loggedIn -->
			</div>

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

<!-- categories hover effects -->
<script>
    $(document).ready(function(){
    if (Modernizr.touch) {
        // show the close overlay button
        $(".close-overlay").removeClass("hidden");
        // handle the adding of hover class when clicked
        $(".img").click(function(e){
            if (!$(this).hasClass("hover")) {
                $(this).addClass("hover");
            }
        });
        // handle the closing of the overlay
        $(".close-overlay").click(function(e){
            e.preventDefault();
            e.stopPropagation();
            if ($(this).closest(".img").hasClass("hover")) {
                $(this).closest(".img").removeClass("hover");
            }
        });
    } else {
        // handle the mouseenter functionality
        $(".img").mouseenter(function(){
            $(this).addClass("hover");
        })
        // handle the mouseleave functionality
        .mouseleave(function(){
            $(this).removeClass("hover");
        });
    }
});
</script>
<!--
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
</script>
-->
