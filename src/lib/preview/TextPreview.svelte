<script lang="ts">
    const {
        class: classes = "",
        text,
    } = $props();
</script>

<p class="{classes} p-3 bg-gray-600/20 rounded-lg bg-clip-padding backdrop-filter backdrop-blur-md border border-gray-100">
    {text}
</p>