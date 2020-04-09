<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::group(['prefix' => '/v1', 'namespace' => 'Api', 'as' => 'api.'], function () {
    //
    Route::resource('product', 'ProductController', ['except' => ['create', 'edit']]);
    Route::resource('all-product', 'ALlProductController');
    Route::resource('product-type', 'ProductTypeController');
    //category
    Route::resource('category', 'ProductCategoryController');
    // type
    Route::resource('type', 'ProductTypeController');
    //color
    Route::resource('color', 'ProductColorController');
    //size
    Route::resource('size', 'ProductSizeController');
    // bill
    Route::resource('bill', 'OrdersController');
    Route::resource('bill-sucess', 'BillSuccessController');
    // customer
    Route::resource('customer', 'CustomerController');
    Route::resource('user', 'UserController');
    Route::resource('tim-kiem', 'SearchController');
    Route::resource('login', 'LoginController');
});
