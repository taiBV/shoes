<template>
    <div class="main-content">
                    <div class="container-fluid">
                        <div class="row">

                            <!-- Customer overview start -->
                            <div class="col-md-12">
                                <div class="category card table-card">
                                    <div class="card-header">
                                        <h3>Thể Loại</h3>
                                        <div v-if="isEdit==false" class="toogle-form-add">
                                             <button type="button" @click="clickAdd" class="btn btn-primary">{{ isShowFormAdd ? 'Đóng' : 'Thêm mới' }}</button>
                                               <div class="row" v-if="isShowFormAdd">
                                                    <div class="col-sm-12 input-add">
                                                        <div class="input-group input-group-button">
                                                            <input v-model="nameCate" type="text" class="form-control" placeholder="Tên thể loại">
                                                            <div class="input-group-append">
                                                                <button @click="handleCreate" class="btn btn-primary" type="button">Thêm</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                       <div v-if="isEdit" class="toogle-form-add">
                                         <button type="button" @click="closeEdit" class="btn btn-primary">Đóng</button>
                                         <div  class="row">
                                            <div class="col-sm-12 input-add">
                                                <div class="input-group input-group-button">
                                                    <input v-model="categoryEdit.name" type="text" class="form-control">
                                                    <div class="input-group-append">
                                                        <button @click="handleEdit" class="btn btn-primary" type="button">Sửa</button>
                                                    </div>
                                                </div>
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
                                                        <th>Tên thể loại</th>
                                                         <th>Ngày tạo</th>
                                                        <th>Hành động</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item, index) in listCategory" :key="index">
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
                     <notifications group="success" />
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
    name:'category',
    data() {
        return {
                categoryEdit:{
                    id:null,
                    name:'',
                },
                isShowFormAdd:false,
                isEdit:false,
                nameCate:'',
                 listCategory:[]
              }
    },
    mounted(){

    },
    // call API
    created(){
        var _this=this;
        this.$store.dispatch('category/getListCategory',_this)
    },
    computed: {

    },
    methods: {
        clickEdit(id,index){
            this.isEdit=true;
            this.categoryEdit.id=id;
            var _this=this;
            axios.get('/api/v1/category/'+id)
            .then(function (response) {
                 _this.categoryEdit.name=response.data.name;
            })
            .catch(function (error) {
                console.log('error:',error);
            })
        },
        handleCreate(){
             var newCategory={
                name:this.nameCate,
            }
            axios.post('/api/v1/category',newCategory)
             .then(response=> {
                    this.$notify({
                        group: 'success',
                        title: 'Thành công',
                        type: 'success',
                        text: 'Thể loại đã được thêm mới',
                        speed: 1000,
                        duration: 500,
                    });
                    this.listCategory.push(response.data);
                    this.nameCate='';
                    this.isShowFormAdd=false;
            })
            .catch(error=>{
                this.$notify({
                    group: 'success',
                    title: 'Có lỗi xảy ra !',
                    type: 'warn',
                    text: 'Vui lòng kiểm tra dữ liệu hoặc nhập lại',
                    speed: 500,
                    duration: 10000,
              })
            })

        },
        handleEdit(){
            var _this=this;
            var newCategory=_this.categoryEdit;
             axios.patch('/api/v1/category/'+ _this.categoryEdit.id,newCategory)
             .then(response =>{
                  this.$notify({
                                    group: 'success',
                                    title: 'Thành công',
                                    type: 'success',
                                    speed: 1000,
                                        duration: 500,
                                });
                              
                                
             })
             .catch( error=> {
                    this.$notify({
                                        group: 'success',
                                        title: 'Có lỗi xảy ra !',
                                        type: 'warn',
                                        text: 'Vui lòng kiểm tra hoặc nhập lại',
                                        speed: 500,
                                        duration: 10000,
                                })
             })
             this.isEdit=false;
        },
       clickAdd(){
           this.isShowFormAdd=!this.isShowFormAdd
       },
       closeEdit(){
           this.isEdit=false
       },
        handleDelete(id,index){
            var data={
                _this:this,
                id:id,
                index:index
            }
           if(confirm("Bạn có chắc chắn muốn xóa  ? "))
           {
                axios.delete('/api/v1/category/' + data.id)
                    .then((response)=> {
                        this.$notify({
                            group: 'success',
                            title: 'Đã xóa !!',
                            type: 'success',
                            speed: 1000,
                            duration: 500,
                       })
                        data._this.listCategory.splice(data.index,1)
                    })
                    .catch( (error)=> {
                        console.log(error);

                    })
           }
        }
    },
}
</script>
