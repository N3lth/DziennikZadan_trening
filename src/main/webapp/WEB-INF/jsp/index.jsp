    <!DOCTYPE html>

        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- JSPCORE -->
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- FORMAT DATY -->

        <html>
        <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

        <title>Menedzer zadan</title>
        <link href="static/css/style.css" rel="stylesheet"/>
        <link href="static/css/bootstrap.min.css" rel="stylesheet"/>


        <!--<script src="static/js/html5shiv.js"/>
        <script src="static/js/respond.js"/>-->

        </head>
        <body>

        <div role="navigation">
            <div class="navbar navbar-inverse">
                <a href="/" class="navbar-brand">Menedzer zadan (WIP)</a>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="new-task">Dodaj zadanie</a></li>
                        <li><a href="all-tasks">Wszystkie zadania</a></li>
                    </ul>
                </div>
            </div>
        </div>

<c:choose>
    <c:when test="${mode=='MODE_HOME'}">
        <div class="container" id="homeDiv">
            <div class="jumbotron text-center">
                <h1>Witaj w menedzerze!</h1>
            </div>
        </div>
    </c:when>





    <c:when test="${mode=='MODE_TASKS'}">
        <div class="container text-center" id="tasksDiv">
            <h3>Moje zadania</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nazwa</th>
                        <th>Opis</th>
                        <th>Data utworzenia</th>
                        <th class="text-center">Ukonczono?</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="task" items="${tasks}">
                        <tr>
                            <td>${task.id}</td>
                            <td class="text-left">${task.name}</td>
                            <td class="text-left">${task.description}</td>
                            <td class="text-left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td>
                            <td><c:choose>
                                <c:when test="${task.finished==false}"><span class="glyphicon glyphicon-remove red"></c:when>
                                <c:when test="${task.finished==true}"><span class="glyphicon glyphicon-ok green"></c:when>
                            </c:choose>
                            </td>
                            <%--<td>${task.finished}</td>--%>
                            <td><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                            <td><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-remove"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>





    <c:when test="${mode=='MODE_NEW' || mode=='MODE_UPDATE'}">
        <div class="container text-center">
            <h3>Dodaj nowe zadanie</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="save-task">
                <input type="hidden" name="id" value="${task.id}"/>
                <div class="form-group">
                    <label class="control-label col-md-3">Nazwa: </label>
                    <div class="col-md-2">
                        <input class="text" class="form-control" name="name" value="${task.name}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Opis: </label>
                    <div class="col-md-4">
                        <%--<input class="text" class="form-control" name="description" value="${task.description}"/>--%>
                        <textarea class="form-control" rows="3" name="description" value="${task.description}">${task.description}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Czy ukonczone: </label>
                    <div class="col-md-7">
                        <input type="radio" class="col-sm-1" name="finished" value="true"/>
                        <div class="col-sm-1"><span class="glyphicon glyphicon-ok green"/></div>
                        <input type="radio" class="col-sm-1" name="finished" value="false" checked/>
                        <div class="col-sm-1"><span class="glyphicon glyphicon-remove red"/></div>
                    </div>
                </div>
                <div class="pull-right">
                    <input type="submit" class="btn btn-primary" value="Save"/>
                </div>
            </form>
        </div>
    </c:when>
</c:choose>










        <script src="static/js/jquery-3.1.1.min.js"></script>
        <script src="static/js/bootstrap.min.js"></script>

        </body>
        </html>