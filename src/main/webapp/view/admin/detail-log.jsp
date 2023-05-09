<%@ page import="vn.edu.hcmuaf.fit.bean.Log" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: minht
  Date: 20/04/2023
  Time: 10:40 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết Log | ADMIN</title>
  <%@include file="../../common/admin/head.jsp" %>
  <style>
    .tabs .tab-item.active {
      background-color: #ffffff;
    }
    .log-INFO{
      background-color: #d2e8ff;
    }
    .log-ALERT{
      background-color: #fcf8e3;
    }
    .log-WARNING{
      background-color: #ffdebd;
    }
    .log-DANGER{
      background-color: #f1c2c2;
    }
    .log-level{
      height: 50px;
      font-size: 17px;
      line-height: 50px;
      font-weight: bold;
      padding-left: 10px;
    }
    .wapper{
      margin-left: 10px;
    }
    #icon-datial-user{
      margin-top: 2px;
      margin-left: 5px;
      font-size: 15px;
    }
    p{
      margin: 0;
    }
  </style>
</head>
<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="../../common/admin/header.jsp" %>
<!-- Sidebar menu-->
<%@include file="../../common/admin/sidebar.jsp" %>

<%
    Log log = (Log) request.getAttribute("log");
    UserModel userLog = (UserModel) request.getAttribute("user");
    String imageUser = userLog == null ? "no-avatar.png" : userLog.getAvatar();
    String nameUser = userLog == null ? "Không xác định" : userLog.getName();
    String iconLog =  "";
    if(log.getLevel()==1){
      iconLog = "<i class=\"fas fa-info-circle\"></i>";
    }else if(log.getLevel() == 2){
      iconLog = "<i style=\"color:red\" class=\"fas fa-exclamation-triangle\"></i>";
    }else if(log.getLevel() == 2){
      iconLog = "<i style=\"color:red\" class=\"fas fa-exclamation-triangle\"></i>";
    }else {
      iconLog = "<i style=\"color:red\" class=\"fas fa-exclamation-triangle\"></i>";
    }

    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String formattedDate = formatter.format(log.getCreate_at());
%>

<body>
<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Quản lý log</b></a></li>
      <li class="breadcrumb-item active"><a href="manage-blog.jsp"><b>Chi tiết log</b></a></li>
    </ul>
    <div id="clock"></div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <%-- Nav Tab  --%>
          <div class="row element-button">
            <%-- Tabs --%>
            <div class="col-sm-5" style="padding-left: 10px">
              <div class="tabs"
                   style="display: flex; min-width: 346px; max-width: 342px;padding: 3px; border-radius: 5px; background-color: #ededef">
                <div class="tab-item active"
                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                  <b>Chi tiết log</b>
                </div>
                <div class="tab-item"
                     style="padding: 5px 10px; text-align: center ;border-radius: 4px;font-size: 15px;min-width: 170px;cursor: pointer; max-width: 180px">
                  <b>Khác</b>
                </div>
              </div>

            </div>
          </div>
          <div class="tab-content">
            <div class="tab-pane active">
                <div id="level" class="log-level log-<%=log.getLevelWithName()%>">
                  <%=iconLog%>

                  <%=log.getLevelWithName()%>! - Nguồn: <%=log.getSrc()%> - Thời gian: <%=formattedDate%>
                </div>

                <div class="wapper">
                  <div id="user">
                    <h5 style="margin-top: 20px"><i class="fas fa-user"></i> Tác nhân</h5>
                    <div style="height: 50px; display: flex;align-items: center; flex-direction: row; margin-top: 20px">
                      <div style="width: 50px; height: 50px">
                        <img style="width: 100%;border: 1px solid #333;height: 100%;object-fit: cover;border-radius: 100%;" src="../images/user/<%=imageUser%>" alt="<%=imageUser%>">
                      </div>
                      <a href="" style="display: flex; align-items: center;">
                        <p style="margin: 0; padding-left: 20px; font-size: 17px"><%=nameUser%></p>
                        <i id="icon-datial-user" class="fas fa-chevron-circle-right"></i>
                      </a>
                    </div>
                  </div>

                  <div id="Content">
                    <h5 style="margin-top: 20px"><i class="fas fa-poll-h"></i> Nội dung</h5>
                    <p><%=log.getContent()%></p>
                  </div>
                </div>

            </div>

            <div class="tab-pane">
              <h1>Tab 2</h1>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</main>
<%@include file="../../common/admin/script.jsp" %>
<!-- Essential javascripts for application to work-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#logTable').DataTable();</script>

<script>
  // chuyển tab
  const tabs = document.querySelectorAll('.tab-item');
  const panes = document.querySelectorAll('.tab-pane');

  tabs.forEach((tab, index) => {
    const pane = panes[index];
    tab.onclick = function () {
      document.querySelector('.tab-item.active').classList.remove('active')
      document.querySelector('.tab-pane.active').classList.remove('active')
      this.classList.add('active')
      pane.classList.add('active')
    }
  })


</script>

</body>
</html>
