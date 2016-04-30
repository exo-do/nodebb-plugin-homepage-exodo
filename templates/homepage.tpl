
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

		<li class="page">
		hola
		</li>
		<li class="page">
			dos
		</li>

		<li class="page">
			tres
		</li>
		<li class="page">
		hola
		</li>
		<li class="page">
			dos
		</li>

		<li class="page">
			tres
		</li>
		<li class="page">
		hola
		</li>
		<li class="page">
			dos
		</li>

		<li class="page">
			tres
		</li>

</ul>

</div>
</div>


<div widget-area="hp-header">
	<!-- BEGIN widgets -->
	{widgets.html}
	<!-- END widgets -->
</div>

<div class="row">
	<div class="col-md-9 col-xs-12" no-widget-class="col-lg-12 col-xs-12" no-widget-target="hp-sidebar">

		<!--custom code -->

		<div>
			funcionando
			<!-- BEGIN categories -->
				<a href="{config.relative_path}/category/{categories.slug}" itemprop="url">{categories.name}</a> <br>
				<!-- BEGIN categories.children -->
					- <a href="{config.relative_path}/category/{categories.children.slug}" itemprop="url">{categories.children.name}</a> <br>
				<!-- END categories.children -->
			<!-- END categories -->
		</div>


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
