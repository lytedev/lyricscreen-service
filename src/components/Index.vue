<script lang="coffee">
import SongListMenu from '@/components/menus/SongList'
import Button from '@/components/Button'

export default
	components:
		Btn: Button
		SongListMenu: SongListMenu
	data: ->
		currentMenu: 'SongListMenu'
		showMenu: false
	computed:
		process: -> process
		menuButtonText: ->
			if this.isMenuShowing then 'Hide Menu'
			else 'Show Menu'
	methods:
		toggleMenu: ->
			console.log "Toggle Menu"
			this.showMenu = not this.showMenu
</script>

<template lang="pug">
.page#index-page
	component(:is="currentMenu" :show="showMenu")
	.content
		p: btn.menu-toggle(@click="toggleMenu") {{ menuButtonText }}
		p Index Page
		p {{ process }}
</template>

<style lang="stylus">
</style>
