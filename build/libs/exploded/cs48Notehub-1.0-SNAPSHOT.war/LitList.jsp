<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile Page</title>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/pdfList.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<%
  //variables initialization
  String profileImageUrl;
  String email = "";
  String emailName = "";
  int followerNum = 0;
  int followingNum = 0;
  Map<String,String> descriptionMap = new HashMap<>();
  Map<String,String> yearMap = new HashMap<>();
  Map<String,String> monthMap = new HashMap<>();
  Map<String,String> tagMap = new HashMap<>();
  ArrayList<String> nameArray = new ArrayList<>();
  //tags array
  ArrayList<String> MathArray = new ArrayList<>();
  ArrayList<String> CSArray = new ArrayList<>();
  ArrayList<String> ArtArray = new ArrayList<>();
  ArrayList<String> LitArray = new ArrayList<>();
  ArrayList<String> BusArray = new ArrayList<>();
  ArrayList<String> StatArray = new ArrayList<>();
  ArrayList<String> HistoryArray = new ArrayList<>();
  ArrayList<String> PhysicsArray = new ArrayList<>();
  ArrayList<String> ChemArray = new ArrayList<>();
  //list
  String title1 = "";
  String title2 = "";
  String title3 = "";
  String title4 = "";
  String title5 = "";
  String title6 = "";
  String title7 = "";

  String month1 = "";
  String month2 = "";
  String month3 = "";
  String month4 = "";
  String month5 = "";
  String month6 = "";
  String month7 = "";

  String year1 = "";
  String year2 = "";
  String year3 = "";
  String year4 = "";
  String year5 = "";
  String year6 = "";
  String year7 = "";

  String description1 = "";
  String description2 = "";
  String description3 = "";
  String description4 = "";
  String description5 = "";
  String description6 = "";
  String description7 = "";


  //Get variables
  if (session.getAttribute("email") == null && session.getAttribute("keywordjump") == null) {
    response.sendRedirect("index.jsp");
  }
  profileImageUrl = (String) session.getAttribute("image");
  if(session.getAttribute("email")!=null) {
    email = (String) session.getAttribute("email");
    emailName = (String) session.getAttribute("username");
  }
  if(session.getAttribute("keywordjump")!=null){
    email = (String) session.getAttribute("keywordjump");
    emailName = email;
  }
  if(session.getAttribute("followerNum") != null){
    followerNum = (int) session.getAttribute("followerNum");
  }
  if(session.getAttribute("followingNum") != null){
    followingNum = (int) session.getAttribute("followingNum");
  }

  if(session.getAttribute("descriptionMap") != null){
    descriptionMap = (Map<String, String>) session.getAttribute("descriptionMap");
  }

  if(session.getAttribute("yearMap") != null){
    yearMap = (Map<String, String>) session.getAttribute("yearMap");
  }

  if(session.getAttribute("monthMap") != null){
    monthMap = (Map<String, String>) session.getAttribute("monthMap");
  }

  if(session.getAttribute("tagMap") != null){
    tagMap = (Map<String, String>) session.getAttribute("tagMap");
  }

  if(session.getAttribute("nameArray") != null){
    nameArray = (ArrayList<String>) session.getAttribute("nameArray");
  }


  if(session.getAttribute("ChemArray") != null){
    ChemArray = (ArrayList<String>) session.getAttribute("ChemArray");
  }

  if(session.getAttribute("PhysicsArray") != null){
    PhysicsArray = (ArrayList<String>) session.getAttribute("PhysicsArray");
  }
  if(session.getAttribute("HistoryArray") != null){
    HistoryArray = (ArrayList<String>) session.getAttribute("HistoryArray");
  }
  if(session.getAttribute("StatArray") != null){
    StatArray = (ArrayList<String>) session.getAttribute("StatArray");
  }
  if(session.getAttribute("BusArray") != null){
    BusArray = (ArrayList<String>) session.getAttribute("BusArray");
  }
  if(session.getAttribute("LitArray") != null){
    LitArray = (ArrayList<String>) session.getAttribute("LitArray");
  }
  if(session.getAttribute("ArtArray") != null){
    ArtArray = (ArrayList<String>) session.getAttribute("ArtArray");
  }
  if(session.getAttribute("CSArray") != null){
    CSArray = (ArrayList<String>) session.getAttribute("CSArray");
  }
  if(session.getAttribute("MathArray") != null){
    MathArray = (ArrayList<String>) session.getAttribute("MathArray");
  }
  if (session.getAttribute("LitArray") == null) {
    response.sendRedirect("userProfile.jsp");
  }


  title1 = LitArray.get(1);
  title2 = LitArray.get(2);
  title3 = LitArray.get(3);
  title4 = LitArray.get(4);
  title5 = LitArray.get(5);
  title6 = LitArray.get(6);
  title7 = LitArray.get(7);
    month1 = monthMap.get(title1);
    month2 = monthMap.get(title2);
    month3 = monthMap.get(title3);
    month4 = monthMap.get(title4);
    month5 = monthMap.get(title5);
    month6 = monthMap.get(title6);

    year1 = yearMap.get(title1);
    year2 = yearMap.get(title2);
    year3 = yearMap.get(title3);
    year4 = yearMap.get(title4);
    year5 = yearMap.get(title5);
    year6 = yearMap.get(title6);

    description1 = descriptionMap.get(title1);
    description2 = descriptionMap.get(title2);
    description3 = descriptionMap.get(title3);
    description4 = descriptionMap.get(title4);
    description5 = descriptionMap.get(title5);
    description6 = descriptionMap.get(title6);

