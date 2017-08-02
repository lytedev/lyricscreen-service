<script lang="coffee">
export default
	methods:
		click: (e) ->
			this.$emit 'click', e
</script>

<template lang="pug">
button(v-on:click="click"): slot
</template>

<style lang="stylus">
@require '~@/variables'

button
	display inline-block
	border 0
	font inherit
	color inherit
	background-color $brand-primary-color
	padding 0.8rem 1.5rem
	margin 0 0.5rem
	border-radius 0.3rem
	cursor pointer
	transition all 0.5s ease
	user-select none

	&.small
		font-size 1.2rem
		padding 0.6rem 0.8rem

	&.negative
		background-color #333

		&:hover
			background-color lighten(@background-color, 20%)

	&:hover
		background-color $brand-primary-color-light
</style>
