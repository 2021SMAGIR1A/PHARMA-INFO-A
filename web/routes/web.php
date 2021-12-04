<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('main.base.main');
});*/


/*Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});*/

//Liste des modules
Route::middleware('auth')->group(function(){
    Route::get('/dashboard', 'App\Http\Controllers\Admin\DashboardController@index')->name('dashboard.index');
});

Route::middleware(['guest'])->group(function(){
    //Route::view('login', 'main.user.login')->name('login');
    //Route::view('/register', '')->name('register');
    Route::post('/checkuser', 'App\Http\Controllers\Client\UserController@checkuser')->name('checkuser');
});

Route::get('/', 'App\Http\Controllers\Client\HomeController@index')->name('home.index');

Route::get('commune/pharmacies/{id}/{commune}', 'App\Http\Controllers\Client\HomeController@communepharm')->name('communepharm.client');

Route::get('{commune}/{id}', 'App\Http\Controllers\Client\HomeController@pharmacie')->name('pharmacie.detail');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
