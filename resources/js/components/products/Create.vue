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
                                                                                <label class="col-sm-4 col-lg-2 col-form-label">Slug</label>
                                                                                <div class="col-sm-8 col-lg-10">
                                                                                        <div class="input-group">
                                                                                                <input v-model="getSlug" disabled type="text" class="form-control">
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
                                                                                                        <label class="input-group-text">đồng</label>
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
                                                                                        <img :src="image" class="img-responsive" height="80" width="90">
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                        <div class="card row">
                                                                                        <div class="card-body">
                                                                                                <div class="mb-2">
                                                                                                        <div>
                                                                                                                <div class="form-group mb-2 mr-sm-2 mb-sm-0">
                                                                                                                        <div class="upload-btn-wrapper">
                                                                                                                                <button class="btnimg">Ảnh sản phẩm</button>
                                                                                                                                <input id="uploadimg" v-on:change="onImageChange" type="file" name="myfile" />
                                                                                                                                </div>
                                                                                                                      
                                                                                                                </div>
                                                                                                        </div>
                                                                                                </div>
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
<style scoped>
.upload-btn-wrapper {
  position: relative;
  overflow: hidden;
  display: inline-block;
}

.btnimg {
 border: 2px solid gray;
    color: gray;
    background-color: white;
    padding: 5px 10px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: bold;
}

.upload-btn-wrapper #uploadimg {
  font-size: 100px;
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0;
}
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
                        slug:'',
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
            getSlug(){
                var name_product=this.product.name;
                var slug=name_product.toLowerCase();
                // 
                slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
                slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
                slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
                slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
                slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
                slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
                slug = slug.replace(/đ/gi, 'd');
                //Xóa các ký tự đặt biệt
                slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
                //Đổi khoảng trắng thành ký tự gạch ngang
                slug = slug.replace(/ /gi, " - ");
                //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
                //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
                slug = slug.replace(/\-\-\-\-\-/gi, '-');
                slug = slug.replace(/\-\-\-\-/gi, '-');
                slug = slug.replace(/\-\-\-/gi, '-');
                slug = slug.replace(/\-\-/gi, '-');
                //Xóa các ký tự gạch ngang ở đầu và cuối
                slug = '@' + slug + '@';
                slug = slug.replace(/\@\-|\-\@|\@/gi, '');
               return  this.product.slug=slug;
            }
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