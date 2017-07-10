<script lang="coffee">
import Modal from '@/components/Modal'
import Logo from '@/components/Logo'
import Button from '@/components/Button'

export default
	props:
		show:
			default: false
	data: ->
		showModal: false
		title: "Song List"
		subtitle: "Playlist: Default"
	computed:
		songs: -> this.$store.getters.currentSongs
	components:
		Logo: Logo
		Modal: Modal
		Btn: Button
	methods:
		closeModal: ->
			this.showModal = false
</script>

<template lang="pug">
#main-menu(v-show="show")
	header
		.title {{ title }}
		.subtitle(v-show="subtitle.length > 0") {{ subtitle }}
	modal(v-bind:show="showModal" v-bind:on-close="closeModal" title="Modal")
		div(slot="content")
			p This is a test.
			p So is this.
		div(slot="actions")
			btn(@click.stop.prevent="closeModal") Cancel
			btn(@click.stop.prevent="closeModal") OK
	ul
		li(v-for="s in songs") {{ s.name }}
		.separator
		li Add Song...
	logo
</template>

<style lang="stylus">
@require '~@/variables'

#main-menu
	width 30rem
	height 100vh
	border-right solid 0.1rem $brand-primary-color
	box-shadow 0.1rem 0.0rem 1rem alpha($brand-primary-color-dark, 0.5)
	overflow auto

	display flex
	flex-direction column

	opacity 1

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

		.separator
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
