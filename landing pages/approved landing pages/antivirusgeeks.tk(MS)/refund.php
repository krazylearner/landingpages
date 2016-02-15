<?php include "recorder.php"; ?>
<!DOCTYPE html>
<!-- saved from url=(0066)http://twitter.github.com/bootstrap/examples/starter-template.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Landy, simple landing page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
        padding-top: 40px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Fjalla+One' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merienda:700' rel='stylesheet' type='text/css'>
    <link href="css/style.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="http://twitter.github.com/bootstrap/assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="http://twitter.github.com/bootstrap/assets/ico/favicon.png">
 </head>

  <body>
    
     <!-- Navbar items -->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#myCarousel">Antivirus Help</a>
          <div class="nav-collapse collapse">
            <ul class="nav pull-right">
              <li><a href="index.html">Home</a></li>
              <li><a href="index.html#about">About</a></li>
              <li><a href="privacy-policy.html">Privacy Policy</a></li>
              <li class="active"><a href="refund.html">Refund Policy</a></li>
              <li><a href="disclaimer.html">Disclaimer</a></li>
              <li><a href="pricing.html">Pricing</a></li>
              <li><a href="contact.html">Contact Us</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    
    <div id="myCarousel" class="carousel slide">
  <!-- Carousel items -->
  
  <!-- Carousel nav
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
  -->
</div>
    
     <!-- Page items -->
    <div class="container">
       <!-- About items -->
      <div id="about">
        <div id="heading">
          <h1>Refund Policy</h1>
          <p>Within seven(7) days of purchase, if for any reason you are not completely satisfied with our services, simply call us toll free at 1832-534-3228 or email us at info@embarksolutions.net to arrange your refund. We will process your credit within ten business days or sooner. For credit and debit card refunds, your bank may take up to two billing cycles to post the credit to your account. If you have any questions, please telephone us toll free at 1832-534-3228 or email us at info@embarksolutions.net</p>  
        </div>
        <div class="divider"></div>
       
      
      </div>
      <div class="divider"></div>
        
      <!-- Screenshot items -->
     
      <div class="divider"></div>
      <!-- Screenshot items -->
     
      <div class="divider"></div>
      <!-- Download items -->
      <div id="download" class="row">
        <ul class="inline">
          <li><a href="#" class="btn btn-large btn-success">Free Diagnosis</a></li>
          <li><a href="#" class="btn btn-large btn-info">Money Back Guarantee</a></li>
        </ul>
        
      </div>
    </div> <!-- /container -->
    <!-- Footer items -->
    <footer>
        <div class="container">
          <div class="row">
            <div class="span6">
              <h3>Our Services</h3>
              <p>Setup & install Antivirus antivirus in your computer,
Update or upgrade Antivirus Product to latest version,
Uninstall or remove Antivirus Product from your PC,
Scan your computer for viruses and other Malwares,
Neutralize or fix the threats detected by Antivirus Antivirus,
Tune up your computer so that it runs at its optimal speed,
Configure Antivirus settings for better security and protection of your PC,
Customize Antivirus antivirus setting as per your requirements
</p>
            </div>
            <div class="span6">
              <h3>Contact Us</h3>
              <p>support@embarksolutions.net<br>Phone:1832-534-3228<br>Phoenix Arizona</p>
              
            </div>
          </div>
          <div class="row">
            <div class="span12">
              <p><small>Copyright 2016, Embark Solutions LLC</small></p>
              <ul id="social" class="inline">
                <li><a class="facebook-icon" href="#"></a></li>
                <li><a class="twitter-icon" href="#"></a></li>
                <li><a class="google-icon" href="#"></a></li>
              </ul>
            </div>
          </div>
        </div>
    </footer>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>window.jQuery || document.write("<script src='js/jquery-1.8.3.min.js'>\x3C/script>")</script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
        $('a[href^="#"]').click(function(event) {
            var id = $(this).attr("href");
            var offset = 60;
            var target = $(id).offset().top - offset;
            $('html, body').animate({scrollTop:target}, 800, $.easing.easeInOutExpo());
            event.preventDefault();
        });
      });
    </script>
  
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-67371562-2', 'auto');
  ga('send', 'pageview');

</script>
<script>
(function(w,d,t,r,u){var f,n,i;w[u]=w[u]||[],f=function(){var o={ti:"5128764"};o.q=w[u],w[u]=new UET(o),w[u].push("pageLoad")},n=d.createElement(t),n.src=r,n.async=1,n.onload=n.onreadystatechange=function(){var s=this.readyState;s&&s!=="loaded"&&s!=="complete"||(f(),n.onload=n.onreadystatechange=null)},i=d.getElementsByTagName(t)[0],i.parentNode.insertBefore(n,i)})(window,document,"script","//bat.bing.com/bat.js","uetq");
</script>
<noscript><img src="//bat.bing.com/action/0?ti=5128764&Ver=2" height="0" width="0" style="display:none; visibility: hidden;" /></noscript>
</body></html>