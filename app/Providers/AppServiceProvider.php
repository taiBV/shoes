<?php

namespace App\Providers;
use App\Product;
use App\ProductCategory;
use App\ProductColor;
use App\ProductType;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer('layouts.core.header',function($view){
            $category=ProductCategory::all();
            $view->with([
                'category'=>$category
            ]);
        });
        view()->composer('layouts.product.sidebar',function($view){
            $category=ProductCategory::all();
            $count_pr=Product::all()->count();
            $color=ProductColor::all();
            $view->with([
                'category'=>$category,'color'=>$color,'count_pr'=>$count_pr,'color'=>$color
            ]);
        });
        Schema::defaultStringLength(191);
    }
}
