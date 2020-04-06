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
                                <form @submit.prevent="saveForm" enctype="multipart/form-data">
                                        <div class="row">
                                                <div class="col-md-8">
                                                        <div class="card">
                                                           <div class="card-body">
                                                                <div class="mb-20">
                                                                        <div class="row">
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">Tên Sản Phẩm</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                                <span class="input-group-prepend">
                                                                                                        <label class="input-group-text">Name</label>
                                                                                                </span>
                                                                                                <input v-model="product.name"  type="text" class="form-control">
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        <div class="row">
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">SKU</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                                <input v-model="product.sku" type="text" class="form-control">
                                                                                                <span class="input-group-append">
                                                                                                        <label class="input-group-text"><i class="ik ik-wifi"></i></label>
                                                                                                </span>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        <div class="row">
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">Giá</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                                <span class="input-group-prepend">
                                                                                                        <label class="input-group-text">$</label>
                                                                                                </span>
                                                                                                <input v-model="product.price" type="text" class="form-control" placeholder="VND">
                                                                                                <span class="input-group-append">
                                                                                                        <label class="input-group-text">.20</label>
                                                                                                </span>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        <div class="row">
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">Khuyến mại</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                                <span class="input-group-prepend" id="basic-addon2">
                                                                                                        <label class="input-group-text">%</label>
                                                                                                </span>
                                                                                                <input v-model="product.sale" type="text" class="form-control">
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        
                                                                        <div class="row">
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">Nội Dung</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                                <textarea v-model="product.body" id="body-create" rows="4" cols="50"> </textarea>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        <div class="row">
                                                                                 <label class="col-sm-4 col-lg-2 col-form-label">Hình ảnh</label>
                                                                                <div class="col-md-3" v-if="image">
                                                                                        <img :src="image" class="img-responsive" height="70" width="90">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <div class="card row">
                                                                                        <div class="card-body">
                                                                                                        <div class="col-10" v-for="(item, index) in countUpload" :key="index">
                                                                                                                <div class="mb-2">
                                                                                                                        <div>
                                                                                                                                <div class="form-group mb-2 mr-sm-2 mb-sm-0">
                                                                                                                                        <input type="file" v-on:change="onImageChange" class="form-control">
                                                                                                                                </div>
                                                                                                                        </div>
                                                                                                                </div>
                                                                                                        </div>
                                                                                                     <button type="button" @click="clickAddImage()" class="btn btn-success btn-icon ml-2 mb-2 col-2"><i class="ik ik-plus"></i></button>
                                                                                        </div>
                                                                                </div>
                                                                                </div>
                                                                          </div>
                                                                </div>
                                                           </div>
                                                        </div>
                                                 </div>
                                                <div class="col-md-4">
                                                        <div class="card">
                                                                <div class="card-body">
                                                                        <div class="mb-20">
                                                                                <div class="row">
                                                                                        <div class="col-md-6">
                                                                                                <h4 class="sub-title">Màu sắc</h4>
                                                                                                <div id="checkboxColor" class="border-checkbox-section">
                                                                                                        <div v-for="item in colors" :key="item.id">
                                                                                                                <input class="checkbox" :id="item.id" :value="item" v-model="selectedColor"  type="checkbox" >
                                                                                                                <label class="border-checkbox-label">{{ item }}</label>
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                
                                                                                        <div class="col-md-6">
                                                                                                <h4 class="sub-title">Size</h4>
                                                                                                <div id="checkboxSize">
                                                                                                        <div v-for="item in sizes" :key="item.id" class="border-checkbox-group border-checkbox-group-primary">
                                                                                                                <input class="checkbox" :id="item.id" :value="item" v-model="selectedSize" type="checkbox">
                                                                                                                <label class="border-checkbox-label" >{{ item }}</label>
                                                                                                        </div>
                                                                                                </div>    
                                                                                        </div>
                                                                                        
                                                                                </div>
                                                                                <div class="row type">
                                                                                        <label>Hãng sản xuất</label>
                                                                                        <select v-model="product.type" class="select form-control select2">
                                                                                                 <option  :value="item.id" v-for="item in listType" :key="item.id">{{ item.name }}</option>
                                                                                        </select>
                                                                                </div>

                                                                                <div class="row">
                                                                                        <label class="col-sm-4 col-lg-2 col-form-label">Tóm Tắt</label>
                                                                                        <div class="col-sm-8 col-lg-10">
                                                                                                <div class="input-group">
                                                                                                        <textarea v-model="product.excerpt" id="excerpt" rows="4" cols="60"> </textarea>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                        <label class="col-sm-4 col-lg-2 col-form-label">Mô tả</label>
                                                                                        <div class="col-sm-8 col-lg-10">
                                                                                                <div class="input-group">
                                                                                                        <textarea v-model="product.description" id="description" rows="4" cols="60"> </textarea>
                                                                                                </div>
                                                                                        </div>
                                                                                </div>

                                                                                <div class="row">
                                                                                        <h4 class="sub-title">Trạng thái</h4>
                                                                                        <input type="checkbox" class="js-single" checked />
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
.checkbox{
        width: 15px;
        height: 15px;
}
.button-submit{
                 width: 300px;
                text-align: center;
                margin: auto;
}
.type{
        padding-bottom: 50px
}
label{
        font-weight: bold
}
.sub-title{
        font-weight: bold
}
.select{
        background: oldlace
}
</style>
<script>
export default {
    name:'',
    data() {
        return {
             listType:[],
             product:{
                        type:'',
                        sku:'',
                        name:'',
                        price:'',
                        sale:'',
                        excerpt:'',
                        description:'',
                        body:'',
             },
             colors:['Đen','Trắng','Lam','Đỏ','Vàng','Hồng','Lục'],
             sizes:[38,39,40,41,42,43],
             selectedColor:[],
             selectedSize:[],
             image:'',
             countUpload: 1
        }
    },
    created(){
        var data  = this
          this.$store.dispatch('product/getListType',data);
    },
    mounted(){
       this.getCkeditor();
    },
    computed: {
    },
    methods: {
            clickAddImage(){
                          this.countUpload += 1;
                          if(this.countUpload>5){
                                  this.$notify({
                                       group: 'success',
                                        title: 'Chỉ được thêm tối đa 5 ảnh',
                                        type: 'danger',
                                        speed: 1000,
                                         duration: 500,
                                }) 
                                 this.countUpload=5
                          } 
            },
           onImageChange(e) {
                let files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                this.createImage(files[0]);
            },
             createImage(file) {
                let reader = new FileReader();
                let vm = this;
                reader.onload = (e) => {
                    vm.image = e.target.result;
                };
                reader.readAsDataURL(file);
            },
            saveForm(){
                var app =this;
                var newProduct ={
                        product:app.product,
                        size:app.selectedSize,
                        color:app.selectedColor,
                        image:app.image
                } ;
                console.log('NEw product',newProduct)
                axios.post('/api/v1/product',newProduct)
                        .then((response)=>{
                              this.$notify({
                                       group: 'success',
                                        title: 'Thành công',
                                        type: 'success',
                                        text: 'Sản phẩm đã được thêm mới',
                                        speed: 1000,
                                         duration: 500,
                                })   
                        })
                        .catch((error)=>{
                                console.log('Error');
                                 this.$notify({
                                        group: 'success',
                                        title: 'Có lỗi xảy ra !',
                                        type: 'warn',
                                        text: 'Vui lòng kiểm tra hoặc nhập lại',
                                        speed: 500,
                                        duration: 10000,
                                })     
                        });
        },
         getCkeditor(){
            CKEDITOR.replace('body-create');
        },
    },
}
</script>