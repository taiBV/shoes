<template>
    <div class="main-content">
                    <div class="container-fluid">
                        <div class="row clearfix">
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="widget">
                                    <div class="widget-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="state">
                                                <h6>Sản Phẩm</h6>
                                                <h2>{{countProduct}}</h2>
                                            </div>
                                            <div class="icon">
                                                <i class="ik ik-award"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="62" aria-valuemin="0" aria-valuemax="100" style="width: 62%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="widget">
                                    <div class="widget-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="state">
                                                <h6>Thể loại</h6>
                                                <h2>{{countCate}}</h2>
                                            </div>
                                            <div class="icon">
                                                <i class="ik ik-database"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar bg-success" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="widget">
                                    <div class="widget-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="state">
                                                <h6>Đơn hàng</h6>
                                                <h2>{{countBill}}</h2>
                                            </div>
                                            <div class="icon">
                                                <i class="ik ik-shopping-cart"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="31" aria-valuemin="0" aria-valuemax="100" style="width: 31%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <h5>Đơn hàng gần đây</h5>
                                <table id="advanced_table" class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Mã đơn hàng</th>
                                            <th>Tổng đơn</th>
                                            <th>Trạng thái</th>
                                            <th>Ngày tạo</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr v-for="(item,index) in listBill"  :key="index">
                                            <td> {{index+1}}</td>
                                            <td>{{item.sku}}</td>
                                            <td>{{ item.total_price }}</td>
                                            <td>Mới</td>
                                            <td>{{item.created_at}}</td>
                                            <td>
                                                <button @click="clickDetail(item.id,index)" type="button" class="btn btn-primary"><i class="ik ik-info"></i>Chi tiết</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
</template>
<script>
    export  default {
        name:'home',
        data() {
            return {
                countProduct:null,
                countCate:null,
                countBill:null,
                listBill:[]
            }
        },
        created() {
            // get count Product
            axios.get('/api/v1/all-product')
                .then(response=>{
                    this.countProduct=response.data.countProduct
                    this.countCate=response.data.countCate,
                    this.countBill=response.data.countBill,
                        this.listBill=response.data.listBill
                })
                .catch(function (error) {
                    console.log('Error :',error);
                })

        },
        methods:{
            clickDetail(id,index){
                this.$router.push('/bill/detail/'+id)
            }
        }
    }
</script>
