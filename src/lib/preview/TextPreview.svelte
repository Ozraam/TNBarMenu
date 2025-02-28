<script lang="ts">
	import TextSkeleton from "$lib/simpleComponent/TextSkeleton.svelte";

    const {
        class: classes = "",
        text,
        skeleton = false
    } = $props();
</script>

<div class="{classes} relative p-3 pt-4 bg-gray-600/20 rounded-lg bg-clip-padding backdrop-filter backdrop-blur-md border border-gray-100 flex-1">
    <h2 class="text-blue-gray-400 pointer-events-none absolute -top-1.5 translate-y-1.5 left-3 flex text-[11px] leading-tight font-normal transition-all select-none">
        Mail preview
    </h2>

    <div class="overflow-auto max-h-full [&::-webkit-scrollbar]:w-1 [&::-webkit-scrollbar-track]:bg-transparent [&::-webkit-scrollbar-thumb]:bg-linear-to-bl [&::-webkit-scrollbar-thumb]:from-amber-700 [&::-webkit-scrollbar-thumb]:to-orange-600 [&::-webkit-scrollbar-thumb]:rounded-full">
        {#if !skeleton}
            <p class="whitespace-pre">
                {text}
            </p>
        {:else}
            <TextSkeleton />
        {/if}
    </div>
</div>