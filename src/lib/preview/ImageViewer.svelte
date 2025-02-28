<script lang="ts">
	import ImageSkeleton from '$lib/simpleComponent/ImageSkeleton.svelte';
	import { onMount } from 'svelte';

	const {
		src,
		alt,
		skeleton = false,
		class: classes = '',
		aspectRatio = 'aspect-1920/1080',
		name
	} = $props();

	let img: HTMLImageElement | null = $state(null);

	
	let isLoaded = $state(false);
	let onload = $state(() => {
		isLoaded = true;
	});


	onMount(() => {
		if (!skeleton) {
			getImage();
		}
	});

	export function getImage() {
		isLoaded = false;
		// I don't know why, but this setTimeout is necessary to make the image update
		// without it, the image will not update and stay as the old image
		setTimeout(() => {
				img = new Image();
				img.src = src;
		}, 0);
	}

	function saveToDisk() {
		if (img) {
			const link = document.createElement('a');
			link.href = img.src;
			link.download = name + '.png';
			link.target = '_blank';
			link.click();
		}
	}
</script>

{#if !skeleton}
	<div class="relative overflow-hidden">
		<img src={img ? img.src : src} {onload} {alt} class="peer rounded-lg xl:max-h-full {classes} {!isLoaded ? "hidden" : ""}" />

		<button class="absolute bottom-3 left-1/2 -translate-x-1/2 bg-slate-900 p-1 px-2 rounded-lg hover:translate-y-0 hover:bg-slate-800 cursor-pointer translate-y-15 transition peer-hover:translate-y-0" onclick={saveToDisk}>
			Download
		</button>
	</div>
{/if}
{#if skeleton || !isLoaded}
	<ImageSkeleton aspectratio={aspectRatio} />
{/if}
