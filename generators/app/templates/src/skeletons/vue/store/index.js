import Vue from 'vue'
import Vuex, { Store } from 'vuex'
import state from './state'
import * as actions from './actions'
import * as getters from './getters'
import * as mutations from './mutations'

Vue.use(Vuex)

export default new Store({
  actions,
  getters,
  mutations,
  modules: {},
  state
})
