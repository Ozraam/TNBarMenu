<script lang="ts">
	import Checkbox from "$lib/simpleComponent/Checkbox.svelte";
	import Select from "$lib/simpleComponent/Select.svelte";
	import SwitchToggle from "$lib/simpleComponent/SwitchToggle.svelte";
	import Textarea from "$lib/simpleComponent/Textarea.svelte";
	import type { DayOptions } from "$lib/type";

    let {
        label,
        key,
        space = $bindable(),
        class: classes = "",
    } : {
        label: string;
        key: string;
        space: DayOptions;
        class: string;
    }= $props();

</script>

<div class="{classes}">
    <SwitchToggle
        label={label}
        key={key}
        bind:checked={space.is_used}
        class="mb-2"
    />
    {#if space.is_used}
        <Checkbox label="Est un repas" key="{key}-meal" bind:checked={space.is_meal} />

        {#if space.is_meal}
            <Select 
                key="{key}-meal-select"
                label="Repas"
                options={[]}
                bind:selected={space.meal}
            />
        {:else}
            <Textarea
                key="{label}-textarea"
                label="Texte"
                bind:value={space.text}
            />
        {/if}

    {/if}
</div>