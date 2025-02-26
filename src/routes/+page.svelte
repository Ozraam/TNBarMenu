<script lang="ts">
	import { classList } from "$lib/classList";
    import OptionSelector from "$lib/OptionSelector.svelte";
    import ImageViewer from "$lib/preview/ImageViewer.svelte";
    import TextPreview from "$lib/preview/TextPreview.svelte";
</script>

<svelte:body use:classList={["h-screen", "flex", "flex-col", "bg-linear-to-bl", "from-orange-800", "to-blue-600", "text-white", "overflow-hidden", "p-3", "gap-3"]} />


<header class="flex justify-between p-3 bg-gray-600/20 rounded-lg bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-20 border border-gray-100 to-">
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

<main class="flex h-full flex-1 gap-3 justify-evenly overflow-hidden">
    <OptionSelector class="overflow-auto [&::-webkit-scrollbar]:w-1 [&::-webkit-scrollbar-track]:bg-transparent [&::-webkit-scrollbar-thumb]:bg-linear-to-bl [&::-webkit-scrollbar-thumb]:from-amber-700 [&::-webkit-scrollbar-thumb]:to-orange-600 [&::-webkit-scrollbar-thumb]:rounded-full" />

    <ImageViewer src="https://placehold.co/1080x1920" alt="un placeholder" />

    <div class="flex-1 flex flex-col gap-3">

        <ImageViewer src="https://placehold.co/1920x1080" alt="placeholder" />

        <TextPreview class="flex-1" text="Tet$§"/>
    </div>
</main>