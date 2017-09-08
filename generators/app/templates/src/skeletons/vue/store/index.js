import Vue from 'vue'
import Vuex from 'vuex'
import state from './state'
import * as actions from './actions'
import * as getters from './getters'
import * as mutations from './mutations'

Vue.use(Vuex)

export default new Vuex.Store({ // eslint-disable-line
  actions,
  getters,
  mutations,
  modules: {},
  state
})
