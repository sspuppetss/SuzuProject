<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    
    <title>Suzu</title>

</head>

<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="adjust-nav">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <%if(session.getAttribute("username")!=null){%> 
                        <a class="navbar-brand" href="Home"><i class="fa fa-square-o "></i>&nbsp;SuZu</a><%}else{%>
                        <a class="navbar-brand" href="#"><i class="fa fa-square-o "></i>&nbsp;SuZu</a><%}%>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <%if(session.getAttribute("username")!=null){%>  
                                <%String a=session.getAttribute("username").toString();%>
                                <li><a href="#"><% out.println(a);%></a></li>
                                <li><a href="Logout">Logout</a></li>
                                <li><a href="#"></a></li>
                            <li></li>
                            <%}else{%>
                                <li><a href="Login">Login</a></li>    
                                <li><a href="#"></a></li>
                            <%}%>
                        </ul>
                    </div>
                </div>
    </div>
    <div class="container">
        <section class="col-md-12 content" id="home">
           <div class="col-lg-6 col-md-6 content-item tm-black-translucent-bg tm-logo-box">
              <i class="fa fa-snowflake-o fa-4x tm-logo"></i>
              <h1 class="text-uppercase">Suzu</h1>
               
           </div>
           <div class="col-lg-6 col-md-6 content-item content-item-1 background tm-white-translucent-bg">
               <h2 class="main-title text-center dark-blue-text">0.1 Susu</h2>
               <p>Susu adalah cairan bergizi berwarna putih yang dihasilkan oleh kelenjar susu mamalia, 
                   salah satunya manusia. Susu adalah sumber gizi utama bagi bayi sebelum mereka dapat mencerna makanan padat. Susu binatang (biasanya sapi) juga diolah menjadi berbagai produk seperti mentega, yogurt, es krim, keju, susu kental manis, susu bubuk dan lain-lainnya untuk konsumsi manusia.</p>               
           </div>
       </section>
       <section class="col-md-12 content padding tm-equal-col-container" id="services">
        <div class="col-lg-6 col-md-6 col-sm-12 content-item tm-black-translucent-bg tm-services-section-padding">
          <h2 class="main-title text-center dark-blue-text">0.2 Gizi untuk manusia</h2>
          <p>Di beberapa negara, terutama di Eropa, meminum susu telah menjadi kebiasaan yang lumrah dilakukan setiap sarapan. Susu terus diproduksi dengan cara mendirikan peternakan sapi perah. Pada zaman ini, susu tidak hanya diminum, melainkan diolah menjadi mentega, yogurt, bahkan es krim. Susu pun terus dikembangkan seiring dengan kemajuan zaman. Di Eropa, industri susu sangat maju dalam hal teknologi dan kualitas susu itu sendiri. Susu yang diproduksi di Eropa, rata-rata mengandung kandungan gizi yang tinggi. Hal ini yang menyebabkan, tinggi rata-rata orang Eropa jauh dari tinggi rata-rata orang Asia. Susu mengandung banyak sekali kalsium yang dapat menguatkan tulang.</p>
           <!--<button type="button" class="btn btn-big pull-right tm-btn-primary">Read More</button>-->
       </div>
       <div class="col-lg-6 col-md-6 col-sm-12 tm-white-translucent-bg tm-services-section-padding tm-box-center">
          <div class="tm-right-col">
            <div class="tm-border-box tm-gray-border-tl tm-img-box-1">
              <img src="images/img1.jpg" alt="Image 1" class="tm-img tm-img-tl"/>  
             </div>  
              <div class="tm-border-box tm-pink-border-bl tm-img-box-4">
              <img src="images/img4.jpg" alt="Image 4" class="tm-img tm-img-br">  
            </div>  
          </div>
          <div class="tm-left-col">
             <div class="tm-border-box tm-pink-border-tr tm-img-box-3">  
              <img src="images/img2.jpg" alt="Image 2" class="tm-img tm-img-tr">  
             </div>
               <div class="tm-border-box tm-gray-border-br tm-img-box-2">
              <img src='images/img3.jpg' alt="Image 3" class="tm-img tm-img-bl">  
            </div>
          </div>                 
       </div>
      </section>
        
      <section class="col-md-12 content padding tm-float-section tm-section-3">
      <div class="col-lg-6 col-md-6 content-item tm-black-translucent-bg"></div>
      <div class="col-lg-6 col-md-6 content-item tm-white-translucent-bg"></div>
      
      <div class="tm-float-section-header">
        <h2 class="text-center tm-white-text tm-section-3-header">0.3 Pelayanan</h2>  
      </div>

      <div class="tm-float-section-body tm-white-bg">
        <div class="col-lg-12">
          <div class="col-md-4 col-lg-4">
            <i class="fa fa-archive fa-4x tm-fa-icon"></i>
            <p>Curabitur ornare pulvinar sapien, accumsan malesuada mauris ultricies non. Sed id tempor arcu. Pellentesque tortor sapien, molestie at purus vitae, blandit pretium dolor.</p>
          </div>
          <div class="col-md-4 col-lg-4">
            <i class="fa fa-truck fa-4x tm-fa-icon"></i>
            <p>Curabitur ornare pulvinar sapien, accumsan malesuada mauris ultricies non. Sed id tempor arcu. Pellentesque tortor sapien, molestie at purus vitae, blandit pretium dolor.</p>
          </div>
          <div class="col-md-4 col-lg-4">
            <i class="fa fa-users fa-4x tm-fa-icon"></i>
            <p>Curabitur ornare pulvinar sapien, accumsan malesuada mauris ultricies non. Sed id tempor arcu. Pellentesque tortor sapien, molestie at purus vitae, blandit pretium dolor.</p>
          </div>
        </div>
      </div>
        
      </section>

   <section class="col-md-12 content" id="contact">
       <div class="col-lg-6 col-md-6 content-item tm-content-box tm-black-translucent-bg">
           <h2 class="contact-title">0.4 Kontak Info</h2>
           <p>Ingin mengetahui lebih lanjut? Hubungi Call Center kami : </p>
           <p>
             Nim: 672016198<br>
             Fax: 255-255-254<br>
             Email: Suzu@company.com
           </p>
       </div>
       <div class="col-lg-6 col-md-6 content-item tm-content-box tm-white-translucent-bg">
           
           <form action="Login" method="post" name="contact-form" class="contact-form">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <input name="name" type="text" class="form-control" id="name" placeholder="Your Name" required>
                </div>    
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group contact-field">
                    <input name="email" type="email" class="form-control" id="email" placeholder="Email" required>
                </div>    
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group contact-field">
                    <textarea name="message" rows="6" class="form-control" id="message" placeholder="Message" required></textarea>
                </div>    
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group margin-b-0">
                    <button type="submit" id="form-submit" class="btn pull-right btn-contact tm-btn-primary">Submit</button>
                </div>    
            </div>
        </form>
        <!--</div> -->
        <div id="msgSubmit" class="h3 text-center hidden">Message Submitted!</div>

    </div>

</section>

</div>

<div class="text-center footer">
	<div class="container">
		Surya Dwi Pradana - 672016198 &copy <span class="tm-current-year">2018</span>
        </div>
</div>

<script>

  document.getElementsByClassName("tm-current-year").value = new Date().getFullYear();

</script>
</body>
</html>