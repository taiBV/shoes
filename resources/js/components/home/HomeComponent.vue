<template>
    <div>
        <div class="wrapper">
            <!-- <template v-if="isLogin">
                <div>
                    <login /> 
                </div>
            </template> -->
            <template>
                <HeaderComponent @handleSearch="handleSearch" @handleClose="handleClose"></HeaderComponent>
                <div class="page-wrap">
                    <div>
                            <NavigationComponent></NavigationComponent>
                            <template v-if="isShowListSearch">
                                <list-search />
                            </template>
                            <template v-if="isShowView">
                                <router-view></router-view>
                            </template>
                            <FooterComponent></FooterComponent>
                    </div>
                </div>
            </template>
            </div>
        <notifications group="success" />
        <vue-confirm-dialog></vue-confirm-dialog>
    </div>
</template>
<script>

import FooterComponent from '../core/FooterComponent'
import HeaderComponent from '../core/HeaderComponent'
import NavigationComponent from '../core/NavigationComponent'
import DashboardComponent from '../home/DashboardComponent'
import ListSearch from "../products/ListSearch";
import Login from "../login/LoginComp";
import { mapState } from 'vuex'

export default {
    name:'',
    data() {
        return {
          isShowListSearch:false,
            isShowView:true,
            listSearch:[],
        }
    },
    components:{
        ListSearch,
        FooterComponent,HeaderComponent,NavigationComponent,DashboardComponent,Login
    },
    computed:{
         ...mapState([
             'isLogin'
         ]),
    },
    methods:{
        handleSearch(data){
           this.isShowListSearch=true;
            this.isShowView=false;
           var data2={
               isShowListSearch:this.isShowListSearch,
               listSearch:data.listSearch,
               key:data.keyData
           };
            this.$store.dispatch('product/getListSearch',data2);
        },
        handleClose(){
            console.log('click Close active');
            this.isShowListSearch=false;
            this.isShowView=true;
        }

    }
}
</script>
