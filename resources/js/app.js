
require('./bootstrap');
import Notifications from 'vue-notification'
import VueRouter from 'vue-router';
import Vuex from 'vuex'
import store from './store/index'

import routes from './router/index'
window.Vue = require('vue');
window.Vue.use(VueRouter);
window.Vue.use(Vuex);
window.Vue.use(Notifications);
import VueConfirmDialog from "vue-confirm-dialog";

Vue.use(VueConfirmDialog);
const router = new VueRouter({ routes })
const app = new Vue({
    router,store
  }).$mount('#app')
