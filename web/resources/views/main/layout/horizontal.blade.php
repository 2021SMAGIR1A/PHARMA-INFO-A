<div class="horizontal-bar-wrap">
    <div class="header-topnav">
        <div class="container-fluid">
            <div class="topnav rtl-ps-none" id="" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <ul class="menu float-left">
                 
                    <!--end-widgets-->
                    <li>
                        <div>
                            <div>
                                <label class="toggle" for="drop-2">Widgets</label><a href="{{ route('home.index') }}"><i class="nav-icon mr-2 i-Library"></i> Accueil</a>
                            </div>
                        </div>
                    </li>
                    
                    @if (auth()->check())
                        <li>
                            <div>
                                <div>
                                    <label class="toggle" for="drop-2">Widgets</label><a href="{{ route('logout') }}" onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();"><i class="nav-icon mr-2 i-Administrator"></i> Déconnexion</a>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                </div>
                            </div>
                        </li>
                    @else
                    <li>
                        <div>
                            <div>
                                <label class="toggle" for="drop-2">Widgets</label><a href="{{ route('login') }}"><i class="nav-icon mr-2 i-Administrator"></i> Connexion Admin</a>
                            </div>
                        </div>
                    </li>
                    @endif
                    
                    <!--end-datatables-->
                  
                </ul>
            </div>
        </div>
    </div>
</div>