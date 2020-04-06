<?php

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

Route::get('/', 'HomeController@index');
Route::get('/admin2', 'AdminController@login');
Route::get('/dang-nhap', function(){
    return view('admin.login');
});
Route::get('/admin', function(){
    return view('admin.index');
});
Route::post('/dang-nhap', 'AdminController@getLogin');

Auth::routes();
Route::get('sendmail','MailController@basic_email');
Route::get('contact', function () {
    return view('layouts.contact.index');
});
//ajax
Route::get('all-type','ProductTypeController@getAllByAjax');
Route::get('type/{id}','ProductTypeController@getProductByAjax');
//
Route::get('/products','ProductController@getAll');
Route::get('/san-pham/{product}', ['uses' => 'ProductController@detail', 'as' => 'products.detail']);
Route::get('hang-san-xuat/{type}','ProductTypeController@detail');
Route::get('the-loai/{cate}','ProductCategoryController@getProductByCate');
Route::get('/loc-gia/{key}','ProductController@FilterProduct');
Route::get('/tim-kiem', ['uses' => 'SearchController@search', 'as' => 'products.search']);
Route::post('addCode', 'CartController@getAddCode');
Route::post('addcart', ['uses' => 'CartController@getAddCart', 'as' => 'add.cart']);
Route::post('updatecart', ['uses' => 'CartController@updateCart', 'as' => 'update.cart']);
Route::post('deletecart', ['uses' => 'CartController@deletecart', 'as' => 'delete.cart']);
Route::post('destroycart', ['uses' => 'CartController@destroyCart', 'as' => 'destroy.cart']);
Route::get('gio-hang', function () {
    return view('layouts.cart.index');
})->name('checkout');
Route::post('xac-nhan', ['uses' => 'CheckoutController@confirm', 'as' => 'confirm']);

Route::group(['middleware' => ['auth'], 'prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::get('companies', 'CompaniesController@index')->name('companies.index');
});
//comment
Route::get('/list-comment/{id}','CommentController@getComment');
Route::post('/comment','CommentController@postComment');


