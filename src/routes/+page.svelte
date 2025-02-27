<script lang="ts">
	import { classList } from "$lib/classList";
    import OptionSelector from "$lib/imageConfiguration/OptionSelector.svelte";
	import LoadingModal from "$lib/LoadingModal.svelte";
	import { loadingState } from "$lib/loadingState.svelte";
    import ImageViewer from "$lib/preview/ImageViewer.svelte";
    import TextPreview from "$lib/preview/TextPreview.svelte";

    let customOpen = $state(true);

    let customClass = $derived(customOpen ? "p-3 h-full" : "h-8 p-0 overflow-hidden")

    function generateImage() {
        customOpen = !customOpen

        fetch("/api/generateImage", {
            method: "GET",
        }).then((data) => {
                if (data.ok) {
                    loadingState.loading = false;
                } else {
                    loadingState.loading = false;
                    alert("An error occured");
                }
            }
        );
    }
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

<main class="flex h-full flex-1 gap-3 justify-evenly overflow-hidden flex-col xl:flex-row">
    <OptionSelector 
        class="transition-all xl:p-3 xl:h-auto xl:max-h-full overflow-auto [&::-webkit-scrollbar]:w-1 [&::-webkit-scrollbar-track]:bg-transparent [&::-webkit-scrollbar-thumb]:bg-linear-to-bl [&::-webkit-scrollbar-thumb]:from-amber-700 [&::-webkit-scrollbar-thumb]:to-orange-600 [&::-webkit-scrollbar-thumb]:rounded-full {customClass}"
        onclick={() => generateImage()}
        >
        <div class="w-full xl:hidden">
            <button class="w-full cursor-pointer" onclick="{() => customOpen = !customOpen}">
                {customOpen ? "Close" : "Open"}
            </button>
        </div>
    </OptionSelector>

    <div class="flex gap-3 rounded-lg flex-1 md:flex-row flex-col w-full overflow-auto [&::-webkit-scrollbar]:w-1 [&::-webkit-scrollbar-track]:bg-transparent [&::-webkit-scrollbar-thumb]:bg-linear-to-bl [&::-webkit-scrollbar-thumb]:from-amber-700 [&::-webkit-scrollbar-thumb]:to-orange-600 [&::-webkit-scrollbar-thumb]:rounded-full">
        <ImageViewer aspectRatio="aspect-1080/1920" skeleton={loadingState.loading} src="https://placehold.co/1080x1920" alt="un placeholder" />

        <div class="flex flex-1 flex-col gap-3 md:overflow-auto [&::-webkit-scrollbar]:w-1 [&::-webkit-scrollbar]:h-1 [&::-webkit-scrollbar-track]:bg-transparent [&::-webkit-scrollbar-thumb]:bg-linear-to-bl [&::-webkit-scrollbar-thumb]:from-amber-700 [&::-webkit-scrollbar-thumb]:to-orange-600 [&::-webkit-scrollbar-thumb]:rounded-full">

            <ImageViewer src="https://placehold.co/1920x1080" alt="placeholder" skeleton={loadingState.loading}/>

            <TextPreview class="flex-1" text="Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit, tempora ex perferendis pariatur doloremque rerum ea magni esse molestias, aliquam deserunt corporis accusamus accusantium, ratione ullam voluptates nihil possimus praesentium?
At deserunt eius consectetur! Aperiam earum deleniti eos minus ipsum reiciendis consequatur facilis tenetur, voluptatum alias distinctio perferendis saepe deserunt nam nemo obcaecati? Doloribus eum tempora quasi voluptas incidunt repellendus?
Aut doloremque dolor sunt! Similique, fugit aut! Animi reiciendis quod quae modi ea repellendus optio dolorem, rem laboriosam dignissimos perferendis ex, impedit blanditiis magnam. Magnam, commodi ullam. Fugit, tempora eos?
Sunt quaerat possimus voluptas consequatur dicta atque repudiandae debitis culpa quam voluptates porro, ullam maxime doloremque cum modi quasi ipsam vel quidem, aliquid velit dolores unde. Dolor doloremque deserunt distinctio.
Labore odit officia adipisci deleniti ad quos reprehenderit neque necessitatibus esse hic, possimus sunt perspiciatis cumque natus. Vero ducimus at corporis. Velit illum voluptate nesciunt laborum autem unde perspiciatis non.
Fugit placeat aspernatur neque iste totam eaque. Ea recusandae nisi minima architecto adipisci beatae sed dicta, rerum voluptatem at, fugit est voluptate. Quisquam cum corporis dolorem? Labore veritatis aliquid enim.
Atque iure, voluptatibus deleniti ea ducimus iusto laudantium, numquam voluptas earum placeat suscipit qui dolor architecto provident saepe necessitatibus id maiores. Eligendi dolorum voluptas fugit, repudiandae vitae numquam repellat aliquam.
Ab perferendis ipsam ad quae sint placeat debitis tempora nulla. Sapiente facilis nemo recusandae quam exercitationem eaque neque totam quis molestias iure? Velit qui cum perspiciatis temporibus delectus est accusantium!
Facilis aperiam unde, voluptatibus delectus soluta laboriosam nisi repudiandae reprehenderit. Eaque voluptas quas et reprehenderit molestias. Natus, voluptatem repellendus aut amet cum impedit provident nemo nobis eligendi doloribus, blanditiis eum.
Enim temporibus tempore sed blanditiis. Aspernatur enim nesciunt asperiores fuga culpa explicabo doloremque adipisci cupiditate dolores! Facilis doloremque ea molestiae explicabo quibusdam odit asperiores beatae tenetur ex iusto, distinctio autem.
Dolores magni blanditiis ut illo officiis earum. Exercitationem distinctio odio veritatis dignissimos numquam quaerat corporis consectetur minus nostrum, nobis, sunt quis non dicta ducimus facere nulla in, voluptates consequuntur eveniet!
Incidunt architecto temporibus consectetur pariatur distinctio libero. Reprehenderit, animi assumenda! Similique minima reprehenderit provident quibusdam ipsum minus, ea delectus qui expedita in libero temporibus, modi reiciendis necessitatibus nemo molestias nulla!
Magnam dolorum repellat libero laborum doloribus qui incidunt omnis, nemo voluptatem suscipit magni voluptates, ipsa tenetur ab. Quaerat consequuntur dolor at animi! Aliquid nesciunt quasi esse fuga inventore! Impedit, voluptas.
A labore nostrum non dicta est ea praesentium error, recusandae ratione odit quisquam, vel minus, voluptas ducimus hic facere ullam consectetur! Similique asperiores sint porro explicabo velit exercitationem neque molestiae!
Eligendi, facilis in hic et quaerat, dignissimos voluptate unde sed numquam error reiciendis obcaecati nemo illo eum neque eaque accusantium blanditiis optio repudiandae? Vero non sequi voluptate accusamus repellendus cum!
Esse maiores quod minus sed praesentium accusamus. Ducimus nam praesentium fugiat amet fugit quo nemo consequatur, eveniet blanditiis maxime quas, consectetur explicabo ipsum possimus. Animi modi adipisci similique eaque tenetur.
Commodi iusto praesentium voluptate eum illo quia eos, porro earum corporis, facere reprehenderit rem molestias eveniet maiores eaque minus magnam officia! Facere a neque impedit temporibus ducimus qui laboriosam saepe!
Quam consequatur voluptate minima blanditiis, nulla molestias iure, voluptatem perferendis, odio assumenda nisi esse quasi dolorem aliquam. " skeleton={loadingState.loading}/>
        </div>
    </div>

    <LoadingModal />
</main>

