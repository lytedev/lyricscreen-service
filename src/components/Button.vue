<script lang="coffee">
export default
	methods:
		click: (e) ->
			this.$emit 'click', e
</script>

<template lang="pug">
.button(v-on:click="click"): slot
</template>

<style lang="stylus">
@require '~@/variables'

.button
	display inline-block
	background-color $brand-primary-color
	padding 0.8rem 1.5rem
	margin 0 0.5rem
	border-radius 0.3rem
	cursor pointer
	transition all 0.5s ease

	&:hover
		background-color $brand-primary-color-light
</style>
