<script lang="coffee">
import LoginRegisterModal from '@/components/modals/LoginRegister'
import Logo from '@/components/Logo'
import Button from '@/components/Button'

export default
	props:
		show:
			default: true
		title:
			default: "Menu Title"
		subtitle:
			default: "Menu Subtitle"
	data: ->
		showLoginRegister: this.$route.name == 'login' or
			this.$route.name == 'register'
		lrmView: if this.$route.name == 'register' then 'register' else 'login'
	computed:
		songs: -> this.$store.getters.currentSongs
	components:
		Logo: Logo
		LoginRegisterModal: LoginRegisterModal
		Btn: Button
	methods:
		showLoginRegisterModal: (view) ->
			this.lrmView = view
			this.showLoginRegister = true

		closeLoginRegisterModal: ->
			this.showLoginRegister = false
</script>

<template lang="pug">
.menu(:class="{ shown: show }")
	login-register-modal(:show="showLoginRegister" @close="closeLoginRegisterModal" :view="lrmView")
	header
		.title {{ title }}
		.subtitle(v-show="subtitle.length > 0") {{ subtitle }}
	slot
	slot(name="user")
		ul
			li.separator
			li.row
				btn.item(tabindex="0" @click="showLoginRegisterModal('login')") Login
				btn.item(tabindex="0" @click="showLoginRegisterModal('register')") Register
</template>

<style lang="stylus">
@require '~@/variables'

.menu
	width 30rem
	height 100vh
	border-right solid 0.1rem $brand-primary-color
	box-shadow 0.1rem 0.0rem 1rem alpha($brand-primary-color-dark, 0.5)
	overflow auto

	transition margin-left 0.5s cubic-bezier(0, 0.73, 0, 0.99), opacity 1.5s cubic-bezier(0, 0.73, 0, 0.99)
	margin-left -30rem
	opacity 1

	display flex
	flex-direction column


	&.shown
		margin-left 0
		opacity 1

	.bottom
		margin-top auto

	ul
		list-style none
		padding 0
		margin 0

		button
			background transparent
			border 0
			padding 0
			margin 0

		li
			padding 1rem
			cursor pointer
			transition background-color 0.5s ease

			&:hover
				background-color #333

			&.separator
				padding 0
				border-bottom solid 1px #444

			&.row
				padding 0rem
				display flex
				cursor auto

				&:hover
					background-color inherit

				.item
					padding 1rem
					flex-grow 1
					cursor pointer
					transition background-color 0.5s ease

					~ .item
						border-left solid 0.1rem #444

					&:hover
						background-color #333

	> header
		text-align center
		background-color #222
		border-bottom solid 1px #444
		text-transform uppercase
		font-size 2.4rem
		font-weight 300
		padding 0.5rem
		letter-spacing 0.1em

		.subtitle
			text-align center
			margin-top @padding
			font-size 1.4rem
			letter-spacing 0em
</style>
