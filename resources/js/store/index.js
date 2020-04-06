
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)


import state from './state'
import getters from './getters'
import mutations from './mutations'
import actions from './actions'
import moduleProduct from './module/product/index'
import moduleCategory from './module/category/index'
const store = new Vuex.Store({
    state,
    getters,
    actions,
    mutations,
    modules:{
        product:moduleProduct,
        category:moduleCategory
    }
  })
// console.log('state ô',store.state.product);

  export default store
