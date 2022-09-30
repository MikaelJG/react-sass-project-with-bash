echo '
<div class="navbar navbar-expand-sm navbar-light navbar-lewagon">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/uikit/logo.png" />
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Messages</a>
          </li>
          <li class="nav-item dropdown">
            <img class="avatar dropdown-toggle" id="navbarDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" src="https://kitt.lewagon.com/placeholder/users/ssaunier" />
            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" data-turbo-method="delete" href="#">Log out</a>
            </div>
          </li>
          <!--li class="nav-item"-->
          <!--/li-->
      </ul>
    </div>
  </div>
</div>
' >> index.html

echo '
.navbar-lewagon {
  justify-content: space-between;
  background: white;
}

.navbar-lewagon .navbar-collapse {
  flex-grow: 0;
}

.navbar-lewagon .navbar-brand img {
  width: 40px;
}' >> style.css