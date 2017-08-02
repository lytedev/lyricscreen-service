import Vue from 'vue'
import Router from 'vue-router'

import Index from '@/components/Index'

Vue.use Router

# TODO: login/register routes that open the login/register modal
export default new Router
	routes: [
		{
			path: '/'
			name: 'index'
			component: Index
		}
	]
