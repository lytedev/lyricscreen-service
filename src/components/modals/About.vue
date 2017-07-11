<script lang="coffee">
import Modal from '@/components/Modal'
import Logo from '@/components/Logo'
import Button from '@/components/Button'

import pkgInfo from '@/../package.json'

export default
	props:
		show:
			default: false
	data: ->
		version: pkgInfo.version
	components:
		Logo: Logo
		Modal: Modal
		Btn: Button
	methods:
		close: (args...) ->
			this.$emit 'close'
</script>

<template lang="pug">
modal#about-modal(title="About" :show="show" @close="close")
	div(slot="content")
		logo
		p.text-center v{{ version }}
	div(slot="actions")
		btn(@click.stop.prevent="close") Close
</template>

<style lang="stylus">
#about-modal
	.content
		padding 2rem
</style>
