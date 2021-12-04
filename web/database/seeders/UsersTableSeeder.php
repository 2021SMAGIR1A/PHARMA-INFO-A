<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        User::truncate();

        $name= [
            'admin',
            'super',
        ];

        $email= [
            'admin@gmail.com',
            'super@gmail.com'
        ];

        for ($i = 0; $i < 2; $i++) {
            User::create([
                'name' => $name[$i],
                'email'=> $email[$i],
                'password' => Hash::make('1234567890') 
            ]);

        }
    }
}
