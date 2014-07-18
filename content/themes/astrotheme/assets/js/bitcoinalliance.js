(function(window){

		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-50526561-1', 'auto');
	
	jQuery( window ).ready( function(){
	
		//console.log('custom js loaded');
		var page = window.location.pathname

		if ( page === '/join/' ){
			ga('send', 'event', 'page', 'join', 'visit', 1);
			jQuery('#mc-embedded-subscribe').click( function(){
				ga('send', 'event', 'page', 'join', 'convert', 1);
			});
		}	
	
	});

})(this);