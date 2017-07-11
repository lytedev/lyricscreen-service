<script lang="coffee">
</script>

<template lang="pug">
#app: router-view
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
	position relative
	min-height 100vh

.text-center
	text-align center

p
	margin 0

p ~ p
	margin-top 1em

.page
	display flex
	position relative
	min-height 100vh

	.content
		flex-grow 1
		padding 1rem
</style>
