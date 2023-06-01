function showNotification(title, message, type) {
    swal({
        title: title,
        text: message,
        icon: type,
        button: "OK",
    });
}