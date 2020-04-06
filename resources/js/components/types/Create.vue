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
                                    <div class="col-lg-4">
                                            <nav class="breadcrumb-container" aria-label="breadcrumb">
                                                    <ol class="breadcrumb">
                                                            <li class="breadcrumb-item">
                                                                    <a href="../index.html"><i class="ik ik-home"></i></a>
                                                            </li>
                                                            <li class="breadcrumb-item"><a href="#">Forms</a></li>
                                                            <li class="breadcrumb-item active" aria-current="page">Group Add-Ons</li>
                                                    </ol>
                                            </nav>
                                    </div>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                                <form @submit.prevent="saveForm">
                                        <div class="row">
                                                <div class="col-md-8">
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
                                                                         <div class="row type">
                                                                                <label>Thể loại</label>
                                                                                <select v-model="idCateSelected" class="select form-control select2">
                                                                                            <option  :value="item.id" v-for="item in listCate" :key="item.id">{{ item.name }}</option>
                                                                                </select>
                                                                          </div>
                                                                </div>
                                                           </div>
                                                        </div>
                                                </div>
                                        </div>    
                                         <button type="submit" class="button-submit btn btn-info btn-block"> Thêm sản phẩm</button>
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
              this.$notify({
                            group: 'success',
                            title: 'Thành công',
                            type: 'success',
                            text: 'Hãng sản xuất đã được thêm mới',
                            speed: 1000,
                                duration: 500,
                    })   
          })
          .catch(function (error) {
              console.log('ERROR',error);
              
          })
       }
            
    },
}
</script>