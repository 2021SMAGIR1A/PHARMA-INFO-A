<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    //
    public function index()
    {
        // Liste des communes
        $json_communes = file_get_contents('https://duty-pharmacy.herokuapp.com/localities');
        $communes = json_decode($json_communes);

        // Liste des communes
        $json_pharmacies = file_get_contents('https://duty-pharmacy.herokuapp.com/pharmacies');
        $pharmacies = json_decode($json_pharmacies);
        //dd($communes[0]->pharmacies[0]->dateStart);

        return view('main.client.index',compact('communes','pharmacies'));
    }


    public function communepharm($id,$commune)
    {
        // Liste des communes
        $json_communes = file_get_contents('https://duty-pharmacy.herokuapp.com/localities');
        $communes = json_decode($json_communes);

        // Pharma
        $json_pharmacies = file_get_contents('https://duty-pharmacy.herokuapp.com/pharmacies');
        $pharmacies = json_decode($json_pharmacies);

        // Liste des pharmacies
        $json_pharmalist = file_get_contents('https://duty-pharmacy.herokuapp.com/pharmacies/locality/'.$id);
        $pharmalist = json_decode($json_pharmalist);
        //dd($communes[0]->pharmacies[0]->dateStart);

        return view('main.client.communepharm',compact('communes','pharmacies','pharmalist','commune'));
    }


    public function pharmacie($commune,$id)
    {
        // Liste des communes
        $json_communes = file_get_contents('https://duty-pharmacy.herokuapp.com/localities');
        $communes = json_decode($json_communes);

        // Liste des communes
        $json_pharmacies = file_get_contents('https://duty-pharmacy.herokuapp.com/pharmacies');
        $pharmacies = json_decode($json_pharmacies);

        //pharmacie details
        $json_pharmadetail = file_get_contents('https://duty-pharmacy.herokuapp.com/pharmacies/'.$id);
        $pharmadetail = json_decode($json_pharmadetail);
        //dd($communes[0]->pharmacies[0]->dateStart);

        return view('main.client.pharmacie',compact('communes','pharmacies','pharmadetail','commune'));
    }

    

}
