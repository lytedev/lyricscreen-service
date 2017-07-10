<script lang="coffee">
</script>

<template lang="pug">
.logo: a(href="/")
	strong Lyric
	| Screen
</template>

<style lang="stylus">
@require '~@/variables'

.logo
	text-align center
	margin-top auto
	margin-bottom 1rem
	font-weight 300
	font-size 3.2rem

	strong
		color $brand-primary-color-light
		transition text-shadow 0.5s ease, color 0.5s ease
		text-shadow 0.1rem 0.0rem 0.5rem alpha($brand-primary-color-dark, 1.0)

	a
		color inherit
		text-decoration none

	&:hover
		strong
			text-shadow 0.1rem 0.0rem 1rem $brand-primary-color
</style>
