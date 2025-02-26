<script lang="ts">
    import WeekIndication from "./WeekIndication.svelte";
    import DayOption from "./DayOption.svelte";
	import type { DayOptions } from "./type";
    const { class: class_ = ""} = $props();

    const weekOption : {label: string, space: DayOptions[]}[] = $state(["lundi", "mardi", "mercredi", "jeudi", "vendredi", "pub"].map((day) => {        
        return {
            label: day,
            space: Array(2).fill(0).map(() => {
                return {
                    is_used: false,
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

    <button class="mt-3 mx-auto flex items-center rounded-md bg-slate-800 py-2 px-4 border border-transparent text-center text-sm text-white transition-all shadow-sm hover:shadow-lg focus:bg-slate-700 focus:shadow-none active:bg-slate-700 hover:bg-slate-700 active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-4 h-4 mr-1.5">
        <path fill-rule="evenodd" d="M7.5 6v.75H5.513c-.96 0-1.764.724-1.865 1.679l-1.263 12A1.875 1.875 0 0 0 4.25 22.5h15.5a1.875 1.875 0 0 0 1.865-2.071l-1.263-12a1.875 1.875 0 0 0-1.865-1.679H16.5V6a4.5 4.5 0 1 0-9 0ZM12 3a3 3 0 0 0-3 3v.75h6V6a3 3 0 0 0-3-3Zm-3 8.25a3 3 0 1 0 6 0v-.75a.75.75 0 0 1 1.5 0v.75a4.5 4.5 0 1 1-9 0v-.75a.75.75 0 0 1 1.5 0v.75Z" clip-rule="evenodd"></path>
        </svg>
       
        Generate Images
    </button>
</div>