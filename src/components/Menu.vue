<script lang="coffee">
import AboutModal from '@/components/modals/About'
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
		showAbout: false
	computed:
		songs: -> this.$store.getters.currentSongs
	components:
		Logo: Logo
		AboutModal: AboutModal
		Btn: Button
	methods:
		closeModal: ->
			this.showAbout = false
</script>

<template lang="pug">
.menu(:class="{ shown: show }")
	header
		.title {{ title }}
		.subtitle(v-show="subtitle.length > 0") {{ subtitle }}
	slot
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
	opacity 0

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

		li
			padding 1rem
			cursor pointer
			transition background-color 0.5s ease

			&:hover
				background-color #333

			&.separator
				padding 0
				border-bottom solid 1px #444

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
