async function test() {
    let response = await fetch('https://api.github.com/repos/quantanhoi/url_alias_store');
    let data = await response.json();
    console.log(data.description);
}
test();