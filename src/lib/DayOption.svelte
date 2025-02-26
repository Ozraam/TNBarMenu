<script lang="ts">
	import SwitchToggle from './simpleComponent/SwitchToggle.svelte';
	import Checkbox from './simpleComponent/Checkbox.svelte';

	import type { DayOptions } from './type';
	import Select from './simpleComponent/Select.svelte';
	import Textarea from './simpleComponent/Textarea.svelte';
	import SpaceConfiguration from './SpaceConfiguration.svelte';

	const {
		label,
        key,
		space = $bindable([])
	}: {
		label: string;
        key: string;
		space: DayOptions[];
	} = $props();

	$effect(() => {
		if (!space[0].is_used) {
			space[1].is_used = false;
		}
	});
</script>

<div>
	<h3 class="capitalize font-bold text-lg">
		{label}
	</h3>
	<SpaceConfiguration label="Utiliser l'emplacement haut" key="{key}-space-1" bind:space={space[0]} class="" />
	{#if space[0].is_used}
		<SpaceConfiguration label="Utiliser l'emplacement bas" key="{key}-space-2" bind:space={space[1]} class="mt-2" />
	{/if}
</div>
