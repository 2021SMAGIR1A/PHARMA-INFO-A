@extends('main.base.main')

@section('name_page')
Tableau de bord
@endsection

@section('content')

@endsection

@section('javascripts')
<script>
    $(document).ready(function() {
    $('#tableau').DataTable({
        /*"order": [[ 1, "asc" ]],*/
        paging: true,
        searching: true,
        pageLength: 3,
        lengthMenu: [0, 3 , 5, 10, 20, 50, 100, 200, 500],
    } );
} );
</script>
@endsection