<template>
  <div style="margin-top:77px" class="container">
   <div class="col-md-12">
      <div class="invoice">
         <!-- begin invoice-company -->
         <div class="invoice-company text-inverse f-w-600">
            <span class="pull-right hidden-print">
            <a href="javascript:;" class="btn btn-sm btn-white m-b-10 p-l-5"><i class="fa fa-file t-plus-1 text-danger fa-fw fa-lg"></i> Export as PDF</a>

            </span>
               Đơn hàng : <span style="padding-right:400px" class="text-danger"> {{ bill.sku }}</span>
             Trạng thái :
             <span>
                 <label class="switch">
                     <input v-model="isActiveBtn" :value="isActiveStatus" type="checkbox" @change="changeStatus($event)">
                     <span class="knob"></span>
                     <br>
                     <br>
                 </label>
             </span>
         </div>
         <div class="invoice-header">
            <div class="invoice-from">
               <h4>Thông tin Khách hàng</h4>
               <address class="m-t-5 m-b-5">
                  <strong class="text-inverse">{{customer.name}}</strong><br>
                  <p class="text-invoice">
                        Điện thoại: {{customer.phone}}<br>
                        Email: {{customer.email}} <br>
                        Địa chỉ: {{customer.address}} <br>
                        Note: {{customer.note}}
                  </p>
               </address>
            </div>
            <div class="invoice-to">
               <h4>Hình thức thanh toán</h4>
               <address class="m-t-5 m-b-5">
                     <p class="text-invoice">
                        Vận chuyển : {{bill.shipment}}<br>
                        Thanh toán : {{bill.payment}}
                      </p>
               </address>
            </div>
            <div class="invoice-date">
               <div class="date text-inverse m-t-5">Ngày order</div>
               <div class="invoice-detail">
                  {{ bill.date_order }}<br>
               </div>
            </div>
         </div>
         <!-- end invoice-header -->
         <!-- begin invoice-content -->
         <div class="invoice-content">
            <!-- begin table-responsive -->
            <div class="table-responsive">
               <table class="table table-invoice">
                  <thead>
                     <tr>
                         <th>#</th>
                        <th class="text-center" width="30%">Sản phẩm</th>
                        <th class="text-center" width="20%">Giá</th>
                        <th class="text-center" width="10%">Số lượng</th>
                        <th class="text-right" width="10%">Size</th>
                        <th class="text-right" width="10%">Màu sắc</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr v-for="(item, index) in productsByBill" :key="index">
                         <td>{{index}}</td>
                        <td>
                           <span class="text-inverse">{{item.name}}</span><br>
                        </td>
                        <td class="text-center">{{item.price}}</td>
                        <td class="text-center">{{item.quantity}}</td>
                        <td class="text-right">{{ item.attributes.size}}</td>
                        <td class="text-right">{{ item.attributes.color}}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <!-- end table-responsive -->
            <!-- begin invoice-price -->
            <div class="invoice-price">
               <div class="invoice-price-right">
                  <small>Tổng</small> <span class="f-w-600">{{bill.total_price}}</span>
               </div>
            </div>
            <!-- end invoice-price -->
         </div>
      </div>
   </div>
</div>
</template>
<style>

body{
    margin-top:20px;
    background:#eee;
}
.switch {
    position: relative;
    display: inline-block;
    width: 70px;
    height: 37px;
}
.switch input[type="checkbox"]{
    display:none;
}

