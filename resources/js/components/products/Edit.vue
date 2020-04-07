<template>
    <div class="main-content">
            <div class="container-fluid">
                    <div class="page-header">
                            <div class="row align-items-end">
                                    <div class="col-lg-8">
                                            <div class="page-header-title">
                                                    <i class="ik ik-edit bg-blue"></i>
                                                    <div class="d-inline">
                                                            <h5>Sửa</h5>
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
                                                                                                        <label class="input-group-text">đ</label>
                                                                                                </span>
                                                                                                <input v-model="product.price" type="text" class="form-control" placeholder="VND">
                                                                                                <span class="input-group-append">
                                                                                                        <label class="input-group-text">đồng</label>
                                                                                                </span>
                                                                                        </div>
                                                                                </div>
                                                                        </div>
                                                                        <div class="row">
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">Khuyến mại</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                               <span class="input-group-prepend">
                                                                                                        <label class="input-group-text">đ</label>
                                                                                                </span>
                                                                                                <input v-model="product.price_sale" type="text" class="form-control" placeholder="VND">
                                                                                                <span class="input-group-append">
                                                                                                        <label class="input-group-text">đồng</label>
                                                                                                </span>
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
                                                                                        <input type="file" v-on:change="onImageChange" class="form-control">
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
                                                                                                <h4 class="sub-title">Màu sắc:
                                                                                                    <span id="color" v-for="(item, index) in selectedColor" :key="index">{{item}} + </span>
                                                                                                </h4>
                                                                                                <div id="checkboxColor" class="border-checkbox-section">
                                                                                                        <div v-for="(color, index) in colors" :key="index" >
                                                                                                                <input :value="color"  v-model="selectedColor"  type="checkbox" >
                                                                                                                <label class="border-checkbox-label">{{color}}</label>
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>
                                                                                
                                                                                        <div class="col-md-6">
                                                                                                <h4 class="sub-title">Size :
                                                                                                     <span id="color" v-for="(item, index) in selectedSize" :key="index">{{item}} + </span>
                                                                                                </h4>
                                                                                                <div id="checkboxSize">
                                                                                                        <div v-for="(size, index) in sizes" :key="index"  class="border-checkbox-group border-checkbox-group-primary">
                                                                                                                <input :value="size" v-model="selectedSize" type="checkbox">
                                                                                                                <label class="border-checkbox-label" >{{size}}</label>
                                                                                                        </div>
                                                                                                </div>    
                                                                                        </div>
                                                                                        
                                                                                </div>
                                                                                <div class="row type">
                                                                                        <label>Hãng sản xuất : <span>{{ selectedType }}</span></label>
                                                                                        <select v-model="selectedType" class="select form-control select2">
                                                                                                 <option   v-for="item in listType" :key="item.id">{{ item.name }}</option>
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
                                         <button type="submit" class="button-submit btn btn-info btn-block"> Sửa sản phẩm</button>
                                 </form>
                        </div>
                      
                        </div>
                    </div>
                 <notifications group="success" />
                 <notifications group="error" />
                 
         </div>
</template>
<style>
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
#color{
    color:mediumblue
}
</style>
<script>
export default {
    name:'',
    data() {
        return {
         product_id : this.$route.params.id,
             product:{
                        type:'',
                        sku:'',
                        name:'',
                        price:'',
                        price_sale:'',
                        excerpt:'',
                        description:'',
                        body:'',
             },
             listType:[],
             selectedType:'',
             product_type_id:'',
             colors:['Đen','Trắng','Lam','Đỏ','Vàng','Hồng','Lục'],
             sizes:[38,39,40,41,42,43],
             selectedColor:[],
             selectedSize:[],
             image:'',
        }
    },
     async created(){
           var _this  = this
           var product_id = this.$route.params.id
        // get product by ID
        let typeByID = await axios.get('/api/v1/product/' + product_id)
                .then( response=> {
                    this.product=response.data;
                    // set selectedType
                    this.product_type_id=response.data.product_type_id
                })
                .catch(function (error) {
                });
         // get type by ID
          this.$store.dispatch('product/getTypeByID',_this);
          // get color by id_product
          axios.get('/api/v1/color/'+ product_id)
            .then(function (response) {
                    for (let index = 0; index < response.data.length; index++) {
                        const element = response.data[index].color;
                        _this.selectedColor.push(element)
                    }
            })
            .catch(function (error) {
                console.log('Error:',error);
            })
            
             // get size by id_product
          axios.get('/api/v1/size/'+ product_id)
            .then(function (response) {
                    for (let index = 0; index < response.data.length; index++) {
                        const element = response.data[index].size;
                        _this.selectedSize.push(element)
                    }
            })
            .catch(function (error) {
                console.log('Error:',error);
            })
            
        // get API list Type 
          this.$store.dispatch('product/getListType',_this);
    },
    mounted(){
       this.getCkeditor();
    },
    methods: {
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
                console.log('NEw product Edit',newProduct)
                axios.patch('/api/v1/product/'+this.product_id,newProduct)
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
                                         group: 'error',
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