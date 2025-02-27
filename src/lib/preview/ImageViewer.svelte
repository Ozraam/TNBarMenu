<script lang="ts">
    const {
        src,
        alt,
        class: classes = "",
    } = $props();
</script>

<img src="{src}" alt="{alt}" class="xl:max-h-full rounded-lg {classes}" />
