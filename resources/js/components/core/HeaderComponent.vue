<template>
    <header class="header-top" header-theme="light">
        <div class="container-fluid">
            <div class="d-flex justify-content-between">
                <div class="top-menu d-flex align-items-center">
                    <button type="button" class="btn-icon mobile-nav-toggle"><span></span></button>
                    <div class="header-search d-none">
                        <div class="input-group">
                            <input  @keyup.enter="clickSearch" v-model="key" type="text" class="form-control" placeholder="Tìm sản phẩm ....">
                            <span @click="closeBtnClose" class="input-group-addon search-btn"><i class="ik ik-search"></i></span>
                        </div>
                        <div class="button-close" v-if="isShowBtnClose">
                                <button @click="clickClose" type="button">
                                    <i class="ik ik-x"></i>
                                </button>
                        </div>
                    </div>
                </div>
                <div class="top-menu d-flex align-items-center">
                    <div class="dropdown">
                        <a @click="handleClick" class="dropdown-toggle" role="button"><img style="width:40px;height:40px;right:50px"  class="avatar" src="/img/admin/user.jpg" alt=""></a>
                        <div v-if="isDisplayDropdown" style="display:block" class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/admin"><i class="ik ik-power dropdown-icon"></i>Đăng xuất</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
</template>
<style scoped>
    .button-close{
        width: 30px;
        height: 30px;

    }
    .button-close button{
        border: none;background: #fff;
    }
    .button-close .ik{
         font-size:30px
     }
</style>
<script>
    export default {
        name:'',
        data() {
            return {
                isShowBtnClose:false,
                isDisplayDropdown:false,
                key:'',
                isShowListSearch:false,
                isShowBtnSearch:true
            }
        },
        methods: {
            handleClick(){
                this.isDisplayDropdown=!this.isDisplayDropdown
            },
            clickClose(){
                 this.isShowBtnClose=false
                this.$emit("handleClose");
            },
            closeBtnClose(){
                this.isShowBtnClose=true
            },
            clickSearch(){
                this.isShowBtnClose=true;
                axios.get('/api/v1/tim-kiem/'+ this.key )
                    .then(response=>{
                        this.isShowListSearch=true;
                        var listSearch=response.data;
                        var data={
                            listSearch:listSearch,
                            isShowListSearch:this.isShowListSearch,
                            keyData:this.key
                        };
                        this.$emit("handleSearch",data);
                    })
                    .catch(
                        err=>{
                            console.log(err)
                        }
                    )
            }
        },
    }
</script>
