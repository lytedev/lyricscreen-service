<script lang="coffee">
import Button from '@/components/Button'

export default
	props:
		title:
			type: String
			default: ""
		show:
			default: false
	methods:
		close: (args...) ->
			this.$emit 'close'
	components:
		Btn: Button
</script>

<template lang="pug">
.modal-root
	transition(name="fade-and-scale-down")
		.mask(@click.stop.prevent="close" v-if="show")
			.container
				.modal(@click.stop.prevent="" v-if="show")
					btn.close-button(@click.stop.prevent="close" tabindex="150") &times;
					header(v-if="title.length > 0"): | {{ title }}
					.content: slot(name="content")
					footer
						slot(name="actions")
</template>

<style lang="stylus">
@require '~@/variables'

.fade-enter-active
.fade-leave-active
	transition opacity 0.5s $slow-ease-out
.fade-enter
.fade-leave-to
	opacity 0

.fade-and-scale-down-enter-active
.fade-and-scale-down-leave-active
	transition all 0.5s $slow-ease-out
.fade-and-scale-down-enter
.fade-and-scale-down-leave-to
	opacity 0
	transform scale(1.5)

.modal-root
	.mask
		position fixed
		top 0
		left 0
		bottom 0
		right 0
		background-color rgba(0, 0, 0, 0.7)

		transform scale(1)
		opacity 1

		display flex
		justify-content center
		align-items center

		&.fade-and-scale-down-enter-active
			transition all 0.5s $slow-ease-out

		&.fade-and-scale-down-leave-active
			transition all 0.2s ease

		&.fade-and-scale-down-enter
		&.fade-and-scale-down-leave-to
			opacity 0
			transform scale(1.5)

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
			border solid 0.1rem #444
			display flex
			flex-direction column

			opacity 1
			transform scale(1)

			@media screen and (min-width: 1024px)
				max-width 600px
				min-width 400px

			.close-button
				background transparent
				border 0
				position absolute
				top 1rem
				right 0
				padding 0 0.5rem
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
