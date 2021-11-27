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


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/', 'App\Http\Controllers\Client\HomeController@index')->name('home.index');

Route::get('/commune/pharmacies/{id}/{commune}', 'App\Http\Controllers\Client\HomeController@communepharm')->name('communepharm.client');

Route::get('/pharmacie/{commune}/{id}', 'App\Http\Controllers\Client\HomeController@pharmacie')->name('pharmacie.detail');
