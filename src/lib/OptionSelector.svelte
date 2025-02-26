<script lang="ts">
    import WeekIndication from "./WeekIndication.svelte";
    import DayOption from "./DayOption.svelte";
	import type { DayOptions } from "./type";
	import { flip } from "svelte/animate";
    const { class: class_ = ""} = $props();

    const weekOption : {label: string, space: DayOptions[]}[] = $state(["lundi", "mardi", "mercredi", "jeudi", "vendredi", "pub"].map((day) => {        
        return {
            label: day,
            space: Array(2).fill(0).map(() => {
                return {
                    is_used: true,
                    is_meal: true,
                    text: "",
                    meal: ""
                };
            }),
        };
    }));
</script>

<div class="p-3 bg-gray-600/20 rounded-lg bg-clip-padding backdrop-filter backdrop-blur-md border border-gray-100 {class_}">
    <div class="flex justify-between gap-7">
        <h2 class="text-xl font-bold">
            Customization
        </h2>

        <WeekIndication />

    </div>

    {#each weekOption as dayOption, i}
        <DayOption label={dayOption.label} key={dayOption.label} bind:space={dayOption.space} />

        {#if i < weekOption.length - 1}
            <div class="border-t border-white/25"></div>
        {/if}
    {/each}
</div>