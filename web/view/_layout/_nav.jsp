<div class="navbar navbar-inverse navbar-fixed-top">
    <%String a=session.getAttribute("username").toString();%>
                <div class="adjust-nav">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><i class="fa fa-square-o "></i>&nbsp;SuZu</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><% out.println(a);%></a></li>
                            <li><a href="Logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>