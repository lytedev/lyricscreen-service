<script lang="coffee">
import _ from 'lodash'
import Modal from '@/components/Modal'
import Logo from '@/components/Logo'
import Button from '@/components/Button'

import pkgInfo from '@/../package.json'

export default
	props:
		view:
			default: 'login'
		show:
			default: false
	data: ->
		version: pkgInfo.version
		overrideView: null
	computed:
		title: -> if @_view == 'login' then "Login" else "Register"
		ctaText: -> if @_view == 'login' then "Login" else "Register"
		_view: -> if @overrideView? then @overrideView else @view
	components:
		Logo: Logo
		Modal: Modal
		Btn: Button
	updated: (args...) ->
		if not @show then return
		if not 'querySelectorAll' of @$el then return

		inputs = Array.prototype.slice.call @$el.querySelectorAll 'input, a[href], button, select, textarea', 0
		inputs = inputs.sort (a, b) ->
			a.tabIndex - b.tabIndex

		if inputs.length > 0
			first = _.head inputs
			last = _.last inputs

			if 'select' in first
				first.select()
			else
				first.focus()

			first.onkeydown = (e) ->
				if e.which == 9 and e.shiftKey
					e.preventDefault()
					# TODO: should select() if possible?
					last.focus()

			last.onkeydown = (e) ->
				if  e.which == 9 and !e.shiftKey
					e.preventDefault()
					# TODO: should select() if possible?
					first.focus()

	methods:
		submitForm: (args...) ->
			console.log args

		close: (args...) ->
			@overrideView = null
			@$emit 'close'
</script>

<template lang="pug">
modal#login-register-modal(:title="title" :show="show" @close="close")
	div(slot="content")
		.login-form(v-if="_view == 'login'")
			form
				.field
					label(for="email")
					input(id="email" name="email" placeholder="Email" tabindex="100")
				.field
					label(for="pass")
					input(id="pass" name="pass" type="password" placeholder="Password" tabindex="101")
			p.small.center Need an account?
				btn.small.negative(@click="overrideView = 'register'" tabindex="105") Register Here!

		.register-form(v-if="_view == 'register'")
			form
				//- TODO: captcha pliss
				//- .field
					label(for="username")
					input(id="username" name="username" placeholder="Username" tabindex="100")
				.field
					label(for="email")
					input(id="email" name="email" placeholder="Email" tabindex="100")
				.field
					label(for="pass")
					input(id="pass" name="pass" type="password" placeholder="Password" tabindex="101")
			p.small.center Have an account?
				btn.small.negative(@click="overrideView = 'login'" tabindex="104") Login Here!
	div(slot="actions")
		btn(@click="submitForm" tabindex="102") {{ ctaText }}
		btn(@click="close" tabindex="103").negative Close
</template>

<style lang="stylus">
@require '~@/variables'


</style>

