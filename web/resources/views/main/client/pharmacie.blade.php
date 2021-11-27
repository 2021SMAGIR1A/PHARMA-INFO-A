@extends('main.base.main')

@section('name_page')
    PHARMACIE {{ $commune }}
@endsection

@section('content')
<section class="ul-product-detail">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="ul-product-detail__image"><img src="{{ url('img/iStock-1036134078-scaled.jpg') }}" alt="alt" /></div>
                        </div>
                        <div class="col-lg-7">
                            <div class="ul-product-detail__brand-name mb-4">
                                <h3 class="heading">{{ str_replace(array("PHCIE"),array("PHARMACIE"),$pharmadetail->label) }} <strong style="color:orangered">({{$commune}})</strong></h3><span class="text-mute">Ouvert</span>
                            </div>
                            
                            <!--
        <div class="ul-product-detail__rating">
                                                        <ul>
                                                            <li></li>
                                                        </ul>
                                                    </div> 
        -->
                            <div class="ul-product-detail__features mt-4">
                                <h4 class="font-weight-700">Caractéristiques du produit:</h5>
                                <ul class="m-0 p-0">
                                    <div class="ul-widget-app__browser-list-1 mb-2 mt-4"><i class="i-Spell-Check text-white teal-500 rounded-circle p-2 mr-3"></i><span class="text-15"><strong>SITUATION GÉOGRPAHIQUE :</strong> {{$pharmadetail->location }} </span><span class="text-mute" style="display: none">2 April </span></div>
                                    <div class="ul-widget-app__browser-list-1 mb-2"><i class="i-Check text-white teal-500 rounded-circle p-2 mr-3"></i><span class="text-15"><strong>GÉRANT :</strong> {{ $pharmadetail->director }}</span><span class="text-mute" style="display: none">2 April </span></div>
                                    <div class="ul-widget-app__browser-list-1 mb-2"><i class="i-Check text-white teal-500 rounded-circle p-2 mr-3"></i><span class="text-15"><strong>TÉLÉPHONE :</strong> {{ $pharmadetail->tel }}</span><span class="text-mute" style="display: none">2 April </span></div>
                                    <div class="ul-widget-app__browser-list-1 mb-2"><i class="i-Check text-white teal-500 rounded-circle p-2 mr-3"></i><span class="text-15"><strong>DATE DE DEBUT :</strong> {{ $pharmadetail->dateStart}}</span><span class="text-mute" style="display: none">2 April </span></div>
                                    <div class="ul-widget-app__browser-list-1 mb-2"><i class="i-Check text-white teal-500 rounded-circle p-2 mr-3"></i><span class="text-15"><strong>DATE DE FIN :</strong> {{ $pharmadetail->dateEnd }}</span><span class="text-mute" style="display: none">2 April </span></div>
                                
                                </ul>
                            </div>
                            <div class="ul-product-detail__quantity d-flex align-items-center mt-3">
                                @php
                                    $local = "https://www.google.com/maps/search/?q=";
                                    $local = $local.$commune." ".str_replace(array("PHCIE"),array("PHARMACIE"),$pharmadetail->label);
                                @endphp
                                
                                <a href="{{ $local }}" target="_blank"><button class="btn btn-primary btn-xl btn-icon m-1" type="button"><span class="ul-btn__icon"><i class="i-Map2"></i></span><span class="ul-btn__text"> <strong>Localisation map</strong></span></button></a>
                                <a href="{{ URL::previous() }}"><button class="btn btn-danger btn-xl btn-icon m-1" type="button"><span class="ul-btn__icon"><i class="i-Back1"></i></span><span class="ul-btn__text"> <strong>Retour aux pharmacies  </strong></span></button></a>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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