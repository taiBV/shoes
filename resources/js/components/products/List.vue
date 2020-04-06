<template>
    <div class="main-content">
                    <div class="container-fluid">
                        <div class="page-header">

                        </div>
                        <div class="row">
                            <!-- Customer overview start -->
                            <div class="col-md-12">
                                <div class="card table-card">
                                    <div class="card-header">
                                        <h3>Danh Sách Sản Phẩm</h3>
                                        <div style="padding-left:700px" class="float-right">
                                           <router-link to="/product/create" tag="button" class="btn btn-primary"> Thêm mới </router-link>
                                        </div>
                                    </div>
                                    <div class="card-block">
                                        <div class="table-responsive">
                                            <table class="table table-hover mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Mã SP</th>
                                                        <th>Giá</th>
                                                         <th>Ngày tạo</th>
                                                        <th>Hành động</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item,index) in listProduct" :key="item.id">
                                                        <td>{{index+1}}</td>
                                                        <td>
                                                            <div class="d-inline-block align-middle">
                                                                <img :src="'/img/' + item.product_image" alt="user image" class="rounded-circle img-40 align-top mr-15">
                                                                <div class="d-inline-block">
                                                                    <h6 class="text-capitalize">{{ item.name }}</h6>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>{{ item.sku }}</td>
                                                        <td>{{ item.price}}</td>
                                                        <td>{{ item.created_at}}</td>
                                                        <td>
                                                             <button @click="clickDelete(item.id,index)" type="button" class="btn btn-danger"><i class="ik ik-info"></i>Xóa</button>
                                                              <button @click="handleEdit(item.id,index)" type="button" class="btn btn-dark"><i class="ik ik-edit-2"></i>Sửa</button>
                                                        </td>

                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Customer overview end -->


                        </div>
                    </div>
                    <notifications group="success" />
                </div>
</template>
<style>
    .icon-delete,.icon-edit{
        font-size: 20px;
    }
    .icon-delete{
        color: red;
    }
    .icon-edit{
         color: burlywood;
    }
</style>
<script>
import {mapActions} from 'vuex';
export default {
    name:'',
    data() {
        return {
            listProduct:[],
        }
    },
    mounted(){

    },
    // call API
    created(){
         var _this= this
         this.$store.dispatch('product/getListProduct',_this);
    },
    methods: {
        handleEdit(id,item){
          this.$router.push('/product/edit/'+id)
        },
        clickDelete(id,index){
              var data={
                _this:this,
                id:id,
                index:index
            };
            // this.$store.dispatch('product/handleDelete',data);

            if(confirm("Bạn có chắc chắn muốn xóa sản phẩm này ? ")){
                axios.delete('/api/v1/product/' + data.id)
                .then(response=> {
                    this.$notify({
                            group: 'success',
                            title: 'Đã xóa sản phẩm',
                            type: 'success',
                            speed: 1000,
                            duration: 500,
                    })
                    data._this.listProduct.splice(data.index,1);
                })
                .catch( (error) =>{
                    console.log(error);
                })
            }
        }
    },
}
</script>
