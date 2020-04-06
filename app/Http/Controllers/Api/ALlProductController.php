<?php

namespace App\Http\Controllers\Api;
use App\ProductCategory;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Product;
use App\ProductColor;
use App\ProductSize;
use App\ProductImage;
use App\Bill;
use DB;
class AllProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listProduct = Product::all();
        $listCate = ProductCategory::all();
        $listBill = Bill::all();
        $listBill= DB::table('bills')->orderBy('created_at','DESC')->take(5)->get();
        return [
            'countProduct' => $listProduct->count(),
            'countCate'=>$listCate->count(),
            'countBill'=>$listBill->count(),
            'listBill'=>$listBill
        ];

        /**
         * Show the form for creating a new resource.
         *
         * @return \Illuminate\Http\Response
         */
    }
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

    }
}
