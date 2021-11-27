<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>@yield('name_page')| E-PHARM</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="{{ url('css/themes/lite-purple.min.css')}}" rel="stylesheet" />
    <link href="{{ url('css/plugins/perfect-scrollbar.min.css')}}" rel="stylesheet" />
    <link href="{{ url('css/plugins/jquery.datatables.min.css') }}" rel="stylesheet" />
    <link href="{{ url('css/plugins/buttons.datatables.min.css') }}" rel="stylesheet" />
    <style>
        #propre label  {
            display: -webkit-inline-box !important;
            margin-bottom: 0.5rem;
}

    #tableau td{
       padding: 5px 10px 5px 10px !important;
    }
    </style>

</head>

<body class="text-left">
    <div class="app-admin-wrap layout-horizontal-bar">
        @include('main.layout.header')
        <!-- header top menu end-->
        @include('main.layout.horizontal')
        <!-- =============== Horizontal bar End ================-->
        <div class="main-content-wrap d-flex flex-column">
            <!-- ============ Body content start ============= -->
            <div class="main-content">
                <div class="breadcrumb">
                    <h1 class="mr-2">@yield('name_page')</h1>
                    <ul>
                        <li><a href="{{ route('home.index') }}">Accueil</a></li>
                        <li>@yield('name_page')</li>
                    </ul>
                </div>
                <div class="separator-breadcrumb border-top"></div>
                @yield('content')
                <!-- end of main-content -->
            </div><!-- Footer Start -->
            @include('main.layout.footer')
            <!-- fotter end -->
        </div>
    </div><!-- ============ Search UI Start ============= -->
    @include('main.layout.searchui')
    <!-- ============ Search UI End ============= -->
    <script src="{{ url('js/plugins/jquery-3.3.1.min.js') }}"></script>
    <script src="{{ url('js/plugins/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ url('js/plugins/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ url('js/scripts/script.min.js') }}"></script>
    <script src="{{ url('js/scripts/sidebar-horizontal.script.js') }}"></script>
    <script src="{{ url('js/plugins/echarts.min.js') }}"></script>
    <script src="{{ url('js/scripts/echart.options.min.js') }}"></script>
    <script src="{{ url('js/scripts/dashboard.v1.script.min.js') }}"></script>
    <script src="{{ url('js/scripts/customizer.script.min.js') }}"></script>
    <script src="{{ url('js/plugins/datatables.min.js') }}"></script>
    <script src="{{ url('js/plugins/datatables.buttons.min.js') }}"></script>
    <script src="{{ url('js/scripts/datatables.script.min.js') }}"></script>

    @yield('javascripts')
    
</body>

</html>