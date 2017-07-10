<script lang="coffee">
import MainMenu from '@/components/MainMenu'
import AppHead from '@/components/AppHead'

export default
	name: 'app'
	data: ->
		showMenu: false
	components:
		AppHead: AppHead
		MainMenu: MainMenu
	methods:
		toggleMenu: ->
			console.log "App toggleMenu"
			this.showMenu = not this.showMenu

</script>

<template lang="pug">
#app
	app-head
	main-menu(:show="showMenu")
	router-view(v-on:toggle-menu="toggleMenu")
</template>

<style lang="stylus">
@import 'variables.styl'
@import url('https://fonts.googleapis.com/css?family=Lato:300,400,700')

html
	font-size 62.5%

body
	margin 0

	background-color #111111

	font 1.6rem Lato
	color #ffffff
	text-shadow 0rem 0.1rem 0.1rem #000

	@media screen and (min-width: $desktop-breakpoint)
		font-size 1.8rem

#app
	display flex
	flex-wrap wrap
	position relative
	min-height 100vh
</style>