.switch input:checked + .knob {
    animation: colorChange 0.4s linear forwards;
}
.switch input:checked + .knob:before {
    animation: turnON 0.4s linear forwards;
}
@keyframes colorChange {
    from { background-color: #ccc;}
    50%{ background-color: #A4D9AD;}
    to {background-color: #4BD663;}
}
@keyframes turnON {
    from { transform: translateX(0px);  }
    to {  transform: translateX(35px );  box-shadow: -10px 0px 44px 0px #434343;}
}
.knob{
    position: absolute;
    top: 23px;
    left: 0;
    right: 0;
    bottom: -23px;
    background-color: #ccc;
    border-radius: 40px;
}

.knob:before {
    position: absolute;
    background-color: white;
    content: "";
    left: 4%;
    top: 11%;
    width: 40%;
    height: 75%;
    border-radius: 50%;
}

.invoice {
    background: #fff;
    padding: 20px
}

.invoice-company {
    font-size: 20px
}
.text-invoice{
    font-size: 16px
}
.invoice-header {
    margin: 0 -20px;
    background: #f0f3f4;
    padding: 20px
}

.invoice-date,
.invoice-from,
.invoice-to {
    display: table-cell;
    width: 1%
}

.invoice-from,
.invoice-to {
    padding-right: 20px
}

.invoice-date .date,
.invoice-from strong,
.invoice-to strong {
    font-size: 20px;
    font-weight: 600
}

.invoice-date {
    text-align: right;
    padding-left: 20px
}

.invoice-price {
    background: #f0f3f4;
    display: table;
    width: 100%
}

.invoice-price .invoice-price-left,
.invoice-price .invoice-price-right {
    display: table-cell;
    padding: 20px;
    font-size: 20px;
    font-weight: 600;
    width: 75%;
    position: relative;
    vertical-align: middle
}

.invoice-price .invoice-price-left .sub-price {
    display: table-cell;
    vertical-align: middle;
    padding: 0 20px
}

.invoice-price small {
    font-size: 12px;
    font-weight: 400;
    display: block
}

.invoice-price .invoice-price-row {
    display: table;
    float: left
}

.invoice-price .invoice-price-right {
    width: 25%;
    background: #2d353c;
    color: #fff;
    font-size: 28px;
    text-align: right;
    vertical-align: bottom;
    font-weight: 300
}

.invoice-price .invoice-price-right small {
    display: block;
    opacity: .6;
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 12px
}

.invoice-footer {
    border-top: 1px solid #ddd;
    padding-top: 10px;
    font-size: 10px
}

.invoice-note {
    color: #999;
    margin-top: 80px;
    font-size: 85%
}

.invoice>div:not(.invoice-footer) {
    margin-bottom: 20px
}

.btn.btn-white, .btn.btn-white.disabled, .btn.btn-white.disabled:focus, .btn.btn-white.disabled:hover, .btn.btn-white[disabled], .btn.btn-white[disabled]:focus, .btn.btn-white[disabled]:hover {
    color: #2d353c;
    background: #fff;
    border-color: #d9dfe3;
}
</style>
<script>
export default {
    data() {
        return {
            bill:null,
            productsByBill:null,
            customer:null,
            isActiveBtn:true
        }
    },
    async created(){
        var idBill=this.$route.params.id;
        // api show bill
       var getBill= await axios.get('/api/v1/bill/' + idBill)
        .then( (response) =>{
            this.bill=response.data;
           this.productsByBill=JSON.parse(this.bill.data);
        })
        .catch( (error) =>{
            console.log(error);
        })
       //api show customer

       var idCustomer=this.bill.customer_id;
       var getCustomer=await axios.get('/api/v1/customer/'+idCustomer)
       .then( (response)=> {
           this.customer=response.data
       })
       .catch( (error) =>{
              console.log(error);
       })
    },
    computed:{
        isActiveStatus(){
               if (this.bill.status==='0'){
                   this.isActiveBtn=false
               }
               else this.isActiveBtn=true
        }
    },
    methods:{
        changeStatus(e){
            let self = this;
            this.$vueConfirm.confirm(
                {
                    auth: false,
                    message: `Bạn có chắc chắn muốn thay đổi trạng thái đơn hàng ?`,
                    button: {
                        no: 'Hủy',
                        yes: 'Đồng ý '
                    }
                },
                function(confirm) {
                    if (confirm == true) {
                        var currStt;
                        if(self.isActiveBtn==true){
                            currStt=1
                        }
                        else {
                            currStt=0
                        }
                        var data={
                            currStt:currStt
                        };
                       axios.patch('/api/v1/bill/' + self.bill.id,data)
                        .then(()=>{
                            self.$notify({
                                group: 'success',
                                title: 'Thành công',
                                type: 'success',
                                text: 'Đã thay đổi trạng thái đơn hàng',
                                speed: 1000,
                                duration: 500,
                            })
                        })
                        .catch(err=>{
                            console.log(err)
                        })
                    }
                    else{
                        self.isActiveBtn=!self.isActiveBtn
                    }
                }
            )

        }
    },

}
</script>
