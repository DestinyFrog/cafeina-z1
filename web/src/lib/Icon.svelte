<script lang="ts">
    let { title, icon, action } = $props()
</script>

<button class="icon" onclick={action}>
    <img alt="icon" src={icon} />
    <p>{title}</p>
</button>

<style>
    .icon {
        width: 80px;
        height: 80px;
        padding: 4px;
        display: flex;
        flex-direction: column;
        background-color: transparent;
        border: 0;
    }

    .icon:hover {
        background-color: #ffffff11;
    }

    .icon img {
        width: auto;
        max-width: 100%;
        height: 80%;
        padding: 6px 0px;
    }

    .icon p {
        color: white;
        text-align: center;
        font-size: 0.7rem;
    }
</style>
