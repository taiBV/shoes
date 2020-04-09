import HomeComponent from '../components/home/HomeComponent.vue'
import DashboardComponent  from '../components/home/DashboardComponent.vue'
import ListProduct from '../components/products/List.vue'
import CreateProduct from '../components/products/Create.vue'
import EditProduct from '../components/products/Edit.vue'
import ListCategory from '../components/categories/List.vue'

import ListType from '../components/types/List.vue'
import CreateType from '../components/types/Create.vue'
import EditType from '../components/types/Edit.vue'
import Bill from '../components/bills/List.vue'
import BillSuccess from '../components/bills/ListSuccess'
import Detail from '../components/bills/Detail.vue'

import ListUser from '../components/users/ListUser'
import Create from '../components/users/Create'
import EditUser from '../components/users/Edit'
const routes = [
    {
        path: '/',
        components: {HomeComponent: HomeComponent},
        children:[
            { path: '', component: DashboardComponent },
            //product
            { path: '/product', component: ListProduct },
            { path: '/product/create', component: CreateProduct },
            { path: '/product/edit/:id?', component: EditProduct },

            //category
            { path: '/category', component: ListCategory },
           // type
           { path: '/type', component: ListType },
           { path: '/type/create', component: CreateType },
           { path: '/type/edit/:id?', component: EditType },
           // bill
           { path: '/bill', component: Bill },
            { path: '/bill-success', component: BillSuccess },
           { path: '/bill/detail/:id?', component: Detail },

           { path: '/user', component: ListUser },
           { path: '/user/create', component: Create },
           { path: '/user/edit/:id?', component: EditUser },
        ]
    },

]

export default routes
