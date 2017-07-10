<script lang="coffee">
import Button from '@/components/Button'

export default
	props:
		title:
			type: String
			default: ""
		onClose:
			required: true
			type: Function
		showInitially: {}
		show:
			default: false
	methods:
		close: (args...) ->
			console.log "Modal.close()", args
			this.onClose args
	components:
		Btn: Button
</script>

<template lang="pug">
.modal-root(v-if="show")
	.mask(@click.stop.prevent="close")
		.container
			.modal(@click.stop.prevent="")
				.close-button(@click.stop.prevent="close") &times;
				header(v-if="title.length > 0"): | {{ title }}
				.content: slot(name="content")
				footer
					slot(name="actions")
</template>

<style lang="stylus">
@require '~@/variables'

.modal-root
	.mask
		position fixed
		top 0
		left 0
		bottom 0
		right 0
		background-color rgba(0, 0, 0, 0.7)

		display flex
		justify-content center
		align-items center

		.container
			// dunno

		.modal
			position relative
			min-width 300px
			min-height 140px
			max-width 100%
			max-height 100vh
			overflow auto
			background-color #111
			border-radius 0.3rem
			display flex
			flex-direction column

			@media screen and (min-width: 1024px)
				max-width 600px
				min-width 400px

			.close-button
				position absolute
				top 0
				right 0
				padding 1rem
				opacity 0.5
				transition opacity 0.5s ease
				cursor pointer

				&:hover
					opacity 1

			> header
				border-radius 0.3rem 0.3rem 0 0
				border-bottom solid 0.1rem #444
				padding 1rem
				background-color #222
				text-transform uppercase
				letter-spacing 0.2rem
				font-weight 300
				text-align center

			.content
				padding 1rem

			footer
				margin-top auto
				border-top solid 0.1rem #222
				padding 1rem
				padding-right 0.5rem
				text-align right

</style>
