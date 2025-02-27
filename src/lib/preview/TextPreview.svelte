<script lang="ts">
	import TextSkeleton from "$lib/simpleComponent/TextSkeleton.svelte";

    const {
        class: classes = "",
        text,
        skeleton = false
    } = $props();
</script>

<div class="{classes} relative p-3 bg-gray-600/20 rounded-lg bg-clip-padding backdrop-filter backdrop-blur-md border-t-transparent border border-gray-100 flex-1">
    <h2 class="before:content[' '] after:content[' '] text-blue-gray-400 before:border-blue-gray-200 after:border-blue-gray-200 pointer-events-none absolute -top-1.5 left-0 flex h-full w-full text-[11px] leading-tight font-normal transition-all select-none before:pointer-events-none before:mt-[6.5px] before:mr-1 before:box-border before:block before:h-1.5 before:w-2.5 before:rounded-tl-lg before:border-t before:border-l before:transition-all after:pointer-events-none after:mt-[6.5px] after:ml-1 after:box-border after:block after:h-1.5 after:w-2.5 after:flex-grow after:rounded-tr-lg after:border-t   ">
        Mail preview
    </h2>
    {#if !skeleton}
        <p class="overflow-auto">
            {text}
        </p>
    {:else}
        <TextSkeleton />
    {/if}
</div>