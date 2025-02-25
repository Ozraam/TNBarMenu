<script lang="ts">
	import { classList } from "$lib/classList";
    import OptionSelector from "$lib/OptionSelector.svelte";
    import ImageViewer from "$lib/preview/ImageViewer.svelte";
    import TextPreview from "$lib/preview/TextPreview.svelte";
</script>

<svelte:body use:classList={["min-h-screen", "flex", "flex-col"]} />


<header class="flex justify-between m-3 p-3 bg-amber-600/20 rounded-md bg-clip-padding backdrop-filter backdrop-blur-md bg-opacity-20 border border-gray-100">
    <h1>
        Menu Bar'bare
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

<main class="p-3 flex h-full flex-1">
    <OptionSelector />

    <div>
        <ImageViewer />

        <ImageViewer />

        <TextPreview />

        <TextPreview />
    </div>
</main>