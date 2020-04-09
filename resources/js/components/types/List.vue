<template>
    <div class="main-content">
                    <div class="container-fluid">
                        <div class="row">

                            <!-- Customer overview start -->
                            <div class="col-md-12">
                                <div class="category card table-card">
                                    <div class="card-header">
                                        <h3>Hãng sản xuất</h3>
                                    </div>
                                    <div class="card-block">
                                        <div class="table-responsive">
                                            <table class="table table-hover mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Hãng sản xuất</th>
                                                         <th>Ngày tạo</th>
                                                        <th>Hành động</th>
                                                       
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item, index) in listType" :key="index">
                                                        <td>{{index+1}}</td>
                                                        <td>
                                                            <div class="d-inline-block align-middle">
                                                               
                                                                <div class="d-inline-block">
                                                                    <h6></h6>
                                                                    <p class="text-muted mb-0">{{ item.name}}</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>{{ item.created_at}}</td>
                                                        <td>
                                                             <button @click="handleDelete(item.id,index)" type="button" class="btn btn-danger"><i class="ik ik-info"></i>Xóa</button>
                                                              <button @click="clickEdit(item.id,index)" type="button" class="btn btn-dark"><i class="ik ik-edit-2"></i>Sửa</button>
                                                         </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</template>
<style>
.toogle-form-add{
    display: flex;
    top:16px;
    position: absolute;
    right: 269px
}
.input-add{
left: 20px

}
    .category{
        width: 90%;
        margin: auto
    }
</style>
<script>
export default {
    name:'type',
    data() {
        return {
                 listType:[],
                categoryByType:'',
              }
    },
    mounted(){
      
    },
    // call API
     async created(){
        // var _this=this;
        // this.$store.dispatch('category/getListCategory',_this)
       let listType= await axios.get('/api/v1/type')
        .then(response=> {
            this.listType=response.data;
        })
        .catch(function (error) {
            console.log('Error :',error);
        });
    },
   methods:{
       handleDelete(id,index){
             if(confirm("Bạn có chắc chắn muốn xóa sản phẩm này ? "))
             {
                axios.delete('/api/v1/type/'+id)
                    .then(response=> {
                        this.$notify({
                                group: 'success',
                                title: 'Đã xóa ',
                                type: 'success',
                                speed: 1000,
                                duration: 500,
                        })  
                        this.listType.splice(index,1);
                    })
                    .catch( (error) =>{
                        console.log(error);
                    })
             }
       },
       clickEdit(id,index){
             this.$router.push('/type/edit/'+id)
       },
   }
   
}
</script>