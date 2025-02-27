<script lang="ts">
	import ImageSkeleton from '$lib/simpleComponent/ImageSkeleton.svelte';

	const { src, alt, skeleton = false, class: classes = '', aspectRatio="aspect-1920/1080" } = $props();
</script>

{#if !skeleton}
	<img {src} {alt} class="rounded-lg xl:max-h-full {classes}" />
{:else}
	<ImageSkeleton aspectratio={aspectRatio} />
{/if}
