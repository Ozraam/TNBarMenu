<script lang="ts">
    const {
        src,
        alt,
        class: classes = "",
    } = $props();
</script>

<img src="{src}" alt="{alt}" class="{classes} max-h-full rounded-lg" />
