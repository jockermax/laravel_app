<?php

use Illuminate\Support\Facades\Route;
use App\Models\User;
use Illuminate\Support\Facades\DB;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('admin/home', [HomeController::class, 'adminHome'])->name('admin.home')->middleware('is_admin');


Route::put('fill-user-information/{user}', function (User $user, App\Http\Requests\UserPutrequest $request) {
    $updateSuccess = $user->update($request->validated());
    if ($updateSuccess) {
        return response()->json(['success'=> true]);
    } else {
        return response()->json(['success'=> false]);
    }
});

Route::post('submit-feedback/{user}', function (App\Http\Requests\FeedBackRequest $request) {
    $validated = $request->validated();
    $create_feedback = DB::table('feedback')->insertGetId($validated);
    if ($create_feedback) {
        return response()->json(['success'=> true, 'id' => $create_feedback]);
    } else {
        return response()->json(['success'=> false]);
    }
});

Route::get('get-list-formation/', function () {
    $records = DB::table('formations')->select(
        'id',
        'nom_formation',
        'cout_formation',
        DB::raw("
            (CASE
                WHEN periode_cycles_id = 7 THEN 'LICENCE 1'
                WHEN periode_cycles_id = 8 THEN 'LICENCE 2'
                WHEN periode_cycles_id = 9 THEN 'LICENCE 3'
                WHEN periode_cycles_id = 10 THEN 'MASTER 1'
                WHEN periode_cycles_id = 11 THEN 'MASTER 2'
                WHEN periode_cycles_id = 12 THEN 'INGENIEUR'
                ELSE 'AUTRE'
            END) AS cycle
        "),
        DB::raw("
            (CASE
                WHEN departements_id = 1 THEN 'Genie-Informatique'
                WHEN departements_id = 2 THEN 'Reseaux & systemes'
                ELSE 'AUTRE'
            END) AS departement
        ")
    )->orderBy('cycle', 'asc')->orderBy('departement', 'asc')->get();
    return  response()->json($records, JSON_UNESCAPED_UNICODE);
});

Route::post('add-formation/{user}/{formation}', function ($user ,$formation) {
    $formation_validated =  $validate_formations->create($request -> validated());
    if ($formation_validated) {
        return response()->json(['success'=> true, 'id' => $formation_validated-> id]);
    } else {
        return response()->json(['success'=> false]);
    }
});

Route::delete('delete-formation/{user}/{id}', function ($id, $user) {
    $deleted_success = $deleted_validate_formations->where(['id' => $id], ['user', $user])->delete();
    if ($deleted_success) {
        return response()->json(['success'=> true]);
    } else {
        return response()->json(['success'=> false]);
    }
});
