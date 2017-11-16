import Vue from 'vue'
import App from './App'
import router from './router'
import {store} from './store'
import VModal from 'vue-js-modal'
import iView from 'iview'
import enLocale from 'iview/src/locale/lang/en-US'
import 'iview/dist/styles/iview.css'

Vue.use(VModal, { dialog: true })
Vue.use(iView,{enLocale})
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App },
  store
})