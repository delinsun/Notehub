<!DOCTYPE html>
<html>
<head>
    <title>NoteHub</title>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
          type="text/css">

    <link rel="stylesheet" type="text/css" href="css/main.css">


    <script type="text/javascript">
        var xmlHttp;

        //get the value of the input
        function getMoreContents() {
            //get the input
            var content = document.getElementById("keyword");
            if (content.value == "") {
                clearContent();
                return;
            }
            //send value to the servlet
            xmlHttp = createXMLHttp();
            //alert(xmlHttp);
            var url = "Request?keyword=" + content.value;
            //true stand for javascript will run after send() even if the servlet did not response
            xmlHttp.open("GET", url, true);
            //xmlHttp sign for callback()
            //xmlHttp have 0-4 conditions we only care 4(complete)
            xmlHttp.onreadystatechange = callback;
            xmlHttp.send(null);

        }

        //function to get the http
        function createXMLHttp() {
            //version works for most browsers
            var xmlHttp;
            if (window.XMLHttpRequest) {
                xmlHttp = new XMLHttpRequest();
            }
            //version works for other browsers
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                if (!xmlHttp) {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
            }
            return xmlHttp;
        }

        //callback
        function callback() {
            if (xmlHttp.readyState == 4) {
                if (xmlHttp.status == 200) {
                    var result = xmlHttp.responseText;
                    //json is different from js and java so we need to add ()
                    var json = eval("(" + result + ")");
                    //alert(json);
                    setContent(json);
                }
            }
        }

        //show the contents
        function setContent(contents) {
            //clear the search table
            //clearContent();
            setLocation();
            //to get length first to ensure how many tr to generate
            var size = contents.length;
            //set content
            for (var i = 0; size > i; i++) {
                var nextNode = contents[i];//代表的是json格式数据的第i个元素
                var tr = document.createElement("tr");
                var td = document.createElement("td");
                td.setAttribute("border", "0");
                td.setAttribute("bgcolor", "black");
                td.onmouseover = function () {
                    this.className = 'mouseOver';
                };
                td.onmouseout = function () {
                    this.className = 'mouseOut';
                };
                td.onmousedown = function () {
                    document.getElementById("keyword").value = this.innerHTML;
                };
                var text = document.createTextNode(nextNode);
                td.appendChild(text);
                tr.appendChild(td);
                document.getElementById("content_table_body").appendChild(tr);
            }

        }

        function clearContent() {
            var contentTableBody = document.getElementById("content_table_body");
            var size = contentTableBody.childNodes.length;
            for (var i = size - 1; i >= 0; i--) {
                contentTableBody.removeChild(contentTableBody.childNodes[i]);
            }
            document.getElementById("popDiv").style.border = "none";
        }

        //When we point to another place, then clean the search table
        function keywordBlur() {
            clearContent();
        }

        // to set the location of the search elements
        function setLocation() {
            //the length of the elements should be the same as the input
            var content = document.getElementById("keyword");
            var width = content.offsetWidth;
            var left = content["offsetLeft"];
            var top = content["offsetTop"] + content.offsetHeight;
            //get the elements in div
            var popDiv = document.getElementById("popDiv");
            popDiv.style.border = "black 1px solid";
            popDiv.style.left = left + "px";
            popDiv.style.top = top + "px";
            popDiv.style.width = width + "px";
            document.getElementById("content_table").style.width = width + "px";
        }
    </script>


</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">NoteHub</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <!--li><a href="#search">Search</a></li-->
                <li><a href="#about">About</a></li>
                <form class="navbar-form navbar-left" role="search" action="Request">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search NoteHub" id="keyword"
                               onkeyup="getMoreContents()" onblur="keywordBlur()" onfocus="get">
                            <div id="popDiv">
                                <table id="content_table" bgcolor="black" border="0" cellspacing="0" cellpadding="0">
                                    <tbody id="content_table_body">
                                    <!--how to show the search result-->
                                    </tbody>
                                </table>
                            </div>
                    </div>
                </form>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="register.html">Signup <i class="fa fa-user-plus"></i></a></li>


                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Login <i
                        class="fa fa-user"></i></a>

                    <ul id="login-dp" class="dropdown-menu">
                        <li>
                            <div class="row">
                                <div class="col-md-12">
                                    Login via
                                    <div class="social-buttons">
                                        <button id="loginBtn" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook
                                        </button>
                                        <button %href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter
                                        </button>
                                    </div>
                                    or
                                    <form class="form" role="form" action="Request" name="form1" accept-charset="UTF-8"
                                          id="login-div">
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                            <input type="email" class="form-control" id="exampleInputEmail2"
                                                   name="param1" placeholder="Email address" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                                            <input type="password" class="form-control" id="exampleInputPassword2"
                                                   placeholder="Password" required>
                                            <div class="help-block text-right"><a href="">Forget the password ?</a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary btn-block" function="login()"
                                                   onclick="login()" value="Sign in"></input>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> keep me logged-in
                                            </label>
                                        </div>


                                </div>
                                <div id="user_div" class="loggedin-div">

                                    <h3>Welcome User</h3>
                                    <p id="user_para">Welcome to Firebase web login Example. You're currently logged
                                        in.</p>

                                    <button onclick="logout()">Logout</button>
                                </div>
                            </div>
                            <div class="bottom text-center">
                                New here ? <a href="register.html"><b>Join Us</b></a>
                            </div>
        </div>
        </li>
        </ul>
        </li>


        </ul>
    </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="content">
                <h1>NoteHub</h1>
                <h3>Take notes for everything better, together</h3>
                <hr>
                <button class="btn btn-default btn-lg"><i class="fa fa-bookmark"></i> Get Started!</button>
            </div>
        </div>
    </div>
</div>
<script src="js/login.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/facebooklogin.js"></script>
</body>
</html>
