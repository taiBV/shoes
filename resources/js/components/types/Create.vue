<template>
    <div class="main-content">
            <div class="container-fluid">
                    <div class="page-header">
                            <div class="row align-items-end">
                                    <div class="col-lg-8">
                                            <div class="page-header-title">
                                                    <i class="ik ik-edit bg-blue"></i>
                                                    <div class="d-inline">
                                                            <h5>Thêm Mới</h5>
                                                            <!-- <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span> -->
                                                    </div>
                                            </div>
                                    </div>
                                   
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                                <form @submit.prevent="saveForm">
                                        <div class="row">
                                                <div class="w-75 m-auto">
                                                        <div class="card">
                                                           <div class="card-body">
                                                                <div class="mb-20">
                                                                        <div class="row">
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">Hãng sản xuất</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                                <span class="input-group-prepend">
                                                                                                        <label class="input-group-text">Name</label>
                                                                                                </span>
                                                                                                <input v-model="type" type="text" class="form-control">
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                         <div class="row type w-100 m-auto">
                                                                                <label>Thể loại</label>
                                                                                <select v-model="idCateSelected" class="select form-control select2">
                                                                                            <option  :value="item.id" v-for="item in listCate" :key="item.id">{{ item.name }}</option>
                                                                                </select>
                                                                          </div>
                                                                </div>
                                                           </div>
                                                        </div>
                                                         <button type="submit" class="button-submit btn btn-info btn-block"> Thêm hãng</button>
                                                </div>
                                        </div>    
                                        
                                 </form>
                        </div>
                      
                        </div>
                    </div>
         </div>
</template>
<style>
.type{
        padding-bottom: 50px
}
label{
        font-weight: bold
}
</style>
<script>
export default {
    name:'',
    data() {
        return {
            type:'',
            listCate:[],
            idCateSelected:''
        }
    },
    created(){
      axios.get('/api/v1/category')
      .then(response=>{
          this.listCate=response.data;
      })
      .catch(function (error) {
          console.log(error);
          
      })
    },
    computed: {
    },
    methods: {
       saveForm(){
         var data={
              name:this.type,
              cate:this.idCateSelected
          }
        
          axios.post('/api/v1/type',data)
          .then(response=> {
              this.$router.push('/type')     
              this.$notify({
                            group: 'success',
                            title: 'Thành công',
                            type: 'success',
                            text: 'Hãng sản xuất đã được thêm mới',
                            speed: 1000,
                                duration: 500,
                    })   
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
              console.log('ERROR',error);
          })
       }
            
    },
}
</script>