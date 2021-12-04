<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Connexion | Oholiab Group</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="{{ url('css/themes/lite-purple.css') }}" rel="stylesheet" />
</head>
<div class="auth-layout-wrap" style="background-image: url({{ url('img/img/two-pharmacists-doing-inventory-in-a-pharmacy-with-a-digital-tablet.jpg');  }})">
    <div class="auth-content">
        <div class="card o-hidden">
            <div class="row">
                <div class="col-md-6">
                    <div class="p-4">
                        <div class="auth-logo text-center mb-4"><img src="{{ url('img/logop.png') }}" alt=""></div>
                        <h1 class="mb-3 text-18">Connexion</h1>
                        <form method="POST" action="{{ route('checkuser') }}" autocomplete="off"> 
                            @csrf
                            <div class="form-group">
                                <label for="name">Nom d'utilisateur</label>
                                <input class="form-control form-control-rounded @error('name') is-invalid @enderror" id="name"  name="name" type="text" value="{{ old('name') }}" required autocomplete="name" autofocus>
                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="password">Mot de passe</label>
                                <input class="form-control form-control-rounded @error('password') is-invalid @enderror" id="password" name="password" type="password" value="{{ old('password') }}" required autocomplete="password" autofocus>
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <button class="btn btn-rounded btn-primary btn-block mt-2">Se connecter</button>
                        </form>
                        <div class="mt-3 text-center"><a class="text-muted" href="{{ route('home.index') }}">
                                Retour à l'écran d'accueil</u> </a></div>
                    </div>
                </div>
                <div class="col-md-6 text-center" style="background-size: cover;background-image: url({{ url('img/img/connex.jpg')  }});background-position:80% 20%;">
                    {{-- <div class="pr-3 auth-right"><a class="btn btn-rounded btn-outline-primary btn-outline-email btn-block btn-icon-text" href="signup.html"><i class="i-Mail-with-At-Sign"></i> Sign up with Email</a><a class="btn btn-rounded btn-outline-google btn-block btn-icon-text"><i class="i-Google-Plus"></i> Sign up with Google</a><a class="btn btn-rounded btn-block btn-icon-text btn-outline-facebook"><i class="i-Facebook-2"></i> Sign up with Facebook</a></div> --}}
                </div>
            </div>
        </div>
    </div>
</div>