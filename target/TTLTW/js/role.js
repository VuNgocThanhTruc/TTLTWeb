// click vào thẻ td => focus vào ckeckbox(checked)
const tds = document.querySelectorAll(".td-role");
const cbs = document.querySelectorAll(".cb-role");
tds.forEach((e) => {
    e.addEventListener("click", () => {
        if(e.children[0].getAttribute("disabled") == null){
            e.children[0].checked = !e.children[0].checked;
        }
    })
})
cbs.forEach((e) => {
    e.addEventListener("click", () => {
        console.log("attr dis: "+e.getAttribute("disabled"))
        e.checked = !e.checked;
    })
})

function confirmNotify(message) {
    return confirm(message);
}
