<template>
    <div class="main-content">
                    <div class="container-fluid">
                        <div class="page-header">
                            <p style="color:red">Note :Lỗi hiển thị hình ảnh do sản phẩm sau khi upload một khoảng thời gian
                              bị  heroku tự động xóa để giảm bớt dung lượng ! </p>
                        </div>
                        <div class="row">
                            <!-- Customer overview start -->
                            <div class="col-md-12">
                                <div class="card table-card">
                                    <div class="card-header">
                                        <h3>Danh Sách Sản Phẩm</h3>
                                        <div style="padding-left:500px" class="float-right">
                                            <div class="input-group mb-3" style="width:400px">
                                                 <input v-model="strSearch" type="text" class="form-control" placeholder="Tìm kiếm ...">
                                                <div class="input-group-prepend">
                                                     <router-link to="/product/create" tag="button" class="btn btn-primary"> Thêm mới </router-link>
                                                </div>
                                               
                                                </div>
                                          
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
                                                <tbody v-if="listProductSearch.length!=0">
                                                    <tr v-for="(item,index) in listProductSearch" :key="item.id">
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
                                                <tbody v-else>
                                                   <h5 class="mt-4 ml-4"> Không tìm thấy sản phẩm phù hợp </h5>
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
            strSearch:'',
        }
    },
    mounted(){

    },
    // call API
    created(){
         var _this= this
         this.$store.dispatch('product/getListProduct',_this);
    },
    computed: {
        listProductSearch(){
            var newListProduct=[];
            const {strSearch}=this;
            this.listProduct.forEach(item=>{
                if(item.name.toLowerCase().includes(strSearch.toLowerCase())){
                    newListProduct.push(item);
                }  
            });
          
            return newListProduct;
        }
    },
    methods: {
        handleSearch(e){
            console.log(e.target.value);
            
        },
        handleEdit(id,item){
          this.$router.push('/product/edit/'+id)
        },
        clickDelete(id,index){
              var data={
                _this:this,
                id:id,
                index:index
            };
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
