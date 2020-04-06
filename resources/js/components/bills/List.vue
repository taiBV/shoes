<template>
    <div class="main-content">
        <div class="container-fluid">
            <div class="row">

                <!-- Customer overview start -->
                <div class="col-md-12">
                    <div class="category card table-card">
                        <div class="card-header">
                            <h3>Đơn hàng đang chờ</h3>
                        </div>
                        <div class="card-block">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Tổng đơn</th>
                                        <th>Trạng Thái</th>
                                        <th>Ngày tạo</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(item, index) in listBill" :key="index">
                                        <td>{{index+1}}</td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6></h6>
                                                    <p class="text-muted mb-0">{{ item.sku}}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6></h6>
                                                    <p class="text-muted mb-0">{{ item.total_price}}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6></h6>
                                                    <p v-html="formatStatus(item.status)"></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-inline-block align-middle">
                                                <div class="d-inline-block">
                                                    <h6></h6>
                                                    <p class="text-muted mb-0">{{ item.created_at}}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <button @click="clickConfirm(item.id,index)" type="button"
                                                    class="btn btn-warning"><i class="ik ik-check"></i></button>
                                            <button @click="clickDetail(item.id,index)" type="button"
                                                    class="btn btn-primary"><i class="ik ik-info"></i>Chi tiết
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
    </div>
</template>
<style>
    .toogle-form-add {
        display: flex;
        top: 16px;
        position: absolute;
        right: 269px
    }

    .input-add {
        left: 20px

    }

    .category {
        width: 90%;
        margin: auto
    }
</style>
<script>
    export default {
        name: 'bill',
        data() {
            return {
                listBill: [],
            }
        },
        // call API
        async created() {
            let listBill = await axios.get('/api/v1/bill')
                .then(response => {
                    this.listBill = response.data;
                })
                .catch(function (error) {
                    console.log('Error :', error);
                });

        },
        methods: {
            clickDetail(id, index) {
                this.$router.push('/bill/detail/' + id)
            },
            clickConfirm(id, index) {
                let self = this;
                var data = {
                    sttModify: 2
                };
                axios.patch('/api/v1/bill-sucess/' + id, data)
                    .then(() => {
                        self.$notify({
                            group: 'success',
                            title: 'Chúc mừng',
                            type: 'success',
                            text: 'Bạn  vừa hoàn thành thêm một đơn hàng',
                            speed: 1000,
                            duration: 2000,
                        })

                        self.listBill.splice(index, 1);
                    })
                    .catch(err => {
                        console.log(err)
                    });
            },
            formatStatus(status) {
                var stt = '';
                if (status === '0') {
                    stt = `<span style="width:75px" class="badge badge-warning">Mới</span>`
                } else {
                    stt = `<span style="width:75px" class="badge badge-success">Đã liên hệ</span>`
                }
                return stt;
            }
        }

    }
</script>
