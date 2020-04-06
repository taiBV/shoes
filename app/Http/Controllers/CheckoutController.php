<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use Cart;
use App\Customer;
use App\Bill;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Mail;
class CheckoutController extends Controller
{
   public function confirm(Request $request)
   {
        $customer=new Customer();
        $customer->name=$request->name;
        $customer->phone=$request->phone;
        $customer->email=$request->email;
        $customer->address=$request->address;
        $customer->note=$request->note;
        $customer->save();

        foreach (Cart::getContent() as $item) {

            // get value and config
            $str_sku='KA'.'090298'.$customer->id;
            $items_in_cart = Cart::getContent();
            $arr_item['data'] = json_encode($items_in_cart,JSON_UNESCAPED_UNICODE);

            $bill= new Bill();
            $bill->sku=$str_sku;
            $bill->customer_id=$customer->id;
            $bill->data=$arr_item['data'];
            $bill->total_price=Cart::getSubTotal();
            $bill->shipment='Giao hàng tại nhà';
            $bill->payment='Thanh toán sau khi nhận hàng';
            $bill->date_order= Carbon::now('Asia/Ho_Chi_Minh');
        }

       $bill->save();
        // mail
       $name_customer=$request->name;
       $phone_customer=$request->phone;
       $address_customer=$request->address;
       $total=Cart::getSubTotal();
       $data = array('name'=>$name_customer,'address'=>$address_customer,'total'=>$total,'phone'=>$phone_customer);
       Mail::send(['text'=>'layouts.mail'], $data, function($message) {
           $user_mail_to=request()->input('email');
           $message->to($user_mail_to)->subject
           ('The James - Hoàn tất đặt hàng');
           $message->from('chutai3212@gmail.com','The James Shop');
       });
       Cart::clear();
       return redirect('/gio-hang')->with('notifi', 'Cảm ơn quý khách đã đặt hàng , Chúng tôi sẽ sớm liên hệ lại cho bạn !');
   }
}
