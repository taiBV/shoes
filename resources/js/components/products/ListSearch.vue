<template>
    <div class="main-content">
        <div class="container-fluid">
            <div class="page-header">

            </div>
            <div class="row">
                <!-- Customer overview start -->
                <div class="col-md-12">
                    <div class="card table-card">
                        <div class="card-header">

                            <h3 v-if="getCountSearch>0">Tìm thấy {{getCountSearch}} sản phẩm thuộc  <b>{{getKeySearch}}</b> </h3>
                            <h3 v-else>Không tìm thấy sản phẩm thuộc  <b>{{getKeySearch}}</b> </h3>
                        </div>
                        <div class="card-block">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Mã SP</th>
                                        <th>Giá</th>
                                        <th>Ngày tạo</th>
                                        <th>Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(item,index) in getListSearch" :key="item.id">
                                        <td>{{index+1}}</td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <img :src="'/img/' + item.product_image" alt="user image"
                                                     class="rounded-circle img-40 align-top mr-15">
                                                <div class="d-inline-block">
                                                    <h6 class="text-capitalize" v-html="formatName(item.name)"></h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>{{ item.sku }}</td>
                                        <td>{{ item.price}}</td>
                                        <td>{{ item.created_at}}</td>
                                        <td>
                                            <button @click="handleDelete(item.id,index)" type="button"
                                                    class="btn btn-danger"><i class="ik ik-info"></i>Xóa
                                            </button>
                                            <button @click="handleEdit(item.id,index)" type="button"
                                                    class="btn btn-dark"><i class="ik ik-edit-2"></i>Sửa
                                            </button>
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
        <notifications group="success"/>
    </div>

</template>

<script>
    import {mapGetters, mapState} from 'vuex'
    export default {
        name: "ListSearch",
        data() {
            return {

            }
        },
        methods:{
            formatName(name){
                return name.toLowerCase().split(this.getKeySearch.toLowerCase()).join(`<mark class="p-0">${this.getKeySearch}</mark>`);
            }
        },
        computed:{
            ...mapGetters("product", [
                "getListSearch","getKeySearch"
            ]),
            getCountSearch(){
                return this.getListSearch.length;
            },

        }

    }
</script>

<style scoped>
mark{
    padding: 0;
}
</style>
