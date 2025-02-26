<script lang="ts">
	import { classList } from "$lib/classList";
    import OptionSelector from "$lib/OptionSelector.svelte";
    import ImageViewer from "$lib/preview/ImageViewer.svelte";
    import TextPreview from "$lib/preview/TextPreview.svelte";
</script>

<svelte:body use:classList={["h-screen", "flex", "flex-col", "bg-linear-to-bl", "from-orange-800", "to-blue-600", "text-white", "overflow-hidden"]} />


<header class="flex justify-between m-3 p-3 bg-gray-600/20 rounded-lg bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-20 border border-gray-100 to-">
    <h1>
        Menu
    </h1>

    <nav>
        <ul class="flex gap-6">
            <li>
                <a href="/">Home</a>
            </li>
            <li>
                <a href="/about">About</a>
            </li>
            <li>
                <a href="/contact">Contact</a>
            </li>
        </ul>
    </nav>
</header>

<main class="p-3 flex h-full flex-1 justify-evenly overflow-hidden">
    <OptionSelector class="overflow-auto [&::-webkit-scrollbar]:w-1 [&::-webkit-scrollbar-track]:bg-transparent [&::-webkit-scrollbar-thumb]:bg-linear-to-bl [&::-webkit-scrollbar-thumb]:from-amber-700 [&::-webkit-scrollbar-thumb]:to-orange-600 [&::-webkit-scrollbar-thumb]:rounded-full" />

    <div class="flex-1">
        <ImageViewer />

        <ImageViewer />

        <TextPreview />

        <TextPreview />
    </div>
</main>