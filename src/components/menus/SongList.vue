<script lang="coffee">
import Menu from '@/components/Menu'
import Button from '@/components/Button'
import AboutModal from '@/components/modals/About'

export default
	props:
		show:
			default: true
	data: ->
		title: 'Song List'
		showAbout: this.$route.name == 'about'
	computed:
		playlist: -> this.$store.getters.currentPlaylist
		songs: -> this.$store.getters.currentSongs
		subtitle: -> 'Playlist: ' + this.playlist.name
	methods:
		closeAbout: -> this.showAbout = false
	components:
		Btn: Button
		SideMenu: Menu
		AboutModal: AboutModal
</script>

<template lang="pug">
side-menu(:show="show" title="Song List" :subtitle="subtitle")
	about-modal(:show="showAbout" @close="closeAbout")
	ul
		li(v-for="s in songs"): btn {{ s.name }}
		li.separator
		li: btn Add Song...

	.bottom
		ul
			li.separator
			li(@click="showAbout = true") About
</template>

<style lang="stylus">
@require '~@/variables'

#main-menu
	width 30rem
	height 100vh
	border-right solid 0.1rem $brand-primary-color
	box-shadow 0.1rem 0.0rem 1rem alpha($brand-primary-color-dark, 0.5)
	overflow auto

	transition margin-left 0.5s $slow-ease-out, opacity 1.5s $slow-ease-out
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
			button
				display block
				width 100%

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
