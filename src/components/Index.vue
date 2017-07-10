<script lang="coffee">
export default
	methods:
		toggleMenu: ->
			console.log "Toggle Menu"
			this.$emit 'toggle-menu'
</script>

<template lang="pug">
.index
	.menu-toggle(@click="toggleMenu") Show Menu
	| Index
</template>

<style lang="stylus">
.index
	flex-grow 1
	padding 1rem
</style>
