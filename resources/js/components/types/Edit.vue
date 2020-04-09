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
                                                <label
                                                    class="col-sm-4 col-lg-2 col-form-label"
                                                    >Hãng sản xuất</label
                                                >
                                                <div class="col-sm-8 col-lg-10">
                                                    <div class="input-group">
                                                        <span
                                                            class="input-group-prepend"
                                                        >
                                                            <label
                                                                class="input-group-text"
                                                                >Name</label
                                                            >
                                                        </span>
                                                        <input
                                                            v-model="type"
                                                            type="text"
                                                            class="form-control"
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row type  w-100 m-auto">
                                                <label
                                                    >Thể loại :
                                                    {{ nameCate }}</label
                                                >
                                                <select v-model="idCateSelected"
                                                    class="select form-control select2"
                                                >
                                                    <option :value="item.id" v-for="(item, index) in listCate" :key="index">{{item.name}}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button
                            type="submit"
                            class="button-submit btn btn-info btn-block"
                        >
                           Sửa
                        </button>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
<style>
.type {
    padding-bottom: 50px;
}
label {
    font-weight: bold;
}
</style>
<script>
export default {
    name: "",
    data() {
        return {
            type: "",
            listCate: [],
            IdCate: "",
            nameCate:"",
            idCateSelected:""
        };
    },
    async created() {
        var id = this.$route.params.id;

        let getIdType = await axios
            .get("/api/v1/type/" + id)
            .then(response => {
                this.IdCate = response.data.product_category_id;
                this.type=response.data.name
            })
            .catch(function(error) {
                console.log(error);
            });

        let getNameCate = await axios
            .get("/api/v1/category/" + this.IdCate)
            .then(response => {
              this.nameCate=response.data.name
              this.idCateSelected=response.data.id
            })
            .catch(function(error) {
                console.log(error);
            });
            
            let getListCate = await axios
            .get("/api/v1/category")
            .then(response => {
                this.listCate=response.data
            })
            .catch(function(error) {
                console.log(error);
            });

    },
    computed: {},
    methods: {
           saveForm(){
                 var id = this.$route.params.id;
                var newType={
                    name:this.type,
                    product_category_id:this.idCateSelected
                }
             axios.patch('/api/v1/type/'+id,newType)
             .then(response =>{
                  this.$router.push('/type')     
                  this.$notify({
                                    group: 'success',
                                    title: 'Thành công',
                                    type: 'success',
                                    speed: 1000,
                                        duration: 500,
                                }) 
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
           }
    }
};
</script>