%>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
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
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search NoteHub">
                    </div>
                </form>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="register.html">logout  <i class="fa fa-sign-out"></i></a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div id = "mainProfile" class="container target">

        <div id = "pdflist" class="container">
            <div class="row">
                <div class="[ col-xs-12 col-sm-offset-2 col-sm-8 ]">
                    <ul class="event-list">
                        <li>
                            <time datetime="2014-07-20">
                                <span class="day">2</span>
                                <span class="month"><%=month1%></span>
                                <span class="year"><%=year1%></span>
                                <span class="time">ALL DAY</span>
                            </time>
                            <img alt="Example Picture" src="https://mafiadoc.com/img/260x300/full-text-in-pdf-format-115kb-ucsb-computer-scienc_5a1075f71723dd48dbc5fc3c.jpg" />
                            <div class="info">
                                <h2 class="title"><%=title1%></h2>
                                <p class="desc"><%=description1%></p>
                            </div>
                            <div class="social">
                                <ul>
                                    <li class="facebook" style="width:33%;"><a href="#delete"><span class="fa fa-trash"></span></a></li>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <time datetime="2014-07-20">
                                <span class="day">2</span>
                                <span class="month"><%=month2%></span>
                                <span class="year"><%=year2%></span>
                                <span class="time">ALL DAY</span>
                            </time>
                            <img alt="Example Picture" src="http://slideplayer.com/6383097/22/images/4/UCSB+CS+Sequence%3A+165A+and+165B.jpg" />
                            <div class="info">
                                <h2 class="title"><%=title2%></h2>
                                <p class="desc"><%=description2%></p>
                            </div>
                            <div class="social">
                                <ul>
                                    <li class="facebook" style="width:33%;"><a href="#delete"><span class="fa fa-trash"></span></a></li>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <time datetime="2014-07-20">
                                <span class="day">2</span>
                                <span class="month"><%=month3%></span>
                                <span class="year"><%=year3%></span>
                                <span class="time">ALL DAY</span>
                            </time>
                            <img alt="Example Picture" src="https://img.yumpu.com/17549339/1/358x269/ucsb-cs-178-intro-to-crypto.jpg?quality=85" />
                            <div class="info">
                                <h2 class="title"><%=title3%></h2>
                                <p class="desc"><%=description3%></p>
                            </div>
                            <div class="social">
                                <ul>
                                    <li class="facebook" style="width:33%;"><a href="#delete"><span class="fa fa-trash"></span></a></li>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <time datetime="2014-08-20">
                                <span class="day">2</span>
                                <span class="month"><%=month4%></span>
                                <span class="year"><%=year4%></span>
                                <span class="time">ALL DAY</span>
                            </time>
                            <img alt="Example Picture" src="https://cs.ucsb.edu/~victor/ta/cs40m15/tilings-and-fibonacci.jpg" />
                            <div class="info">
                                <h2 class="title"><%=title4%></h2>
                                <p class="desc"><%=description4%></p>
                            </div>
                            <div class="social">
                                <ul>
                                    <li class="facebook" style="width:33%;"><a href="#delete"><span class="fa fa-trash"></span></a></li>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <time datetime="2014-07-20">
                                <span class="day">2</span>
                                <span class="month"><%=month5%></span>
                                <span class="year"><%=year5%></span>
                                <span class="time">ALL DAY</span>
                            </time>
                            <img alt="Example Picture" src="http://slideplayer.com/6383097/22/images/4/UCSB+CS+Sequence%3A+165A+and+165B.jpg" />
                            <div class="info">
                                <h2 class="title"><%=title5%></h2>
                                <p class="desc"><%=description5%></p>
                            </div>
                            <div class="social">
                                <ul>
                                    <li class="facebook" style="width:33%;"><a href="#delete"><span class="fa fa-trash"></span></a></li>
                                </ul>
                            </div>
                        </li>

                        <li>
                            <time datetime="2014-07-20">
                                <span class="day">2</span>
                                <span class="month"><%=month6%></span>
                                <span class="year"><%=year6%></span>
                                <span class="time">ALL DAY</span>
                            </time>
                            <img alt="Example Picture" src="http://slideplayer.com/6383097/22/images/4/UCSB+CS+Sequence%3A+165A+and+165B.jpg" />
                            <div class="info">
                                <h2 class="title"><%=title6%></h2>
                                <p class="desc"><%=description6%></p>
                            </div>
                            <div class="social">
                                <ul>
                                    <li class="facebook" style="width:33%;"><a href="#delete"><span class="fa fa-trash"></span></a></li>
                                </ul>
                            </div>
                        </li>


                    </ul>
                </div>
            </div>
        </div>



        <script src="/plugins/bootstrap-select.min.js"></script>
        <script src="/codemirror/jquery.codemirror.js"></script>
        <script src="/beautifier.js"></script>
        <script src="/plugins/bootstrap-pager.js"></script>
    </div>
</div>
<script src="js/login.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/facebooklogin.js"></script>
<script src="js/profile.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
