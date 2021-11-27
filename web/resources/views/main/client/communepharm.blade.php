@extends('main.base.main')

@section('name_page')
PHARMACIES {{ $commune }}
@endsection

@section('content')
<div class="row">
    <!-- ICON BG-->
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
            <div class="card-body text-center"><i class="i-Add-User"></i>
                <div class="content">
                    <p class="text-muted mt-2 mb-0">Pharmacies</p>
                    <p class="text-primary text-24 line-height-1 mb-2">{{ sizeof($pharmalist) }}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
            <div class="card-body text-center"><i class="i-Financial"></i>
                <div class="content">
                    <p class="text-muted mt-2 mb-0">Date de fin</p>
                    <p class="text-primary text-24 line-height-1 mb-2">{{ $communes[0]->pharmacies[0]->dateEnd }}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
            <div class="card-body text-center"><i class="i-Checkout-Basket"></i>
                <div class="content">
                    <p class="text-muted mt-2 mb-0">Heure</p>
                    <p class="text-primary text-24 line-height-1 mb-2">24H/24</p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="card card-icon-bg card-icon-bg-primary o-hidden mb-4">
            <div class="card-body text-center"><i class="i-Money-2"></i>
                <div class="content">
                    <p class="text-muted mt-2 mb-0">Communes</p>
                    <p class="text-primary text-24 line-height-1 mb-2">{{ sizeof($communes) }}</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="propre" class="row">
    <div class="col-md-6 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <div class="carousel_wrap">
                    <div class="carousel slide" id="carouselExampleControls" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active"><img class="d-block w-100" src="{{ url('img/313025-5-motivos-para-se-especializar-em-farmacia-hospitalar.jpg') }}" alt="First slide" /></div>
                            <div class="carousel-item"><img class="d-block w-100" src="{{ url('img/iStock-1135377770-scaled.jpg') }}" alt="Second slide" /></div>
                            <div class="carousel-item"><img class="d-block w-100" src="{{ url('img/two-pharmacists-doing-inventory-in-a-pharmacy-with-a-digital-tablet.jpg') }}" alt="Third slide" /></div>
                            
                        </div><a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="sr-only">Next</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 mb-4">
        <div class="card text-left">
            <div class="card-body">
                <h4 class="card-title mb-3">Liste des pharmacies de {{ $commune }}</h4>
                
                <div class="table-responsive">
                    <table class="display table table-striped table-bordered" id="tableau" style="width:100%">
                        <thead>
                            <tr>
                                <th>Pharmacie</th>
                                <th>Début de garde</th>
                                <th>Fin de garde</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                                @forelse ($pharmalist as $item)
                                <tr>
                                    <td>{{ trim($item->label) }}</td>
                                    <td>{{ $item->dateStart }}</td>
                                    <td> {{ $item->dateEnd }}  </td>
                                    <td>
                                        <button class="btn bg-white _r_btn border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="_dot _inline-dot bg-primary"></span><span class="_dot _inline-dot bg-primary"></span><span class="_dot _inline-dot bg-primary"></span></button>
                                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 33px, 0px); top: 0px; left: 0px; will-change: transform;">
                                            <a class="dropdown-item ul-widget__link--font" href="{{ route('pharmacie.detail',['commune'=> $commune,'id'=>$item->_id]) }}"><i class="i-Eye"> </i>Détail</a>    
                                            {{-- <a class="dropdown-item ul-widget__link--font" href="#"><i class="i-Data-Save"> </i> Save</a>
                                            <a class="dropdown-item ul-widget__link--font" href="#"><i class="i-Duplicate-Layer"></i> Import</a> --}}
                                        </div>
                                    </td>
                                </tr>
                                @empty
                                    
                                @endforelse

                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Pharmacie</th>
                                <th>Début de garde</th>
                                <th>Fin de garde</th>
                                <th>Actions</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- end of col-->
  
</div>
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