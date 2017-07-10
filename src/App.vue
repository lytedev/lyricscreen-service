<script lang="coffee">
export default
	name: 'app'
</script>

<template lang="pug">
	#app
		app-head
		main-menu
		router-view
</template>

<style lang="stylus">
@import 'variables.styl'
@import url('https://fonts.googleapis.com/css?family=Lato')

html
	font-size 62.5%

body
	margin 0
	background-color #111111
	color #ffffff
	font 1.6rem Lato

	@media screen and (min-width: $desktop-breakpoint)
		font-size 1.8rem
</style>
