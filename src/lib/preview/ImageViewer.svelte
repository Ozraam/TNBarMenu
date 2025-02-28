<script lang="ts">
	import ImageSkeleton from '$lib/simpleComponent/ImageSkeleton.svelte';
	import { onMount } from 'svelte';

	const {
		src,
		alt,
		skeleton = false,
		class: classes = '',
		aspectRatio = 'aspect-1920/1080'
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
		fetch(src)
			.then((response) => {
				if (response.ok) {
					return response.blob();
				}
				throw new Error('Network response was not ok.');
			})
			.then((blob) => {
				const url = URL.createObjectURL(blob);
				img = new Image();
				img.src = url;
			})
			.catch((error) => {
				console.error('There has been a problem with your fetch operation:', error);
			});
	}
</script>

{#if !skeleton}
	<!-- <img {src} {alt} class="rounded-lg xl:max-h-full {classes}"  /> -->
	<img src={img ? img.src : src} {onload} {alt} class="rounded-lg xl:max-h-full {classes} {!isLoaded ? "hidden" : ""}" />
{/if}
{#if skeleton || !isLoaded}
	<ImageSkeleton aspectratio={aspectRatio} />
{/if}
